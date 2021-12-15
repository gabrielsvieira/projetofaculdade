<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<link rel="stylesheet" type="text/css" href="css/style_1_1.css">
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Games action</title>
    </head>
    <body>
        	<header class="header">
		<img src="img/logo.png" alt="Games" draggable="false"/>
			<a href="ent_cli.html">Entrar</a>
		
	</header>
	<main class="main">
		<div class="main-child">
			<h1>Jogos gratuitos, MMORPG, FPS, MOBA e muito mais.</h1>
				<span>Baixe jogos para PC e Console a hora que quiser.</span>
                                br> <br><!-- comment -->
                                <br> <br>
                                <h1>Cadastro feito com sucesso!!!</h1>
                                
                                <a href="index.html">Clique aqui para voltar ao menu inicial</a>
					
<!--        <form action="">-->
 
    </div>
		<div class="gradient"></div>
	</main>
		<section class="section">
			<div class="container">
				<div class="grid">
					<div>
					<h1>Jogos MMORPG's.</h1>
					<p>Jogue de graça com seus amigos os melhores jogos da atualidade.</p>
				</div>
			<div class="mmo">
			<img src="img/mmo.jpg" alt="mmo">
				</div>
			</div>
		</div>
	</section>
	<section class="download section">
		<div class="container">
			<div class="grid">
				<div>
			<h1>Jogos Mobile</h1>
			<p>Fique conectado em qualquer lugar.</p>
				</div>
			<div class="mmo">
			<img src="img/mobile.jpg" alt="mobile">
				</div>
			</div>
		</div>
	</section>
		<section class="section">
			<div class="container">
				<div class="grid">
					<div>
						<h1>Jogos FPS</h1>
						<p>Crie seu squad e mande bala.</p>
					</div>
			<div class="mmo">
				<img src="img/fps.jpg" alt="jps">
				</div>
			</div>
		</div>
	</section>
	<footer>
		<div class="layout-rodape">
			<p>&copy; Projeto de Sistemas. Todos os direitos reservados.</p>
		</div>
	</footer>
        
        
        
        
        
        
        <%
            String nome, username, email;
            double senha;
            double cpf;

            Connection con;
            PreparedStatement st;

            //Recebe os dados vidos do formulário cadcli.html
            nome = request.getParameter("nome");
            username = request.getParameter("username");
            email = request.getParameter("email");
            senha = Double.parseDouble(request.getParameter("senha"));
            cpf = Double.parseDouble(request.getParameter("cpf"));
            try {
                //Conecta com o banco de dados
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/controleclientes", "root", "freestep");
                //Excutando o comando INSERT que insere os dados o Banco de dados
                st = con.prepareStatement("INSERT INTO PROJETO VALUES (?,?,?,?,?)");
                st.setString(1, nome);
                st.setString(2, username);
                st.setString(3, email);
                st.setDouble(4, senha);
                st.setDouble(5, cpf);
                st.executeUpdate();
                out.print("Dados cadastrados com sucesso");
            } catch (ClassNotFoundException ex) {
                out.print("Driver de conexão não encontrado " + ex.getMessage());
            } catch (SQLException ex) {
                if (ex.getErrorCode() == 1062) {
                    out.print("Este código de cliente já está cadastrado");
                } else {
                    out.print("Erro no cadastro. Entre em contato com o administrador do site");
                }
            }
        %>    
    </body>
</html>
