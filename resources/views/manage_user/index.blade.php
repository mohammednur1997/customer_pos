@extends('layouts.app')
@section('title', __( 'user.users' ))

@section('content')

<!-- Content Header (Page header) -->
{{-- <section class="content-header">
    <h1>@lang( 'user.users' )
        <small>@lang( 'user.manage_users' )</small>
    </h1>
    <!-- <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
    </ol> -->
</section> --}}

<!-- Main content -->
<section class="content" style="padding: 15px 0;">
    <!-- Content Header (Page header) -->
<section class="content-header f_content-header f_product_content-header" style="margin-bottom: 25px">
    <h1>@lang( 'user.users' )
        <small>@lang( 'user.manage_users' )</small>
    </h1>
    <!-- <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
    </ol> -->
    <div>
        @can('user.create')                            
        <a class="btn f_add-btn pull-right" href="{{action([\App\Http\Controllers\ManageUserController::class, 'create'])}}">
                    <i class="fa fa-plus"></i> @lang('messages.add')</a>
        <br><br>
    @endcan
    </div>
</section>
    @component('components.widget', ['class' => 'box-primary', 'title' => __( 'user.all_users' )])
        {{-- @can('user.create')
            @slot('tool')
                <div class="box-tools">
                    <a class="btn btn-block btn-primary" 
                    href="{{action([\App\Http\Controllers\ManageUserController::class, 'create'])}}" >
                    <i class="fa fa-plus"></i> @lang( 'messages.add' )</a>
                 </div>
            @endslot
        @endcan --}}
        @can('user.view')
            <div class="table-responsive">
                <table class="table table-bordered table-striped" id="users_table">
                    <thead>
                        <tr class='f_tr-th'>
                            <th >@lang( 'business.username' )</th>
                            <th>@lang( 'user.name' )</th>
                            <th>@lang( 'user.role' )</th>
                            <th>@lang( 'business.email' )</th>
                            <th width="15%">@lang( 'messages.action' )</th>
                        </tr>
                    </thead>
                </table>
            </div>
        @endcan
    @endcomponent

    <div class="modal fade user_modal" tabindex="-1" role="dialog" 
    	aria-labelledby="gridSystemModalLabel">
    </div>

</section>
<!-- /.content -->
@stop
@section('javascript')
<script type="text/javascript">
    //Roles table
    $(document).ready( function(){
        var users_table = $('#users_table').DataTable({
                    processing: true,
                    serverSide: true,
            buttons: [
            ],
                    ajax: '/users',
                    columnDefs: [ {
                        "targets": [4],
                        "orderable": false,
                        "searchable": false
                    } ],
                    "columns":[
                        {"data":"username"},
                        {"data":"full_name"},
                        {"data":"role"},
                        {"data":"email"},
                        {"data":"action"}
                    ]
                });
        $(document).on('click', 'button.delete_user_button', function(){
            swal({
              title: LANG.sure,
              text: LANG.confirm_delete_user,
              icon: "warning",
              buttons: true,
              dangerMode: true,
            }).then((willDelete) => {
                if (willDelete) {
                    var href = $(this).data('href');
                    var data = $(this).serialize();
                    $.ajax({
                        method: "DELETE",
                        url: href,
                        dataType: "json",
                        data: data,
                        success: function(result){
                            if(result.success == true){
                                toastr.success(result.msg);
                                users_table.ajax.reload();
                            } else {
                                toastr.error(result.msg);
                            }
                        }
                    });
                }
             });
        });
        
    });
    
    
</script>
@endsection
