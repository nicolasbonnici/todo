{% if oEntities|Exists %} {% for oTodo in oEntities %}
<tr {% if oTodo.deadline>
    current_timestamp %} class="danger blackFontColor"{% endif %}>
    <td><input type="checkbox" class="ui-select todos form-control input-lg" name="idtodo" value="{{oTodo.idtodo}}" /></td>
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
            <a href="#modal-todo" class="ui-sendxhr btn btn-lg btn-info" data-url="/crud/read/"
                data-selector="#modal-todo-content" data-entity="Todo" data-view="todo/read.tpl" data-toggle="modal"
                data-pk="{{oTodo.idtodo}}" title="{{tr['view']}}"> <span class="glyphicon glyphicon-zoom-in"></span>
            </a> <a href="#modal-todo" class="ui-sendxhr btn btn-lg btn-warning" data-url="/todo/home/update/"
                data-selector="#modal-todo-content" data-toggle="modal" data-idtodo="{{oTodo.idtodo}}"
                title="{{tr['edit']}}"> <span class="glyphicon glyphicon-pencil"></span>
            </a> <a href="#modal-todo" class="ui-sendxhr btn btn-lg btn-danger" data-url="/todo/home/delete/"
                data-selector="#modal-todo-content" data-toggle="modal" data-pk="{{oTodo.idtodo}}"
                title="{{tr['delete']}}"> <span class="glyphicon glyphicon-trash"></span>
            </a>
        </div>
    </td>
</tr>
{% endfor %} {% else %}
<tr>
    <td>Aucun enregistrement</td>
</tr>
{% endif %}
