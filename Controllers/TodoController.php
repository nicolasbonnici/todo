<?php
namespace bundles\todo\Controllers;

/**
 * Todo TodoController
 *
 * A simple note and todo app
 *
 * @author info
 */
class TodoController extends \Library\Core\Auth
{

    public function __preDispatch()
    {}

    public function __postDispatch()
    {}

    public function indexAction()
    {
        $this->oView->render($this->aView, 'todo/index.tpl');
    }

    public function createAction()
    {
        $this->oView->render($this->aView, 'todo/create.tpl');
    }

    public function readAction()
    {
        if (isset($this->aParams['idtodo']) && intval($this->aParams['idtodo']) > 0) {
            $oTodoModel = new \bundles\todo\Models\Todo(intval($this->aParams['idtodo']), $this->oUser);
            $oTodo = $oTodoModel->getEntity();
            if (! is_null($oTodo) && $oTodo->isLoaded()) {
                $this->aView['oTodo'] = $oTodo;
            }
        }
        $this->oView->render($this->aView, 'todo/read.tpl');
    }

    public function updateAction()
    {
        if (isset($this->aParams['idtodo']) && intval($this->aParams['idtodo']) > 0) {
            $oTodoModel = new \bundles\todo\Models\Todo(intval($this->aParams['idtodo']), $this->oUser);
            $oTodo = $oTodoModel->getEntity();
            if (! is_null($oTodo) && $oTodo->isLoaded()) {
                $this->aView['oTodo'] = $oTodo;
            }
        }
        $this->oView->render($this->aView, 'todo/update.tpl');
    }

    public function deleteAction()
    {
        if (isset($this->aParams['pk']) && intval($this->aParams['pk']) > 0) {
            $this->aView['pk'] = $this->aParams['pk'];
        }
        $this->oView->render($this->aView, 'todo/delete.tpl');
    }
}

class TodoControllerException extends \Exception
{
}

