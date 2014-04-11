 {% if oTodo|Exists %}
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h1 class="modal-title" id="myModalLabel">
        <a href="#" class="ui-editable" data-type="text" data-tpl="<input type='text'class='input-lg'>"
            data-entity="Todo" data-name="label" data-pk="{{oTodo.idtodo}}" data-url="/backend/crud/update/">
            {{oTodo.label|safe}} </a>
    </h1>
</div>
<div class="modal-body">
    <form role="form" data-entity="Todo" data-pk="{{oTodo.idtodo}}" id="updateTodoForm" action="/crud/update/"
        method="post">
        <div class="form-group">
            <label>Deadline</label> <a class="ui-editable bold" data-type="combodate" data-template="D MMM YYYY  HH:mm"
                data-format="YYYY-MM-DD HH:mm" data-viewformat="MMM D, YYYY, HH:mm" data-entity="Todo" data-pk=""
                data-url=""> <span class="ui-timestamp" data-timestamp="{{oTodo.deadline}}"></span>
            </a>
        </div>
        <div class="form-group">
            <div class="ui-editor" data-name="content">{{oTodo.content|safe}}</div>
            <p class="text-right">
                <small>Dernière édition <span class="ui-timestamp" data-timestamp="{{oTodo.lastupdate}}"></span></small>
            </p>
        </div>
    </form>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-lg btn-default" data-dismiss="modal">{{tr['cancel']}}</button>
    <button type="button" class="btn btn-lg btn-primary ui-sendform loadOnCallback sendNotificationOnCallback" data-load-selector="#todoList"
        data-form="#updateTodoForm">{{tr['save']}}</button>
</div>
{% endif %}
