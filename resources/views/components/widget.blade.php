<div class="box f_box box {{$class ?? 'box-solid'}}" @if(!empty($id)) id="{{$id}}" @endif>
    @if(empty($header))
        @if(!empty($title) || !empty($tool))
        <div class="box-header" style="margin-bottom: 15px">
            {!!$icon ?? '' !!}
            <h3 class="box-title title">{{ $title ?? '' }}</h3>
            {!!$tool ?? ''!!}
        </div>
        @endif
    @else
        <div class="box-header">
            {!! $header !!}
        </div>
    @endif

    <div class="box-body">
        {{$slot}}
    </div>
    <!-- /.box-body -->
</div>