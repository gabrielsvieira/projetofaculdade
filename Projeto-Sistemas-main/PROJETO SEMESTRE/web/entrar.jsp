<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>

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
                                <br> <br><!-- comment -->
                                <br> <br>
                               
                                <h1>LOGIN FEITO COM SUCESSO !!!</h1>
                                        <a href="index.html">Clique aqui para voltar ao menu inicial</a>
                         
					

                                            
                                       
                                            
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
            
           String username, senha;
            
            
           

            Connection con;
            PreparedStatement st;
            ResultSet rs;

            //Recebe os dados vidos do formulário cadcli.html
            
            username = request.getParameter("username");
           
            senha = request.getParameter("senha");
            
            try {
                //Conecta com o banco de dados
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/controleclientes", "root", "freestep");
                //Excutando o comando INSERT que insere os dados o Banco de dados
                st = con.prepareStatement("SELECT * FROM PROJETO  WHERE USERNAME = ? AND SENHA = ?");
                
                st.setString(1, username);
               
                st.setString(2, senha);
                
                rs = st.executeQuery();
                
                 if(rs.next()){
                   out.print("Nome: " + rs.getString("nome") + "<br>");
                    out.print("Username: " + rs.getString("username") + "<br>");
                    out.print("Email: " + rs.getString("email")  + "<br>");
                    out.print("Senha: " + rs.getString("senha")  + "<br>");
                    out.print("Cpf: " + rs.getString("cpf")  + "<br>");
                    
                    
               }else{ //se não encontrou
                    out.print("Este username não está cadastrado");
               }
                
                
                out.print("Dados cadastrados com sucesso");
            } catch (ClassNotFoundException ex) {
                out.print("Driver de conexão não encontrado " + ex.getMessage());
            } catch (SQLException ex) {
                if (ex.getErrorCode() == 1062) {
                    out.print("Este username já está cadastrado");
                } else {
                    out.print("Erro ao entrar. Entre em contato com o administrador do site");
                }
            }
        %>    
    </body>
</html>
