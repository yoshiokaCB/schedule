module TimetablesHelper

  def check_week w
    wdays = ["日", "月", "火", "水", "木", "金", "土"]
    wdays[w]
  end

  def create_calendar
    @today = Time.new
    start_d = Time.new(@today.year, @today.month, 1)
    last_day = start_d.at_end_of_month.day
    end_d = Time.new(@today.year, @today.month, last_day)
    ary = []

    html = %*<table class="table table-striped table-bordered">*
    html << %*<colgroup scope"col" width="70">*
    html << %*<colgroup scope"col" width="70">*
    html << %*<colgroup>*
    html << "<thead>"
    html << "<tr>"
    html << %*<th scope="col" class="day">日</th>*
    html << %*<th scope="col" class="week">曜日</th>*
    html << %*<th scope="col" class="event">枠</th>*
    html << "</tr>"
    html << "</thead>"
    html << "<tbody>"

    @timetables.each do |cal|
      ary << cal.datetime.to_time.day
    end
    # @admin_calendars.each do |cal|
    #   ary << cal.date.to_time.day
    # end
    we = start_d.wday

    last_day.times do |d|
      d += 1
      we == 6 ? we = 0 : we += 1
      week_color = ""
      if we == 1
        week_color = ' class="sunday"'
      elsif we == 0
        week_color = ' class="saturday"'
      end

      if HolidayJapan.check(Date.new(@today.year, @today.month, d))
        week_color = ' class="sunday"'
      end
      html << "<tr#{week_color}>"
      html << '<th scope="row" class="day color_none">'
      html << "#{d}"
      html << "</th>"
      html << '<th scope="row" class="week color_none">'
      html << "#{check_week(we-1)}"
      html << "</th>"
      html << "<td>"



      if ary.include? d
        html << '<ul>'
        @timetables.each do |l|
          # title = l.page.title if l.page.present?
          if l.datetime.to_time.day == d
            frame_text = %*#{l.starttime.strftime("%H:%M")} - #{l.endtime.strftime("%H:%M")}*
            html << "<li>"
            html << %*<span>*
            html << link_to(frame_text, edit_timetable_path(l))
            html << %*</span>*
            html << %*<span>*
            html << l.timetable_users.count.to_s
            html << %*</span>*
            html << %*<span>*
            html << link_to("登録", edit_timetable_path(l))
            html << %*</span>*
            html << %*<span>*
            html << link_to("詳細確認", timetable_path(l))
            html << %*</span>*
            # if l.link_url.present?
            #   html << %*<a href="#{l.link_url}" target="_blank" >#{l.title}</a>*
            # elsif l.page_id.blank?
            #   html << l.title
            # else
            #   html << get_event_link_title_html(l)
            # end
            #
            # if l.place.present?
            #   html << %*<span class="place">*
            #   html << "場所：#{l.place}"
            #   html << %*</span>*
            # end
            #
            # start_t = l.start_time.strftime("%H:%M")
            # end_t   = l.end_time.strftime("%H:%M")
            # unless start_t == end_t
            #   html << %*<span class="time">*
            #   html << "時間：#{start_t}〜#{end_t}"
            #   html << %*</span>*
            # end
            #
            # if l.category.present?
            #   html << %*<span class="category cate#{l.category.id}">*
            #   html << %*<span class="category_title">カテゴリー：</span>*
            #   html << "#{l.category.name}"
            #   html << %*</span>*
            # end
            html << "</li>"
          end
        end
        html << '</ul>'
      end


      html << "</td>"
      html << "</tr>\n"
    end
    html << "</tbody>"
    html << %*</table>*
    return html
  end
end
