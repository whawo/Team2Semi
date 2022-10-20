/** 
    전체 체크박스는 class="check-all"
    개별 체크박스는 class="check-item"
    으로 만들어야 작동된다.
*/
window.addEventListener("load", function(){
    //[1] 전체선택을 체크하면 개별항목을 변경
    var checkAllItems = document.querySelectorAll(".check-all");
    for(var i=0; i < checkAllItems.length; i++){
        checkAllItems[i].addEventListener("input", function(e){
            //this == 체크된 전체선택 체크박스 == e.target

            var checkItems = document.querySelectorAll(".check-item");
            for(var k=0; k < checkItems.length; k++){
                checkItems[k].checked = this.checked;
            }

            var checkAllItems = document.querySelectorAll(".check-all");
            for(var k=0; k < checkAllItems.length; k++){
                checkAllItems[k].checked = this.checked;
            }
        });
    }

    //[2] 개별항목을 체크하면 전체선택을 변경
    var checkItems = document.querySelectorAll(".check-item");
    for(var i=0; i < checkItems.length; i++){
        checkItems[i].addEventListener("input", function(e){
            //this == 체크된 아이템 체크박스 == e.target
            var countAll = document.querySelectorAll(".check-item").length;
            var countCheck = document.querySelectorAll(".check-item:checked").length;
            var allCheck = countAll == countCheck;

            var checkAllItems = document.querySelectorAll(".check-all");
            for(var k=0; k < checkAllItems.length; k++){
                checkAllItems[k].checked = allCheck;
            }
        });
    }
});