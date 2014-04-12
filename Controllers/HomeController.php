<?php
namespace bundles\todo\Controllers;

/**
 * Todo HomeController
 *
 * A simple note and todo app
 *
 * @author info
 */
class HomeController extends TodoController
{

    public function __preDispatch()
    {}

    public function __postDispatch()
    {}

    public function indexAction()
    {
        $this->oView->render($this->aView, 'home/index.tpl');
    }

}

