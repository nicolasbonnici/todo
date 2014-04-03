<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h1 class="modal-title" id="myModalLabel">{{oEntity.label|safe}}</h1>
    <small>dernière édition le <span class="ui-timestamp" data-timestamp="{{oEntity.lastupdate}}"></span></small>
</div>
<div class="modal-body">
{% if oEntity|Exists %}
    {{oEntity.content|safe}}
{% else %}
    <div class="alert alert-warning">
        <strong>Warning!</strong> Your role doesn't allow you to see this todo
    </div>
{% endif %}
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-lg btn-default" data-dismiss="modal">Fermer</button>
</div>
