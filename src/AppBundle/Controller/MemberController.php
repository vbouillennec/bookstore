<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class MemberController extends Controller
{
    /**
     * @Route(
     * "/members",
     * name="members"
     * )
     */
    public function indexAction(Request $request){
        return $this->render('members/index.html.twig', [
            'members' => $this->members
        ]);
    }

    /**
     * @Route(
     * "/member/{id}",
     * name="member"
     * )
     */
    public function detailAction(Request $request, $id){
        return $this->render('members/detail.html.twig', [
            'member' => $this->members[$id]
        ]);
    }

    private $members = [
        1 => [
        'prenom' => 'Valentin',
        'nom' => 'Bouillennec',
        'email' => 'val.bouillennec@gmail.com',
        'photo' => 'img/batwink-loop.gif'
        ],
        2 => [
        'prenom' => 'Adrien',
        'nom' => 'Neto Ferreira',
        'email' => 'a.neto@gmail.com',
        'photo' => 'img/rick&morty.gif'
        ],
        3 => [
        'prenom' => 'Darwin',
        'nom' => 'Fervil',
        'email' => 'd.fervil@gmail.com',
        'photo' => 'img/sad-black.gif'
        ],
        4 => [
        'prenom' => 'Sebastien',
        'nom' => 'Daurelle',
        'email' => 's.daurelle@gmail.com',
        'photo' => 'img/nyan.gif'
        ]
    ];
}