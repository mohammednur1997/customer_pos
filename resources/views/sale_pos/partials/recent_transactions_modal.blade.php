<div class="modal fade no-print" id="recent_transactions_modal" tabindex="-1" role="dialog" aria-labelledby="modalTitle">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">@lang('lang_v1.recent_transactions')</h4>
			</div>
			<div class="modal-body">
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs recent_transactions_modal_nav">
						<li class="active"><a href="#tab_final" data-toggle="tab" aria-expanded="true"> @lang('sale.final')</a></li>

						<li class=""><a href="#tab_quotation" data-toggle="tab" aria-expanded="false"> @lang('lang_v1.quotation')</a></li>
						
						<li class=""><a href="#tab_draft" data-toggle="tab" aria-expanded="false"> @lang('sale.draft')</a></li>
					</ul>
					<div class="tab-content recent_transactions_modal_tab-content">
						<div class="tab-pane active" id="tab_final">
						</div>
						<div class="tab-pane" id="tab_quotation">
						</div>
						<div class="tab-pane" id="tab_draft">
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
			    <button type="button" class="btn btn-default" data-dismiss="modal">@lang('messages.close')</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div>