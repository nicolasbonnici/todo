<?php

namespace modules\backend\Models;

class Todo extends \Library\Core\Crud {


    /**
     * Instance constructor overide
     */
    public function __construct($iPrimaryKey = null, \app\Entities\User $oUser)
    {
        assert('is_null($iPrimaryKey) || intval($iPrimaryKey) > 0');
        if (! $oUser->isLoaded()) {
            throw new TodoModelException('Todo need a valid user instance, no user provided.');
        } elseif (!$oUser instanceof \app\Entities\User || !$oUser->isLoaded()) {
            throw new TodoModelException('Todo need a valid user instance, no user provided.');
        } else {
            parent::__construct('Todo', $iPrimaryKey, $oUser);
        }
    }

}

class TodoModelException extends \Exception {}
