@extends('layouts.app')
@section('title', __('stock_adjustment.add'))

@section('content')



<!-- Main content -->
<section class="content no-print" style="padding: 15px 0;">
	<!-- Content Header (Page header) -->
<section class="content-header f_content-header f_product_content-header">

		<h1>@lang('stock_adjustment.add')</h1>
		<!-- <ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
			<li class="active">Here</li>
		</ol> -->
	</section>
	{!! Form::open(['url' => action([\App\Http\Controllers\StockAdjustmentController::class, 'store']), 'method' => 'post', 'id' => 'stock_adjustment_form' ]) !!}
	<div class="box box-solid">
		<div class="box-body">
			<div class="row">
				<div class="col-sm-3">
					<div class="form-group addProduct_form">
						{!! Form::label('location_id', __('purchase.business_location').':*') !!}
						{!! Form::select('location_id', $business_locations, null, ['class' => 'form-control select2', 'placeholder' => __('messages.please_select'), 'required']); !!}
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group addProduct_form">
						{!! Form::label('ref_no', __('purchase.ref_no').':') !!}
						{!! Form::text('ref_no', null, ['class' => 'form-control']); !!}
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group addProduct_form">
						{!! Form::label('transaction_date', __('messages.date') . ':*') !!}
						<div class="input-group w-full">
							{{-- <span class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</span> --}}
							{!! Form::text('transaction_date', @format_datetime('now'), ['class' => 'form-control', 'readonly', 'required']); !!}
						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group addProduct_form">
						{!! Form::label('adjustment_type', __('stock_adjustment.adjustment_type') . ':*') !!} @show_tooltip(__('tooltip.adjustment_type'))
						{!! Form::select('adjustment_type', [ 'normal' =>  __('stock_adjustment.normal'), 'abnormal' =>  __('stock_adjustment.abnormal')], null, ['class' => 'form-control select2', 'placeholder' => __('messages.please_select'), 'required']); !!}
					</div>
				</div>
			</div>
		</div>
	</div> <!--box end-->
	<div class="box box-solid">
		<div class="box-header" style="padding: 20px !important">
        	<h3 class="box-title">{{ __('stock_adjustment.search_products') }}</h3>
       	</div>
		<div class="box-body">
			<div class="row">
				<div class="col-sm-8 col-sm-offset-2">
					<div class="form-group addProduct_form">
						<div class="input-group">
							<span class="input-group-addon" style="border: none !important">
								<i class="fa fa-search"></i>
							</span>
							{!! Form::text('search_product', null, ['class' => 'form-control', 'id' => 'search_product_for_srock_adjustment', 'placeholder' => __('stock_adjustment.search_product'), 'disabled']); !!}
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<input type="hidden" id="product_row_index" value="0">
					<input type="hidden" id="total_amount" name="final_total" value="0">
					<div class="table-responsive">
					<table class="table table-bordered table-striped table-condensed" 
					id="stock_adjustment_product_table">
						<thead>
							<tr class="f_tr-th">
								<th class="col-sm-4 text-center">	
									@lang('sale.product')
								</th>
								<th class="col-sm-2 text-center">
									@lang('sale.qty')
								</th>
								<th class="col-sm-2 text-center">
									@lang('sale.unit_price')
								</th>
								<th class="col-sm-2 text-center">
									@lang('sale.subtotal')
								</th>
								<th class="col-sm-2 text-center"><i class="fa fa-trash" aria-hidden="true"></i></th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr class="text-center"><td colspan="3"></td><td><div class="pull-right"><b>@lang('stock_adjustment.total_amount'):</b> <span id="total_adjustment">0.00</span></div></td></tr>
						</tfoot>
					</table>
					</div>
				</div>
			</div>
		</div>
	</div> <!--box end-->
	<div class="box box-solid">
		<div class="box-body">
			<div class="row">
				<div class="col-sm-4">
					<div class="form-group addProduct_form">
							{!! Form::label('total_amount_recovered', __('stock_adjustment.total_amount_recovered') . ':') !!} @show_tooltip(__('tooltip.total_amount_recovered'))
							{!! Form::text('total_amount_recovered', 0, ['class' => 'form-control input_number', 'placeholder' => __('stock_adjustment.total_amount_recovered')]); !!}
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group addProduct_form">
							{!! Form::label('additional_notes', __('stock_adjustment.reason_for_stock_adjustment') . ':') !!}
							{!! Form::textarea('additional_notes', null, ['class' => 'form-control', 'placeholder' => __('stock_adjustment.reason_for_stock_adjustment'), 'rows' => 3]); !!}
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<button type="submit" class="btn f_add-btn ">@lang('messages.save')</button>
				</div>
			</div>

		</div>
	</div> <!--box end-->
	{!! Form::close() !!}
</section>
@stop
@section('javascript')
	<script src="{{ asset('js/stock_adjustment.js?v=' . $asset_v) }}"></script>
	<script type="text/javascript">
		__page_leave_confirmation('#stock_adjustment_form');
	</script>
@endsection
