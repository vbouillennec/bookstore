<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Courses;
use AppBundle\Entity\Module;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class CoursesController extends Controller
{
    /**
     * @Route(
     * "/courses",
     * name="courses"
     * )
     *
     * getRepository(entité ciblé) : SELECT
     * 4 methodes de sélection
     *      find(id) : récupérer un enregistrement par la PK
     *      findAll() : récupérer tous les enregistrement
     *      findBy() : récupérer un enregistrement par une liste de critères
     */
    public function indexAction(Request $request)
    {
        $doctrine = $this->getDoctrine();
        $repository = $doctrine->getRepository(Courses::class)->testQuery();


        exit(dump($repository));

        return $this->render('courses/index.html.twig', ['courses' => $courses]);
    }

    /**
     * @Route(
     * "/course/{slug}",
     * name="course",
     * requirements = {"slug" = ".+"},
     * defaults = {"slug" = ""})
     */
    public function courseAction(Request $request, $slug)
    {
        $doctrine = $this->getDoctrine();
        $repository = $doctrine->getRepository(Courses::class);

        $course = $repository->findOneBy(['slug' => $slug]);

//        exit(dump($course->getModules()));

        return $this->render('courses/course.html.twig',
            [
                'slug' => $slug,
                'course' => $course
            ]);
    }

    /**
     * @Route(
     * "/modules",
     * name="modules"
     * )
     */
    public function modulesAction(Request $request)
    {
        $doctrine = $this->getDoctrine();
        $repository = $doctrine->getRepository(Module::class);

        $modules = $repository->findAll();

//        exit(dump($module->getCourses()));

        return $this->render('courses/modules.html.twig',
            [
                'modules' => $modules
            ]);
    }

    /**
     * @Route(
     * "/module/{name}",
     * name="module",
     * requirements = {"name" = ".+"},
     * defaults = {"name" = ""})
     */
    public function moduleAction(Request $request, $name)
    {
        $doctrine = $this->getDoctrine();
        $repository = $doctrine->getRepository(Module::class);

        $module = $repository->findOneBy(['name' => $name]);

//        exit(dump($module->getCourses()));

        return $this->render('courses/module.html.twig',
            [
                'name' => $name,
                'module' => $module
            ]);
    }
}