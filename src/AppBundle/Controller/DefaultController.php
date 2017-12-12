<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    /**
     * @Route(
     * "/",
     * name="homepage")
     */
    public function indexAction(Request $request)
    {
        // replace this example code with whatever you need
        return $this->render('default/index.html.twig');
    }

    /**
     * @Route(
     * "/hello/{nom}",
     * name="hello",
     * requirements = {"nom" = "\w+"},
     * defaults = {"nom" = "Anonyme"}
     * )
     */
    public function helloAction(Request $request, $nom)
    {
        // replace this example code with whatever you need
        return $this->render('default/hello.html.twig', ['nom' => $nom]);
    }
}
