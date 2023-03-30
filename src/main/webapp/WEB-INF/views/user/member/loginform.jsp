<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <!-- bootstrap 1 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- jquery 2 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <!-- vue 2 -->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.js"></script>
    <script type="text/javascript">

        function regist() {
            $("#form1").attr({
                action: "/member/join.jsp",
                method: "post"
            });
            $("#form1").submit();
        }

        function gotoAuthForm(sns) {
            $.ajax({
                url: "/rest/member/authform/" + sns,
                type: "get",
                success: function (result, status, xhr) {
                    console.log("인증주소는 ", result.msg);
                    location.href = result.msg;
                }
            });
        }

        $(function () {
            $("#bt_google").click(function () {
                gotoAuthForm("google");
            });
        });

        $(function () {
            $("#bt_naver").click(function () {
                gotoAuthForm("naver");
            });

            $(function () {
                $("#bt_kakao").click(function () {
                    gotoAuthForm("kakao");
                });
            });
        });
    </script>

</head>

<body>

    <div class="container">

        <div class="row" style="margin-top: 90px;">
            <div class="col"> </div>
            <div class="col-5">

                <img class="card-img-center" src="/resources/user/data/EduZinoLogo.png" alt="Card image"
                    style="width:50%; margin-left:80px;">


            </div>
            <div class="col"> </div>
        </div>

        <div class="row">
            <div class="col"> </div>
            <div class="col-5">

                <button type="button" class="btn" id="bt_google">
                    <img src="/resources/user/data/googlelogin.png" alt="Google로 로그인하기"
                        style="width:280px; margin-left:45px;">
                </button>


            </div>
            <div class="col"> </div>
        </div>

        <div class="row">
            <div class="col"> </div>
            <div class="col-5">

                <button type="button" class="btn" id="bt_naver">
                    <img src="/resources/user/data/naverlogin.png" alt="네이버로 로그인하기"
                        style="width:280px; margin-left:45px;">
                </button>

            </div>
            <div class="col"> </div>
        </div>

        <div class="row">
            <div class="col"> </div>
            <div class="col-5">

                <button type="button" class="btn" id="bt_kakao">
                    <img src="/resources/user/data/kakaologin.png" alt="카카오로 로그인하기"
                        style="width:275px; margin-left:45px;">
                </button>
            </div>
            <div class="col"> </div>
        </div>
    </div>
</body>

</html>