<?php

namespace modules\todo\Controllers;

/**
 * Todo HomeController
 *
 * A simple note and todo app
 *
 * @author info
 */
class HomeController extends \Library\Core\Auth {

    public function __preDispatch() {}

    public function __postDispatch() {}

    public function indexAction()
    {
        $this->render('todo/index.tpl');
    }

    public function createAction()
    {
        $this->render('todo/create.tpl');
    }

    public function readAction()
    {
        if (isset($this->_params['idtodo']) && intval($this->_params['idtodo']) > 0) {
            $oTodoModel = new \modules\backend\Models\Todo(intval($this->_params['idtodo']), $this->oUser);
            $oTodo = $oTodoModel->getEntity();
            if (! is_null($oTodo) && $oTodo->isLoaded()) {
                $this->_view['oTodo'] = $oTodo;
            }

        }
        $this->render('todo/read.tpl');
    }

    public function updateAction()
    {
        if (isset($this->_params['idtodo']) && intval($this->_params['idtodo']) > 0) {
            $oTodoModel = new \modules\backend\Models\Todo(intval($this->_params['idtodo']), $this->oUser);
            $oTodo = $oTodoModel->getEntity();
            if (! is_null($oTodo) && $oTodo->isLoaded()) {
                $this->_view['oTodo'] = $oTodo;
            }

        }
        $this->render('todo/update.tpl');
    }

    public function deleteAction()
    {
        if (isset($this->_params['pk']) && intval($this->_params['pk']) > 0) {
            $this->_view['pk'] = $this->_params['pk'];
        }
        $this->render('todo/delete.tpl');
    }

}

class TodoControllerException extends \Exception {}
?>
