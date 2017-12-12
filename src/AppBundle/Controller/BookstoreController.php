<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Book;
use AppBundle\Entity\Category;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class BookstoreController extends Controller
{
    /**
     * @Route(
     * "/bookstore",
     * name="bookstore"
     * )
     */
    public function indexAction(Request $request)
    {
        $doctrine = $this->getDoctrine();
        $repository = $doctrine->getRepository(Category::class);

        $categories = $repository->findAll();

//        exit(dump($repository));

        return $this->render('bookstore/index.html.twig', ['categories' => $categories]);
    }

    /**
     * @Route(
     * "/bookstore/category/{slug}",
     * name="bookstore.category",
     * requirements = {"slug" = ".+"},
     * defaults = {"slug" = ""})
     */
    public function categoryAction(Request $request, $slug)
    {
        $doctrine = $this->getDoctrine();
        $repository = $doctrine->getRepository(Category::class);

        $category = $repository->findOneBy(['slugCat' => $slug]);

//        exit(dump($category));

        return $this->render('bookstore/category.html.twig',
            [
                'slugCat' => $slug,
                'category' => $category
            ]);
    }

    /**
     * @Route(
     * "/bookstore/book/{slug}",
     * name="bookstore.book",
     * requirements = {"slug" = ".+"},
     * defaults = {"slug" = ""})
     */
    public function bookAction(Request $request, $slug)
    {
        $doctrine = $this->getDoctrine();
        $repository = $doctrine->getRepository(Book::class);

        $book = $repository->findOneBy(['slugTitre' => $slug]);

//        exit(dump($course->getModules()));

        return $this->render('bookstore/book.html.twig',
            [
                'slug' => $slug,
                'book' => $book
            ]);
    }
}