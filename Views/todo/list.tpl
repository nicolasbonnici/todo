{% if oEntities|Exists %} {% for oTodo in oEntities %}
<tr class="ui-item">
    <td><input type="checkbox" class="ui-select todos form-control input-lg" data-delete-selector=".ui-delete-todos" data-select-parent="#todoList" name="idtodo" value="{{oTodo.idtodo}}" /></td>
    <td>
        <h3 class="">
            <a href="#modal-todo" class="ui-sendxhr showOnHover" data-url="/crud/read/"
                data-selector="#modal-todo-content" data-entity="Todo" data-view="todo/read.tpl" data-toggle="modal"
                data-pk="{{oTodo.idtodo}}" title="{{tr['view']}}"> {{oTodo.label|safe}} <span
                class="targetToShow glyphicon glyphicon-zoom-in"></span>
            </a>
        </h3>
    </td>
    <td>
        <h3>
            <span class="ui-timestamp" data-timestamp="{{oTodo.deadline}}"></span>
        </h3>
    </td>
    <td class="text-center">
        <div class="btn-group">
            <button type="button" class="btn btn-lg btn-info btn-info dropdown-toggle blackTextShadow" data-toggle="dropdown">
                Actions <span class="caret"></span>
            </button>
            <ul class="dropdown-menu transparentBlackBg ui-shadow" role="menu">
                <li>
                    <a href="#modal-todo" class="ui-sendxhr" data-url="/crud/read/"
                        data-selector="#modal-todo-content" data-entity="Todo" data-view="todo/read.tpl" data-toggle="modal"
                        data-pk="{{oTodo.idtodo}}" title="{{tr['view']}}"> <span class="glyphicon glyphicon-zoom-in"></span> Voir
                    </a>
                </li>
                <li>
                    <a href="#modal-todo" class="ui-sendxhr" data-url="/todo/todo/update/"
                        data-selector="#modal-todo-content" data-toggle="modal" data-idtodo="{{oTodo.idtodo}}"
                        title="{{tr['edit']}}"> <span class="glyphicon glyphicon-pencil"></span> Update
                    </a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="#modal-todo" class="ui-sendxhr" data-url="/todo/todo/delete/"
                        data-selector="#modal-todo-content" data-toggle="modal" data-pk="{{oTodo.idtodo}}"
                        title="{{tr['delete']}}"> <span class="glyphicon glyphicon-trash"></span> Delete
                    </a>
                </li>
            </ul>
        </div>
    </td>
</tr>
{% endfor %} {% else %}
<tr>
    <td>Aucun enregistrement</td>
</tr>
{% endif %}
