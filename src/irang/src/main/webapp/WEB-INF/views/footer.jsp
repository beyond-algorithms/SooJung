<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
       <footer>
          <div class="container">
            <div class="row">
              <div class="col-lg-8 col-md-10 mx-auto">
                <ul class="list-inline text-center">
                  <li class="list-inline-item">
                     <div class="box">
                       <a class="button" href="#popup1"><img class="btn-img" src="${pageContext.request.contextPath}/img/person.png" onmouseover="this.src='${pageContext.request.contextPath}/img/hperson.png'" onmouseout="this.src='${pageContext.request.contextPath}/img/person.png'"></a>
                      </div>
                      <div id="popup1" class="overlay">
                        <div class="popup">
                          <h2>아이랑 개발자 소개</h2>
                          <a class="close" href="#">&times;</a>
                          <div class="content">
                            <table class="dev_list">
                              <tr>
                                <td class="dev">
                                  <img class="dev_img" src="${pageContext.request.contextPath}/img/programmers/sy.jpg">
                                </td>
                                <td class="dev">
                                  이름: 김소영<br>
                                소속: 서울과학기술대학교 컴퓨터공학과<br>
                                학번: 14109314<br>
                                이메일: sy_0831@naver.com<br>
                                </td>
                              </tr>
                              <tr>
                                <td class="dev">
                                  <img src="${pageContext.request.contextPath}/img/programmers/sj.jpg" class="dev_img">
                                </td>
                                <td class="dev">
                                  이름: 신수정<br>
                                소속: 서울과학기술대학교 컴퓨터공학과<br>
                                학번: 14109349<br>
                                이메일: ssj15987@naver.com<br>
                                </td>
                              </tr>
                              <tr>
                                <td class="dev">
                                  <img src="${pageContext.request.contextPath}/img/programmers/yj.jpg" class="dev_img">
                                </td>
                                <td class="dev">
                                  이름: 원영주<br>
                                소속: 서울과학기술대학교 컴퓨터공학과<br>
                                학번: 14109351<br>
                                이메일: wyj940331@gmail.com<br>
                                </td>
                              </tr>
                            </table>
                          </div>
                        </div>
                      </div>
                  </li>
                  <li class="list-inline-item">
                    <a href="mailto:irang@gmail.com" class="active social-icon si-rounded si-small si-dark si-email3 nobottommargin"><img class="btn-img" src="${pageContext.request.contextPath}/img/mail.png" onmouseover="this.src='${pageContext.request.contextPath}/img/hemail.png'" onmouseout="this.src='${pageContext.request.contextPath}/img/mail.png'">
                    </a>
                  </li>
                </ul>
                <p class="copyright text-muted">Copyright &copy; Capstone IRANG 2018</p>
              </div>
            </div>
          </div>
        </footer>
      </div>
  </body>

</html>