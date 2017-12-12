<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Contact;
use AppBundle\Form\ContactType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class ContactController extends Controller
{
    /**
     * @Route(
     *     "/contact/form",
     *     name="contact.form",
     *     defaults = {"id" = null}
     * )
     * @Route(
     *     "/contact/update/{id}",
     *     name="contact.update"
     * )
     */
    public function formAction(Request $request, $id){
        $doctrine = $this->getDoctrine();

        $entity = $id ? $doctrine->getRepository(Contact::class)->find($id) : new Contact();
        $type = ContactType::class;

        $form = $this->createForm($type, $entity);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $data = $form->getData();
            //exit(dump($data));

            //insertion dans la base
            $manager = $doctrine->getManager();

            $manager->persist($data);
            $manager->flush();


            // message de confirmation
            $id ? $this->addFlash('notice','Le contact à été modifié') : $this->addFlash('notice', 'Le contact à été ajouté');

            return $this->redirectToRoute('contacts');
        }

        return $this->render('contact/form.html.twig', [
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route(
     * "/contacts",
     * name="contacts"
     * )
     *
     * getRepository(entité ciblé) : SELECT
     * 4 methodes de sélection
     *      find(id) : récupérer un enregistrement par la PK
     *      findAll() : récupérer tous les enregistrement
     *      findBy() : récupérer un enregistrement par une liste de critères
     */
    public function indexAction(Request $request){
        $doctrine = $this->getDoctrine();
        $repository = $doctrine->getRepository(Contact::class);

        $contacts = $repository->findAll();

        //exit(dump($contacts));

        return $this->render('contact/index.html.twig', ['contacts' => $contacts]);
    }

    /**
     * @Route(
     * "/contact/delete/{id}",
     * name="contact.delete"
     * )
     */
    public function deleteAction(Request $request, $id){
        $doctrine = $this->getDoctrine();
        $repository = $doctrine->getRepository(Contact::class);

        $contact = $repository->find($id);

        $manager = $doctrine->getManager();

        $manager->remove($contact);
        $manager->flush();

        $this->addFlash('notice', "Le contact '{$contact->getFirstname()} {$contact->getLastname()}' a bien été supprimé");

        return $this->redirectToRoute('contacts');

        //return $this->render('contact/index.html.twig', ['contacts' => $contacts]);
    }
}