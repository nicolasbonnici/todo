{% extends 'layout.tpl' %}

{% block favicon %}/lib/img/aps/todo/icon.png{% endblock favicon %}
{% block meta_title %}Todo!{% endblock meta_title %}
{% block meta_description %}A simple note manager/reminder application{% endblock meta_description %}

{% block js %}
<script type="text/javascript" src="/lib/plugins/bootstrap-editable/js/bootstrap-editable.min.js"></script>
<script type="text/javascript" src="/lib/plugins/summernote/js/summernote.js"></script>
<script type="text/javascript" src="/lib/plugins/moment/js/moment.min.js"></script>
<script type="text/javascript" src="/lib/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    // Show the delete btn for several checked checkbox
    $('body').on('.ui-select.todos', 'click', function() {
       alert($('.ui-select.todos:checked').size());
       if ($('.ui-select.todos:checked').size() > 1) {
           $('.ui-delete-todos').removeClass('hide');
       } else {
           $('.ui-delete-todos').addClass('hide');
       }
    });
});
</script>
{% endblock %}

{% block css %}
<link href="/lib/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="/lib/plugins/bootstrap-editable/css/bootstrap-editable.css" rel="stylesheet">
<link href="/lib/plugins/summernote/css/summernote.css" rel="stylesheet">
<link href="/lib/plugins/summernote/css/summernote-bs3.css" rel="stylesheet">
{% endblock %}

{% block modal %}
<div class="modal fade" id="modal-todo" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" id="modal-todo-content">
            <p>&nbsp;</p>
		</div>
	</div>				
</div>
{% endblock %}

{% block main %}

	<div class="row clearfix transparentBlackBg rounded well ui-transition ui-shadow">
		<div class="col-md-12 column">
			<div class="page-header">
				<h1 class="showOnHover">
					<img src="/lib/img/apps/todo/icon.png" alt="App icon" />Todo! <small class="targetToShow">1.0</small>
				</h1>
			</div>
		</div>

		<div class="col-md-12 column">
			<div class="btn-group btn-group-lg">
                 <button type="button" class="ui-reload btn btn-lg btn-default">
                     <span class="glyphicon glyphicon-refresh"></span> Raffraichir
                 </button>
				 <button  href="#modal-todo" type="button" class="hide btn btn-lg btn-danger ui-sendxhr ui-delete-todos" data-url="/backend/todo/delete/" data-selector="#modal-create-content" role="button" data-toggle="modal">
				    <span class="glyphicon glyphicon-trash"></span> Supprimer
				 </button> 
				 <button  href="#modal-todo" type="button" class="btn btn-lg btn-info ui-sendxhr" data-url="/backend/todo/create/" data-selector="#modal-todo-content" role="button" data-toggle="modal">
				    <span class="glyphicon glyphicon-file"></span> New todo!
				 </button> 
			</div>

			<table id="todo-last-items" class="table table-responsive">
				<thead>
					<tr>
						<th>
							<input type="checkbox" class="ui-select-all ui-toggle" data-toggle-selector=".ui-delete-todos" data-checkbox-class="todos" data-container="#todo-last-items" />
						</th>
						<th>
							<h3>Title</h3>
						</th>
						<th>
							<h3>Deadline</h3>
						</th>
                        <th class="text-center">
                            <h3>Actions</h3>
                        </th>
					</tr>
				</thead>
				<tbody id="todoList" class="ui-loadable" data-entity="Todo" data-view="todo/list.tpl" data-parameters="" data-module="crud" data-controller="home" data-action="listByUser">

				</tbody>
			</table>
		</div>
	</div>

{% endblock %}

