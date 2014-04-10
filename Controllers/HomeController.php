<?php
namespace bundles\todo\Controllers;

/**
 * Todo HomeController
 *
 * A simple note and todo app
 *
 * @author info
 */
class HomeController extends \Library\Core\Auth
{

    public function __preDispatch()
    {}

    public function __postDispatch()
    {}

    public function indexAction()
    {
        $this->render('home/index.tpl');
    }

}

class TodoControllerException extends \Exception
{
}

