<%@attribute name="title" required="true" %>
<%@attribute name="titlePage" required="true" %>
<%@attribute name="caminho" required="true"%>
<%@attribute name="alunoAtivo" required="false"%>
<%@attribute name="servidorAtivo" required="false"%>
<%@attribute name="paramVolta" required="false"%>

<!DOCTYPE html>
<html>
    <head>
        <title>${title}</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="${caminho}/img/icons/favicon.ico">
        <link rel="apple-touch-icon" href="${caminho}/img/icons/favicon.png">
        <link rel="apple-touch-icon" sizes="72x72" href="${caminho}/img/icons/favicon-72x72.png">
        <link rel="apple-touch-icon" sizes="114x114" href="${caminho}/img/icons/favicon-114x114.png">
        <!--Loading bootstrap css-->
        <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700">
        <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
        <link type="text/css" rel="stylesheet" href="${caminho}styles/jquery-ui-1.10.4.custom.min.css">
        <link type="text/css" rel="stylesheet" href="${caminho}/styles/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="${caminho}/styles/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="${caminho}/styles/animate.css">
        <link type="text/css" rel="stylesheet" href="${caminho}/styles/all.css">
        <link type="text/css" rel="stylesheet" href="${caminho}/styles/main.css">
        <link type="text/css" rel="stylesheet" href="${caminho}/styles/style-responsive.css">
        <link type="text/css" rel="stylesheet" href="${caminho}/styles/zabuto_calendar.min.css">
        <link type="text/css" rel="stylesheet" href="${caminho}/styles/pace.css">
        <link type="text/css" rel="stylesheet" href="${caminho}/styles/jquery.news-ticker.css">
    </head>
    <body>
        <div>
            <!--BEGIN BACK TO TOP-->
            <a id="totop" href="#">
                <i class="fa fa-angle-up"></i>
            </a>
            <!--END BACK TO TOP-->

            <!--BEGIN TOPBAR-->
            <div id="header-topbar-option-demo" class="page-header-topbar">
                <nav id="topbar" role="navigation" style="margin-bottom: 0;" data-step="3" class="navbar navbar-default navbar-static-top">
                    <div class="navbar-header">
                        <button type="button" data-toggle="collapse" data-target=".sidebar-collapse" class="navbar-toggle"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                        <a id="logo" href="index.html" class="navbar-brand">
                            <span class="fa fa-rocket"></span>
                            <span class="logo-text">SisCoor</span>
                            <span style="display: none" class="logo-text-icon">Âµ</span>
                        </a>
                    </div>
                    <div class="topbar-main">
                        <a id="menu-toggle" href="#" class="hidden-xs">
                            <i class="fa fa-bars"></i>
                        </a>
                        <ul class="nav navbar navbar-top-links navbar-right mbn"></ul>
                    </div>
                </nav>
            </div>
            <!--END TOPBAR-->

            <div id="wrapper">
                <!--BEGIN SIDEBAR MENU-->
                <nav id="sidebar" role="navigation" data-step="2" data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;"
                     data-position="right" class="navbar-default navbar-static-side">
                    <div class="sidebar-collapse menu-scroll">
                        <ul id="side-menu" class="nav">

                            <div class="clearfix"></div>
                            <div class="row"></div>
                            <li class='${alunoAtivo}'><a href="../${paramVolta}/tela_login/login_aluno.jsp"><i class="fa fa-user fa-fw">
                                        <div class="icon-bg bg-orange"></div>
                                    </i><span class="menu-title">Aluno</span></a></li>

                            <li class="${servidorAtivo}"><a href="../${paramVolta}/tela_login/login_servidor.jsp"><i class="fa fa-university fa-fw">
                                        <div class="icon-bg bg-pink"></div>
                                    </i><span class="menu-title">Servidor</span></a></li>                            
                        </ul>
                    </div>
                </nav>
                <!--END SIDEBAR MENU-->

                <!--BEGIN PAGE WRAPPER-->
                <div id="page-wrapper">
                    <!--BEGIN TITLE & BREADCRUMB PAGE-->
                    <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                        <div class="page-header pull-left">
                            <div class="page-title">${titlePage}</div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                    <!--END TITLE & BREADCRUMB PAGE-->

                    <!--BEGIN CONTENT-->


                    <!-- Conteúdo aqui -->


                    <!--END CONTENT-->

