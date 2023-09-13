<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>@yield('title') - {{ config('app.name', 'POS') }}</title>

    @include('layouts.partials.css')

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    @inject('request', 'Illuminate\Http\Request')
    @if (session('status') && session('status.success'))
        <input type="hidden" id="status_span" data-status="{{ session('status.success') }}"
            data-msg="{{ session('status.msg') }}">
    @endif
    <div class="container-fluid">
        <div class="row eq-height-row">
            {{--        <div class="col-md-5 col-sm-5 hidden-xs left-col eq-height-col" > --}}
            {{--            <div class="left-col-content login-header"> --}}
            {{--                <div style="margin-top: 50%;"> --}}
            {{--                    <a href="/"> --}}
            {{--                        @if (file_exists(public_path('uploads/logo.png'))) --}}
            {{--                            <img src="/uploads/logo.png" class="img-rounded" alt="Logo" width="150"> --}}
            {{--                        @else --}}
            {{--                            {{ config('app.name', 'ultimatePOS') }} --}}
            {{--                        @endif --}}
            {{--                    </a> --}}
            {{--                    <br/> --}}
            {{--                    @if (!empty(config('constants.app_title'))) --}}
            {{--                        <small>{{config('constants.app_title')}}</small> --}}
            {{--                    @endif --}}
            {{--                </div> --}}
            {{--            </div> --}}
            {{--        </div> --}}
            <div class="col-md-12 col-sm-12 col-xs-12 right-col eq-height-col" style=''>
                <div class="row container right-col-nav">
                    <div>
                        <img src='{{ asset('/logo.png') }}' alt='Logo' style="width: 173px">
                    </div>
                    <div>
                        <ul style="" class="right-col-ul">
                            @if (Route::has('pricing') && config('app.env') != 'demo' && $request->segment(1) != 'pricing')
                                <li><a style='color: #000000'
                                        href='{{ action([\Modules\Superadmin\Http\Controllers\PricingController::class, 'index']) }}'>@lang('superadmin::lang.pricing')</a>
                                </li>
                            @endif
                            @if(!($request->segment(1) == 'business' && $request->segment(2) == 'register'))
                                    @if(config('constants.allow_registration'))
                                        <li>
                                            <a style='color: #000000'
                                                href='{{ route('business.getRegister') }}@if(!empty(request()->lang)){{'?lang=' . request()->lang}} @endif'><b>{{ __('business.not_yet_registered') }}</b>
                                                {{ __('business.register_now') }}</a>
                                        </li>
                                    @endif
                            @endif

                                @if($request->segment(1) != 'login')
                                    <li>
                                        <a style='color: #000000'
                                           href='{{ action([\App\Http\Controllers\Auth\LoginController::class, 'login']) }}@if(!empty(request()->lang)){{'?lang=' . request()->lang}} @endif'><b>{{ __('business.already_registered') }}</b>
                                            {{ __('business.sign_in') }}</a>
                                    </li>
                                @endif

                            <li>
                                <select class="form-control input-sm  right-col-select" id="change_lang"
                                    style="margin: 10px;">
                                    @foreach (config('constants.langs') as $key => $val)
                                        <option value="{{ $key }}"
                                            @if ((empty(request()->lang) && config('app.locale') == $key) || request()->lang == $key) selected @endif>
                                            {{ $val['full_name'] }}
                                        </option>
                                    @endforeach
                                </select>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
            @yield('content')
            <div class="auth_footer col-md-12 col-sm-12 col-xs-12 ">
            <div class="container auth_footer_wrapper">
                <div class="auth_footer_left">
                    <p>{{ config('app.name', 'Mhamcloud') }} - V{{config('author.app_version')}} | Copyright &copy; {{ date('Y') }} All rights reserved.
                        &nbsp; <a href='#'>Terms and Conditions | Privacy Policy</a>
                    </p>
                </div>
                <div class="auth_footer_left">
                    <ul>
                        <li><svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd"
                                    d="M11.9922 0C8.73319 0 8.32454 0.0138127 7.04462 0.0722122C5.76736 0.130468 4.89502 0.33334 4.13173 0.630005C3.34262 0.936625 2.67342 1.34695 2.00626 2.01406C1.33914 2.68122 0.928813 3.35044 0.622192 4.13954C0.325527 4.90283 0.122663 5.77515 0.0644074 7.05241C0.00600785 8.33234 -0.0078125 8.74099 -0.0078125 12C-0.0078125 15.259 0.00600785 15.6677 0.0644074 16.9476C0.122663 18.2248 0.325527 19.0972 0.622192 19.8605C0.928813 20.6496 1.33914 21.3188 2.00626 21.9859C2.67342 22.6531 3.34262 23.0634 4.13173 23.37C4.89502 23.6667 5.76736 23.8695 7.04462 23.9278C8.32454 23.9862 8.73319 24 11.9922 24C15.2512 24 15.6598 23.9862 16.9398 23.9278C18.217 23.8695 19.0893 23.6667 19.8526 23.37C20.6417 23.0634 21.311 22.6531 21.9781 21.9859C22.6452 21.3188 23.0555 20.6496 23.3622 19.8605C23.6588 19.0972 23.8617 18.2248 23.92 16.9476C23.9784 15.6677 23.9922 15.259 23.9922 12C23.9922 8.74099 23.9784 8.33234 23.92 7.05241C23.8617 5.77515 23.6588 4.90283 23.3622 4.13954C23.0555 3.35044 22.6452 2.68122 21.9781 2.01406C21.311 1.34695 20.6417 0.936625 19.8526 0.630005C19.0893 0.33334 18.217 0.130468 16.9398 0.0722122C15.6598 0.0138127 15.2512 0 11.9922 0ZM11.9922 2.16216C15.1963 2.16216 15.5759 2.1744 16.8412 2.23213C18.0112 2.28548 18.6466 2.48097 19.0695 2.64531C19.6296 2.863 20.0293 3.12303 20.4492 3.54298C20.8692 3.96287 21.1292 4.36262 21.3469 4.92274C21.5112 5.34559 21.7067 5.98098 21.76 7.15097C21.8178 8.41632 21.83 8.79587 21.83 12C21.83 15.2041 21.8178 15.5837 21.76 16.849C21.7067 18.019 21.5112 18.6544 21.3469 19.0773C21.1292 19.6374 20.8692 20.0371 20.4492 20.457C20.0293 20.877 19.6296 21.137 19.0695 21.3547C18.6466 21.519 18.0112 21.7145 16.8412 21.7679C15.5761 21.8256 15.1966 21.8378 11.9922 21.8378C8.78783 21.8378 8.40837 21.8256 7.14316 21.7679C5.97317 21.7145 5.33778 21.519 4.91493 21.3547C4.3548 21.137 3.95505 20.877 3.53516 20.457C3.11526 20.0371 2.85519 19.6374 2.6375 19.0773C2.47316 18.6544 2.27767 18.019 2.22432 16.849C2.16659 15.5837 2.15434 15.2041 2.15434 12C2.15434 8.79587 2.16659 8.41632 2.22432 7.15097C2.27767 5.98098 2.47316 5.34559 2.6375 4.92274C2.85519 4.36262 3.11521 3.96287 3.53516 3.54298C3.95505 3.12303 4.3548 2.863 4.91493 2.64531C5.33778 2.48097 5.97317 2.28548 7.14316 2.23213C8.40851 2.1744 8.78806 2.16216 11.9922 2.16216ZM11.9922 5.83784C8.58891 5.83784 5.83003 8.59671 5.83003 12C5.83003 15.4033 8.58891 18.1622 11.9922 18.1622C15.3955 18.1622 18.1544 15.4033 18.1544 12C18.1544 8.59671 15.3955 5.83784 11.9922 5.83784ZM11.9922 16C9.78305 16 7.99219 14.2091 7.99219 12C7.99219 9.79085 9.78305 8 11.9922 8C14.2013 8 15.9922 9.79085 15.9922 12C15.9922 14.2091 14.2013 16 11.9922 16ZM19.8378 5.59438C19.8378 6.38968 19.1931 7.03436 18.3978 7.03436C17.6025 7.03436 16.9578 6.38968 16.9578 5.59438C16.9578 4.79908 17.6025 4.15436 18.3978 4.15436C19.1931 4.15436 19.8378 4.79908 19.8378 5.59438Z"
                                    fill="#2E2D4D" />
                            </svg>
                        </li>
                        <li>
                            <svg width="29" height="22" viewBox="0 0 29 22" fill="none"
                                xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd"
                                    d="M11.4284 14.7621L11.4274 6.61276L19.2089 10.7015L11.4284 14.7621ZM28.514 5.20061C28.514 5.20061 28.2322 3.20204 27.3691 2.32194C26.2738 1.1663 25.0462 1.16085 24.4837 1.09377C20.4535 0.800106 14.4082 0.80011 14.4082 0.80011H14.3957C14.3957 0.80011 8.35036 0.800106 4.32016 1.09377C3.75676 1.16085 2.53006 1.1663 1.43386 2.32194C0.570756 3.20204 0.289951 5.20061 0.289951 5.20061C0.289951 5.20061 0.00195312 7.54814 0.00195312 9.89477V12.0955C0.00195312 14.443 0.289951 16.7896 0.289951 16.7896C0.289951 16.7896 0.570756 18.7882 1.43386 19.6683C2.53006 20.824 3.96915 20.7877 4.60995 20.9083C6.91395 21.1312 14.402 21.2001 14.402 21.2001C14.402 21.2001 20.4535 21.191 24.4837 20.8974C25.0462 20.8294 26.2738 20.824 27.3691 19.6683C28.2322 18.7882 28.514 16.7896 28.514 16.7896C28.514 16.7896 28.8019 14.443 28.8019 12.0955V9.89477C28.8019 7.54814 28.514 5.20061 28.514 5.20061Z"
                                    fill="#2E2D4D" />
                            </svg>
    
                        </li>
                        <li>
                            <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd"
                                    d="M13.6297 24H2.13516C1.40338 24 0.810547 23.4068 0.810547 22.6753V1.32461C0.810547 0.592927 1.40348 0 2.13516 0H23.486C24.2175 0 24.8106 0.592927 24.8106 1.32461V22.6753C24.8106 23.4069 24.2174 24 23.486 24H17.3702V14.7059H20.4898L20.9569 11.0838H17.3702V8.77132C17.3702 7.72265 17.6614 7.008 19.1652 7.008L21.0832 7.00716V3.76755C20.7515 3.72341 19.6129 3.62479 18.2883 3.62479C15.523 3.62479 13.6297 5.31276 13.6297 8.41261V11.0838H10.5021V14.7059H13.6297V24Z"
                                    fill="#2E2D4D" />
                            </svg>
    
                        </li>
                        <li>
                            <svg width="30" height="24" viewBox="0 0 30 24" fill="none"
                                xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd"
                                    d="M29.6105 2.84117C28.5523 3.32308 27.413 3.64897 26.2178 3.79459C27.4383 3.04572 28.3748 1.85829 28.816 0.443774C27.6733 1.13717 26.4106 1.6416 25.0616 1.91202C23.9865 0.734993 22.4498 0 20.7493 0C17.4884 0 14.8429 2.71289 14.8429 6.0585C14.8429 6.53348 14.8936 6.99459 14.995 7.43836C10.0843 7.18527 5.73141 4.77573 2.8154 1.10596C2.30658 2.0039 2.01582 3.04572 2.01582 4.15515C2.01582 6.25612 3.05883 8.11095 4.64446 9.19784C3.67753 9.16837 2.76469 8.89275 1.9668 8.44204V8.51657C1.9668 11.4531 4.00378 13.9025 6.70848 14.4572C6.21318 14.5993 5.69084 14.6704 5.15159 14.6704C4.77124 14.6704 4.39935 14.634 4.03928 14.5629C4.79153 16.969 6.97219 18.7216 9.55856 18.7684C7.53679 20.3944 4.98761 21.3634 2.22037 21.3634C1.74366 21.3634 1.27204 21.3356 0.810547 21.2802C3.42565 22.9963 6.53268 24 9.86791 24C20.7374 24 26.6793 14.7692 26.6793 6.7623C26.6793 6.49881 26.6742 6.23532 26.6641 5.97703C27.8187 5.12243 28.8211 4.05634 29.6105 2.84117Z"
                                    fill="#2E2D4D" />
                            </svg>
    
                        </li>
                        <li>
                            <svg width="27" height="24" viewBox="0 0 27 24" fill="none"
                                xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd"
                                    d="M13.6477 3.75073e-09H13.6466C13.6245 3.75073e-09 13.6037 -4.11291e-06 13.584 0.00026042C13.4263 0.00184815 13.1672 0.00435787 13.1439 0.0046224C12.5756 0.0046224 11.4385 0.0846749 10.2171 0.622217C9.51881 0.929356 8.89067 1.34465 8.35023 1.85659C7.7059 2.46657 7.18099 3.21863 6.79036 4.09222C6.21828 5.37131 6.35408 7.52578 6.46315 9.25715L6.46355 9.25986C6.47523 9.44528 6.4875 9.63891 6.49872 9.82757C6.41479 9.86601 6.27872 9.90656 6.07816 9.90656C5.75546 9.90656 5.37173 9.8037 4.93791 9.60101C4.81026 9.54174 4.66458 9.51177 4.50383 9.51177C4.24555 9.51177 3.97328 9.58757 3.73709 9.72603C3.43994 9.9 3.24794 10.1459 3.19579 10.4185C3.16143 10.5988 3.16308 10.9553 3.56015 11.3167C3.77855 11.5157 4.09939 11.6992 4.51351 11.8624C4.62218 11.905 4.75115 11.9458 4.88775 11.989C5.36178 12.1392 6.07922 12.3662 6.26631 12.8052C6.36112 13.0278 6.32031 13.3207 6.14536 13.6748C6.14079 13.6844 6.13621 13.6939 6.13203 13.7038C6.08831 13.8056 5.68043 14.7268 4.84377 15.6984C4.36835 16.2509 3.8447 16.7126 3.28821 17.0712C2.60898 17.5089 1.87403 17.7951 1.10398 17.9215C0.801587 17.971 0.585633 18.2397 0.602484 18.5449C0.607659 18.6329 0.62836 18.7206 0.664252 18.8055L0.665115 18.807C0.787386 19.0922 1.07088 19.3344 1.53176 19.5481C2.09496 19.8089 2.93726 20.0284 4.03504 20.2C4.09051 20.3052 4.14809 20.5695 4.18797 20.7505C4.2297 20.9429 4.27322 21.1407 4.33525 21.3508C4.40219 21.5784 4.57581 21.8504 5.02184 21.8504C5.19088 21.8504 5.38527 21.8125 5.61037 21.7689C5.94003 21.7044 6.39084 21.6165 6.9535 21.6165C7.26545 21.6165 7.58874 21.6438 7.91415 21.6978C8.54143 21.8019 9.0822 22.1828 9.70789 22.6239C10.6237 23.2694 11.6603 24 13.2441 24C13.2873 24 13.3307 23.9986 13.3734 23.9956C13.4258 23.9981 13.4907 24 13.5591 24C15.1434 24 16.1798 23.2691 17.0946 22.6241L17.0961 22.6228C17.7219 22.1822 18.262 21.8019 18.8891 21.6978C19.2144 21.6439 19.5376 21.6165 19.8497 21.6165C20.3872 21.6165 20.8128 21.6848 21.1928 21.7587C21.4408 21.8074 21.6336 21.8308 21.7814 21.8308L21.7959 21.831H21.8109C22.1371 21.831 22.3768 21.6525 22.4683 21.3401C22.5291 21.1344 22.5725 20.9412 22.6152 20.7456C22.6525 20.576 22.7121 20.3042 22.7676 20.1979C23.8661 20.0259 24.7081 19.8069 25.2713 19.5461C25.7311 19.3335 26.0143 19.0915 26.1373 18.8075C26.1742 18.7224 26.1957 18.6341 26.2006 18.5443C26.2179 18.2395 26.0016 17.9703 25.699 17.9209C22.2767 17.3585 20.7349 13.8522 20.6712 13.7032C20.6671 13.6934 20.6624 13.6837 20.6576 13.6743C20.4826 13.3201 20.4422 13.0275 20.5371 12.8045C20.7238 12.3658 21.4408 12.1389 21.9151 11.9887C22.0525 11.9456 22.1819 11.9046 22.2897 11.8621C22.7567 11.6782 23.0905 11.4787 23.3107 11.2521C23.5736 10.982 23.6249 10.7233 23.6217 10.5539C23.6137 10.1442 23.2995 9.78008 22.7998 9.60181C22.631 9.53222 22.4386 9.49549 22.2426 9.49549C22.1092 9.49549 21.9116 9.51376 21.7246 9.60081C21.3242 9.78762 20.9655 9.88976 20.6576 9.90431C20.4939 9.89604 20.3791 9.86064 20.3047 9.82684C20.314 9.66702 20.3244 9.50284 20.3351 9.33164L20.3395 9.25835C20.4492 7.52586 20.5855 5.36973 20.0131 4.08971C19.6208 3.21302 19.0941 2.45902 18.4471 1.84772C17.9046 1.33545 17.2743 0.920222 16.5735 0.613281C15.3538 0.0797085 14.2168 3.75073e-09 13.6477 3.75073e-09Z"
                                    fill="#2E2D4D" />
                            </svg>
    
                        </li>
                    </ul>
                </div>
            </div>
            </div>
        </div>
       
    </div>
    <style>
        .container::before {
            content: none !important;

        }

        .container::after {
            content: none !important;
        }
    </style>

    @include('layouts.partials.javascripts')

    <!-- Scripts -->
    <script src="{{ asset('js/login.js?v=' . $asset_v) }}"></script>

    @yield('javascript')

    <script type="text/javascript">
        $(document).ready(function() {
            $('.select2_register').select2();

            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });
    </script>
</body>

</html>
