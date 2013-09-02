#this should enable us to add a dynamic select on the results page
jQuery ->
    courses = $('result_course_id').html()
    $('result_course_id').change ->
      student = $('result_course_id :selected').text()
      options = $(courses).filter("optgroup[label='#{student}']").html()
      if options
         $('result_course_id').html(options)
      else
        $('result_course_id').empty()
