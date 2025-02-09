<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자 페이지</title>

   <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- Toast UI Grid CSS -->
    <link rel="stylesheet" href="https://uicdn.toast.com/tui.grid/latest/tui-grid.css">
    
    <!-- Toast UI Grid Script -->
    <script src="https://uicdn.toast.com/tui.grid/latest/tui-grid.js"></script>
    
    <!-- Toast UI Pagination CSS -->
    <link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css">

    <!-- Toast UI Pagination Script -->
    <script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
	<!-- admin_utils.js 로드 -->
    <script src="${pageContext.request.contextPath}/resources/js/admin_utils.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_default.css">
    
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

<%-- <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/side_bar.jsp"></jsp:include> --%>
<jsp:include page="side_bar.jsp"></jsp:include>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                
					<div class="container-fluid">
						<div class="d-sm-flex align-items-center justify-content-between mb-4">
							<h1 class="h3 mb-0 text-gray-800" id="page-title"></h1>
                    </div>
                    <div>
                        <button class="category-btn" data-category="notice" onclick="location.href='admin-csc?type=notice'">공지사항</button>
                        <button class="category-btn" data-category="faq" onclick="location.href='admin-csc?type=faq'">FAQ</button>
                        <button class="category-btn" data-category="event" onclick="location.href='admin-event'">이벤트</button>
                    </div>
                    <!-- Content Row -->
                    <div class="row">
                        <div class="col-xl-12 col-lg-12">
                            <div id="grid"></div>
                            <button type="button" class="btn btn-secondary" name="registBtn" onclick="javascript:regist()">등록하기</button>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->
    <!-- Bootstrap core JavaScript-->
   <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

    <!-- Toast UI Grid Script -->
    <script src="https://uicdn.toast.com/tui.grid/latest/tui-grid.js"></script>

    <script>
    	
	    function regist(){
			window.open("admin-event-regist?where=regist", "등록폼", "width=1200,height=1000");	
	    }
	    
        document.addEventListener('DOMContentLoaded', function () {
    	    const itemsPerPage = 10;
    	    let currentPage = 1;
    	    const data = ${jo_list};
    	    let type = "event";
    	    
    	    // 버튼 색깔 변경
    	    const buttons = document.querySelectorAll('.category-btn');
    	    buttons.forEach(button => {
    	        if (button.getAttribute('data-category') === type) {
    	            button.classList.add('btn-primary');
    	        } else {
    	            button.classList.remove('btn-primary');
    	        }
    	    });
    	    
    	    // 적응버튼 이벤트
    	    $('#btn-apply').on('click', function () {
    	        const modifiedRows = grid.getModifiedRows();
    	        const jsonData = JSON.stringify(modifiedRows);
    	        $.ajax({
    	            url: 'update-event',
    	            type: 'POST',
    	            contentType: 'application/json',
    	            data: jsonData,
    	            dataType: 'json',
    	            success: function(data) {
    	                if (data.success) {
    	                    alert('변경 사항이 성공적으로 적용되었습니다.');
    	                    location.reload();
    	                } else {
    	                    alert('변경 사항 적용 실패: ' + data.message);
    	                }
    	            },
    	            error: function(xhr, status, error) {
    	                console.error('Error:', error);
    	                alert('변경 사항 적용 실패: 서버 오류');
    	            }
    	        });
    	    });
    	    
    	    
    	    // BootstrapSwitchRenderer 클래스 정의 (스위치 렌더러)
    	    class BootstrapSwitchRenderer {
    	        constructor(props) {
    	            const el = document.createElement('div');
    	            el.className = 'custom-control custom-switch';
    	
    	            const input = document.createElement('input');
    	            input.type = 'checkbox';
    	            input.className = 'custom-control-input';
    	            input.id = 'customSwitch' + props.rowKey;
    	            input.checked = props.value;
    	            input.addEventListener('change', () => {
    	                props.grid.setValue(props.rowKey, props.columnInfo.name, input.checked);
    	            });
    	
    	            const label = document.createElement('label');
    	            label.className = 'custom-control-label';
    	            label.htmlFor = 'customSwitch' + props.rowKey;
    	
    	            el.appendChild(input);
    	            el.appendChild(label);
    	
    	            this.el = el;
    	        }
    	
    	        getElement() {
    	            return this.el;
    	        }
    	
    	        render(props) {
    	            this.el.querySelector('input').checked = props.value;
    	        }
    	    }
    	    // 수정하기 버튼
    	    class ModifyRenderer {
    	        constructor(props) {
    	            const container = document.createElement('div');
    	            
    	            const viewButton = document.createElement('button');
    	            viewButton.className = 'btn btn-danger btn-sm';
    	            viewButton.innerText = '수정하기';
					
					
    	            // 버튼 클릭 이벤트 추가
    	            viewButton.addEventListener('click', () => {
                        const rowKey = props.grid.getIndexOfRow(props.rowKey);
                        const rowData = props.grid.getRow(rowKey);
                        let code = rowData.event_code;
    	                window.open("admin-event-modify?&event_code=" + code + "&where=modify", "상세정보", "width=1200px,height=1000px");
    	            });

    	            container.appendChild(viewButton);
    	            
    	            this.el = container;
    	        }
    	        getElement() {
    	            return this.el;
    	        }
    	        render(props) {
    	            this.el.dataset.rowKey = props.rowKey;
    	            this.el.dataset.columnName = props.columnName;
    	            this.el.dataset.code = props.value.event_code;
    	        }
    	    }

    	    // 상세보기 버튼
    	    class ActionRenderer {
    	        constructor(props) {
    	            const container = document.createElement('div');
    	            
    	            const viewButton = document.createElement('button');
    	            viewButton.className = 'btn btn-primary btn-sm';
    	            viewButton.innerText = '상세보기';
					
					
    	            // 버튼 클릭 이벤트 추가
    	            viewButton.addEventListener('click', () => {
                        const rowKey = props.grid.getIndexOfRow(props.rowKey);
                        const rowData = props.grid.getRow(rowKey);
                        let code = rowData.event_code;
    	                window.open("eventDetail?&event_code=" + code + "&fromAdmin=true", "상세정보", "width=1200px,height=1000px");
    	            });

    	            container.appendChild(viewButton);
    	            
    	            this.el = container;
    	        }
    	        getElement() {
    	            return this.el;
    	        }
    	        render(props) {
    	            this.el.dataset.rowKey = props.rowKey;
    	            this.el.dataset.columnName = props.columnName;
    	            this.el.dataset.code = props.value.event_code;
    	        }
    	    }

            const grid = new tui.Grid({
                el: document.getElementById('grid'),
                data: data,
                columns: [
                    { header: '제목', name: 'event_subject'},
                    { header: '작성일', name: 'event_reg_date'},
                    { header: '이벤트 기간', name: 'event_date'},
                    { header: '지급 포인트', name: 'event_point'},
                    {
                        header: 'Action',
                        name: 'action',
                        renderer: {
                            type: ActionRenderer
                        }
                    },
                    {
                        header: 'Modify',
                        name: 'modify',
                        renderer: {
                            type: ModifyRenderer
                        }
                    },
                ],
    	        pageOptions: {
    	            useClient: true,
    	            perPage: itemsPerPage
    	        },
                bodyHeight: 400
            });
        });
    </script>
</body>
</html>
