$(function(){
  function buildHTML(comment) {
    var html = `<div class="text-right marginleft100 rounded">
                  <div class="card-header h5 upper borderbottom paddingbottom0">
                    ${comment.user_nickname}
                    <div>
                      <small class="text-secondary time_text">
                      ${comment.date}
                      </small>
                      <div class="destroy_btn d-inline" data-toggle="modal" data-target="#exampleModal_${comment.id}">
                        <i class="far fa-trash-alt"></i>
                      </div>
                      <div class="modal fade" id="exampleModal_${comment.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <h5 class="modal-body text-center font-weight-normal">
                              Really destroy this comment?
                            </h5>
                            <div class="modal-footer">
                              <div class="btn btn-secondary" data-dismiss="modal">
                                Maybe latter
                              </div>
                              <a class="btn btn-primary" rel="nofollow" data-method="DELETE" href="/comments/${comment.id}">
                                Yes, I want
                              </a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card-header borderbottom text-left">
                    <h6 class="rounded comment_text">
                      ${comment.text}
                    </h6>
                  </div>
                </div>`
    return html;
  }
  $('.new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    var index = $('.new_comment').index(this)
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(comment){
      var html = buildHTML(comment);
      $('.comment_box').eq(index).append(html);
      $('.new_comment')[index].reset();
    })
    .fail(function() {
      alert('error');
    })
    .always(function() {
      $('.comment-button').prop('disabled', false);
    })
  })
  
});