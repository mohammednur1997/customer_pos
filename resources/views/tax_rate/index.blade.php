@extends('layouts.app')
@section('title', __('tax_rate.tax_rates'))

@section('content')


    <!-- Main content -->
    <section class="content" style="padding: 15px 0">
        <!-- Content Header (Page header) -->
        <section class="content-header f_content-header f_product_content-header">
            <h1>@lang('tax_rate.tax_rates')
                <small>@lang('tax_rate.manage_your_tax_rates')</small>
            </h1>
        </section>
        @component('components.widget', ['class' => 'box-primary', 'title' => __('tax_rate.all_your_tax_rates')])
            @can('tax_rate.create')
                @slot('tool')
                    <div class="box-tools">
                        <button type="button" class="btn btn-block f_add-btn btn-modal"
                            data-href="{{ action([\App\Http\Controllers\TaxRateController::class, 'create']) }}"
                            data-container=".tax_rate_modal">
                            <i class="fa fa-plus"></i> @lang('messages.add')</button>
                    </div>
                @endslot
            @endcan
            @can('tax_rate.view')
                <div class="table-responsive">
                    <table class="table table-bordered table-striped" id="tax_rates_table">
                        <thead>
                            <tr class="f_tr-th">
                                <th>@lang('tax_rate.name')</th>
                                <th>@lang('tax_rate.rate')</th>
                                <th>@lang('messages.action')</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            @endcan
        @endcomponent

        @component('components.widget', ['class' => 'box-primary'])
            @slot('title')
                @lang('tax_rate.tax_groups') ( @lang('lang_v1.combination_of_taxes') ) @show_tooltip(__('tooltip.tax_groups'))
            @endslot
            @can('tax_rate.create')
                @slot('tool')
                    <div class="box-tools">
                        <button type="button" class="btn btn-block f_add-btn  btn-modal"
                            data-href="{{ action([\App\Http\Controllers\GroupTaxController::class, 'create']) }}"
                            data-container=".tax_group_modal">
                            <i class="fa fa-plus"></i> @lang('messages.add')</button>
                    </div>
                @endslot
            @endcan
            @can('tax_rate.view')
                <div class="table-responsive">
                    <table class="table table-bordered table-striped" id="tax_groups_table">
                        <thead>
                            <tr class="f_tr-th">
                                <th>@lang('tax_rate.name')</th>
                                <th>@lang('tax_rate.rate')</th>
                                <th>@lang('tax_rate.sub_taxes')</th>
                                <th>@lang('messages.action')</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            @endcan
        @endcomponent

        <div class="modal fade tax_rate_modal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
        </div>
        <div class="modal fade tax_group_modal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
        </div>

    </section>
    <!-- /.content -->
@endsection
