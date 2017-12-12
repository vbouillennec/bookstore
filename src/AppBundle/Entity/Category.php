<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Category
 *
 * @ORM\Table(name="category")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\CategoryRepository")
 */
class Category
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="slug_cat", type="string", length=40)
     */
    private $slugCat;

    /**
     * @var string
     *
     * @ORM\Column(name="nom_cat", type="string", length=40)
     */
    private $nomCat;

    /**
     * @ORM\ManyToMany(targetEntity="Book", mappedBy="category")
     */
    private $books;


    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set slugCat
     *
     * @param string $slugCat
     *
     * @return Category
     */
    public function setSlugCat($slugCat)
    {
        $this->slugCat = $slugCat;

        return $this;
    }

    /**
     * Get slugCat
     *
     * @return string
     */
    public function getSlugCat()
    {
        return $this->slugCat;
    }

    /**
     * Set nomCat
     *
     * @param string $nomCat
     *
     * @return Category
     */
    public function setNomCat($nomCat)
    {
        $this->nomCat = $nomCat;

        return $this;
    }

    /**
     * Get nomCat
     *
     * @return string
     */
    public function getNomCat()
    {
        return $this->nomCat;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->books = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add book
     *
     * @param \AppBundle\Entity\Book $book
     *
     * @return Category
     */
    public function addBook(\AppBundle\Entity\Book $book)
    {
        $this->books[] = $book;

        return $this;
    }

    /**
     * Remove book
     *
     * @param \AppBundle\Entity\Book $book
     */
    public function removeBook(\AppBundle\Entity\Book $book)
    {
        $this->books->removeElement($book);
    }

    /**
     * Get books
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getBooks()
    {
        return $this->books;
    }
}
