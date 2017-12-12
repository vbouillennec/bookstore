<?php

namespace AppBundle\Form;

use AppBundle\Entity\Hobby;
use AppBundle\Entity\OperatingSystem;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Count;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;

class ContactType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        /**
         *
         */
        $builder
            ->add('firstname', TextType::class, [
                'constraints' => [
                    new NotBlank(['message' => 'Vous devez saisir un prénom']),
                    new Length([
                        'min' => '3',
                        'minMessage' => 'Le prénom doit comporter plus de 2 lettres'])
                ]
            ])
            ->add('lastname', TextType::class, [
                'constraints' => [
                    new NotBlank(['message' => 'Vous devez saisir un nom']),
                    new Length([
                        'min' => '3',
                        'minMessage' => 'Le nom doit comporter plus de 2 lettres'])
                ]
            ])
            ->add('email', EmailType::class)
            ->add('message', TextareaType::class)
            /*
             * EntityType : permet d relier un champ à une entité
             * class : permet de definir l'entité ciblé
             * choice_label : choix de la propriété de l'entité à afficher
             *
             * choix de l'affichage
             *      expended : affichage de plusieurs champs, par défaut : false
             *      multiple : affichage de plusieurs choix, par défaut : false
             *  combination possible :
             *      liste déroulante : expanded false / multiple false
             *      boutons radio : expanded true / multiple false
             *      cases à cocher : expanded true / multiple true : obligatoire pour les many to many
             */
            ->add('hobbies', EntityType::class, [
                'class' => Hobby::class,
                'choice_label' => 'name',
                'expanded' => true,
                'multiple' => true,
                'constraints' => [
                    new Count([
                        'min' => 1,
                        'minMessage' => 'Vous devez sélectionner au minimum un loisir'
                    ])
                ]
            ])
            ->add('operating_system', EntityType::class, [
                'class' => OperatingSystem::class,
                'choice_label' => 'name',
                'expanded' => true,
                'multiple' => false
            ]);
    }

    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Contact'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_contact';
    }


}
