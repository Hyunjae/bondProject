<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>달력 연습</title>
    <!-- fullcalendar cdn -->
    <script src="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.11.3/main.min.js,npm/fullcalendar@5.11.3,npm/fullcalendar@5.11.3/locales-all.min.js,npm/fullcalendar@5.11.3/locales-all.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.11.3/main.min.css,npm/fullcalendar@5.11.3/main.min.css">
    
    <!-- css -->
    <link rel="stylesheet" href="/resources/calendar/calendar-style.css">

    <!-- fullcalendar script -->
    <script>
      document.addEventListener('DOMContentLoaded', function() {

      // modal
      const modal = document.getElementById("modal");

      // 모달 숨기기 즉시 실행 함수
      (function hideModal(){
          modal.style.display="none"
      })()

      // fullcalendar 관련
      var calendarEl = document.getElementById('calendar');

      var calendar = new FullCalendar.Calendar(calendarEl, {
          locale: 'ko',
          initialView: 'dayGridMonth',

          headerToolbar : {
            left: 'title',
            center: 'prev next today',
            right: 'addEventButton'
          },
          customButtons : {
            addEventButton : {
              text: '일정 추가하기',
              click: function() {
                // 모달 열기 이벤트
                const modal = document.getElementById("modal");
                modal.style.display="block";

                // 모달 닫기 이벤트
                const closeModalButton = document.getElementById("closeModalButton");

                closeModalButton.addEventListener("click", () => {
                    modal.style.display="none"
                })

                // 확인 버튼 클릭 시 이벤트
                const confirmButton = document.getElementById("confirmButton");

                confirmButton.addEventListener("click", () => {
                  const inputStartDate = document.getElementById("inputStartDate").value; /* 시작 날짜 */
                  const inputStartTime = document.getElementById("inputStartTime").value; /* 시작 시간 */
                  const inputEndDate = document.getElementById("inputEndDate").value; /* 종료 날짜 */
                  const inputEndTime = document.getElementById("inputEndTime").value; /* 종료 시간 */

                  // 날짜 형식을 fullcalander에 맞게 변환
                  var startDate = new Date(inputStartDate + 'T' + inputStartTime); // will be in local time
                  var endDate = new Date(inputEndDate + 'T' + inputEndTime); // will be in local time

                  // fullcalander에 이벤트 추가
                  calendar.addEvent({
                    title: 'dynamic event',
                    start: startDate,
                    end: endDate,
                    allDay: true,
                    backgroundColor: 'red'
                  });

                  modal.style.display="none"

                })

              }
            }
          }

      });
      calendar.render();

      });

    </script>


  </head>
  
  <body>
    <div id='calendar'></div>

    <div id="modal">

      <div id="window">
        <div class="window-header">
          <h3>일정 추가하기</h3>
          <span id="closeModalButton">&times;</span>
        </div> <!-- end window-header -->

        <div class="window-body">

          <div id="titleBox">
            제목 : <input type="text">
          </div> <!-- end titleBox -->
  
          <div id="dateBox">
            <div class="dateBoxRow">
              시작 날짜 <input type="date" value="2022-11-30" id="inputStartDate"> <input type="time" value="11:32" id="inputStartTime">
            </div>
            <div class="dateBoxRow">
              종료 날짜 <input type="date" id="inputEndDate" value="2022-12-08"> <input type="time" id="inputEndTime">
            </div>
          </div> <!-- end dateBox -->
  
          <div id="commentBox">
            내용 : <input type="text">
          </div> <!-- end commentBox -->
  
          <div id="buttonBox">
            <button type="button" id="confirmButton">확인</button>
          </div> <!-- end buttonBox -->

        </div> <!-- end window-body -->
        

      </div> <!-- end window -->

    </div> <!-- end modal -->

    <!-- script -->
    <script src="/resources/calendar/calendar.js"></script>
  </body>
</html>