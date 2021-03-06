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
    protected $sTodoEntityName = '\bundles\todo\Entities\Todo';
    protected $sTodoEntityCollectionName = '\bundles\todo\Entities\Collection\TodoCollection';

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
            $oTodoModel = new \bundles\todo\Models\TodoModel($this->oUser, intval($this->aParams['idtodo']));
            $oTodo = $oTodoModel->getEntity();
            if (! is_null($oTodo) && $oTodo->isLoaded()) {
                $this->aView['oTodo'] = $oTodo;
            }
        }
        $this->oView->render($this->aView, 'todo/read.tpl');
    }

    /**
     * Just render the update view for a todo the note the update is handle by the crud bundle
     */
    public function updateAction()
    {
        if (isset($this->aParams['idtodo']) && intval($this->aParams['idtodo']) > 0) {
            $oTodoModel = new \bundles\todo\Models\TodoModel($this->oUser, intval($this->aParams['idtodo']));
            $oTodo = $oTodoModel->getEntity();
            if (! is_null($oTodo) && $oTodo->isLoaded()) {
                $this->aView['oTodo'] = $oTodo;
            }
        }
        $this->oView->render($this->aView, 'todo/update.tpl');
    }


    /**
     * Just render the delete view for a todo the note the update is handle by the crud bundle
     */
    public function deleteAction()
    {
        if (isset($this->aParams['pk']) && intval($this->aParams['pk']) > 0) {
            $this->aView['pk'] = $this->aParams['pk'];
        }
        $this->oView->render($this->aView, 'todo/delete.tpl');
    }

    public function listAction($iOffset = 0, $iLoadStep = 10)
    {
        try {
            $this->aView['iStatus'] = self::XHR_STATUS_ERROR;
            $oTodoModel = new \bundles\todo\Models\TodoModel($this->oUser);

            if (isset($this->aParams['ioffset']) && intval($this->aParams['ioffset']) > 0) {
                $iOffset = (int) $this->aParams['ioffset'];
            }

            if (isset($this->aParams['iLoadStep']) && intval($this->aParams['iLoadStep']) > 0) {
                $iLoadStep = (int) $this->aParams['iLoadStep'];
            }

            $aLimit = array($iOffset, $iLoadStep);
            if ($oTodoModel->load('created', 'DESC', $aLimit)) {
                $this->aView['iStatus'] = self::XHR_STATUS_OK;
                $this->aView['oEntities'] = $oTodoModel->getEntities();
            }
        } catch (\bundles\crud\Models\CrudModelException $oException) {
            $this->aView['error_message'] = $oException->getMessage();
            $this->aView['error_code'] = $oException->getCode();
        }
        $this->oView->render($this->aView, 'todo/list.tpl', $this->aView['iStatus']);
    }
}

class TodoControllerException extends \Exception
{
}

