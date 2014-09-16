<?php
namespace bundles\todo\Models;

class Todo extends \Library\Core\Crud
{

    /**
     * Instance constructor overide
     */
    public function __construct($iPrimaryKey = null, \bundles\user\Entities\User $oUser)
    {
        assert('is_null($iPrimaryKey) || intval($iPrimaryKey) > 0');
        if (! $oUser->isLoaded()) {
            throw new TodoModelException('Todo need a valid user instance, no user provided.');
        } elseif (! $oUser instanceof \bundles\user\Entities\User || ! $oUser->isLoaded()) {
            throw new TodoModelException('Todo need a valid user instance, no user provided.');
        } else {
            parent::__construct('\bundles\todo\Entities\Todo', '\bundles\todo\Entities\Collection\TodoCollection', $iPrimaryKey, $oUser);
        }
    }
}

class TodoModelException extends \Exception
{
}
