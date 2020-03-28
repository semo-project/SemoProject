<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "com.kh.episode.model.vo.Episode" %>    
<%@ page import =" java.util.ArrayList, com.kh.work.model.vo.Work, java.text.SimpleDateFormat, java.util.Date, com.kh.member.model.vo.Member" %>
<% 
	ArrayList<Episode> list = (ArrayList<Episode>)request.getAttribute("list");
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(date);
	Member mem = (Member)request.getAttribute("mem"); 
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- Navigation --<
	<%@ include file="../common/menubar.jsp" %>
	
  <!-- Page Content -->
  <div class="container">
    

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">김작가님의 작품  </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">내 작품관리</a>
      </li>
      <li class="breadcrumb-item active">작품 리스트</li>
    </ol>
    
    <a href="#" class="btn btn-primary">작품등록 신청 &rarr;</a><br><br>
       <!-- Content Row -->
    <div class="row">
      
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
       	<%@ include file="../member/myPageSidebar.jsp" %>

      </div>




    <!-- Content Column -->
    <div class="col-lg-9 mb-4" >
      <div class="row" >
        <div class="col-md-7" >
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt="">
          </a>
        </div>
        
        <div class="col-md-5">
          <h3>나혼자만 레벨업</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam .</p>
          <a class="btn btn-primary" href="#" id="tr1">다음화 등록
            <span class="glyphicon glyphicon-chevron-right"></span>
          </a>
        </div>
      </div>

      <br>
      <div class="mb-4" id="accordion" role="tablist" aria-multiselectable="true">
        <div class="card">
          <div class="card-header" role="tab" id="headingTwo">
            <h5 class="mb-0">
                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                  <% for(Episode ep : list) {%>
                  <table>
                    <tr>
                      <th> <%= ep.getEpisodeTitle() %></th> 
                      <th> <%= ep.getStarGrade() %></th>
                      <th> <%= ep.getRegistDate()%></th>
                      <th> <%= ep.getApprovalDate() %></th>
                    </tr>
                  </table>
                  <% } %>
                </a>
            </h5>
          </div>

        <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo">
          <div class="card-body">
            <br>
            <h3> 등록 제목(화) : 100화 </h3>
            <br><br>

            <div>등록파일:
              <div style="height: 150px;">
                202001054354.png
              </div>
            </div>
            
            <br><br>

            <button>삭제</button>
            <button>수정</button>
            <button>확인</button>
          </div>
        </div>
      </div>
    </div>

  </div>
  <!-- /.row -->
</div>
<!-- /.container -->

  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">에피소드 다음화 등록</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table">
                    <tr>
                        <td>
                            <div>등록 제목(화): <input type="text"> </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div>등록파일:

                              <div style="height: 150px;">
                                202001054354.png
                              </div>
                            </div>
                              
                            <button >다음화 올리기</button>
                        </td>
                    </tr>
                </table>                        
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">등록</button>                        
                <!-- <button type="button" class="btn btn-primary" id="close_modal">다른 방식으로 모달 닫기</button> -->
            </div>
        </div>
    </div>
  </div>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/datatables-demo.js"></script>



  <script>
    $(function() {
        $("#tr1").click(function() {
            $("#exampleModal").modal("show");
        });
    });
  </script>


  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>