<%-- 
    Document   : form
    Created on : 01 Mar 2017, 12:04:33 PM
    Author     : LQwabe
--%>

<!DOCTYPE html>
<html>
<head>
<script type='text/javascript'
  src='http://code.jquery.com/jquery-git2.js'></script>
<script type='text/javascript'
  src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.1.0/bootstrap.min.js"></script>
<script type='text/javascript'
  src="http://eternicode.github.io/bootstrap-datepicker/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<style type='text/css'>
@import url('http://getbootstrap.com/dist/css/bootstrap.css');
@import
  url('http://eternicode.github.io/bootstrap-datepicker/bootstrap-datepicker/css/datepicker.css')
  ;
</style>
<script type='text/javascript'>
$(window).load(function(){
    $('.input-daterange').datepicker({});
});
</script>
</head>
<body>
 
   
      <div class="col-md-5">
        <div class="panel panel-primary">
          <div class="panel-heading">
            <h3 class="panel-title">New Leading Practice</h3>
          </div>
          <div class="panel-body">
            <form class="form-horizontal" role="form">
                 <input type="hidden" name="added_by" id="added_by"  readonly/>
              <div class="form-group">
                <label for="focus_area_name" class="col-sm-3 control-label">Focus area</label>
                <div class="col-sm-9">
                  <input type="text" name="focus_area_name" id="focus_area_name"class="form-control" 
                    />
                </div>
              </div>
                <div class="form-group">
                <label for="process_activity_name" class="col-sm-3 control-label">Process activity</label>
                <div class="col-sm-9">
                  <input type="text" name="process_activity_name" id="process_activity_name"
                    class="form-control" />
                </div>
              </div>
                <div class="form-group">
                <label for="sub_activity_name" class="col-sm-3 control-label">Sub activity</label>
                <div class="col-sm-9">
                  <input type="text" name="sub_activity_name" id="sub_activity_name"class="form-control" 
                    />
                </div>
              </div>
                <div class="form-group">
                <label for="issues" class="col-sm-3 control-label">Issues</label>
                <div class="col-sm-9">
                  <textarea name="issues" required="" class="form-control" ></textarea>
                  
                </div>
              </div>
                <div class="form-group">
                <label for="solutions" class="col-sm-3 control-label">Solutions</label>
                <div class="col-sm-9">
                  <textarea name="solutions" required="" class="form-control" ></textarea>
                   
                </div>
              </div>
              
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" class="btn btn-primary btn-xs">Save</button>&nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-primary btn-xs">Cancel</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
      

 
</body>
</html>