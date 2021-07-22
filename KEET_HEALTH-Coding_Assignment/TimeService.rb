module TimerService

  # goal is to add minutes to a given time
  # time format: [H]H:MM {AM|PM}

  class Main
    attr_accessor :time, :minutes
    def initialize
      @time, @minutes = time, minutes
    end
  end

  class Timer < Main
    def start_adding_time
      add_minutes(@time, @minutes)
    end

    def add_minutes(arg1, arg2)
      oldTimeArray = arg1.split
      hoursToAdd = arg2 / 60
      minutesToAdd = arg2 % 60
      oldTime = oldTimeArray[0]
      tempTimeArray = oldTime.split(":")
      newHours = oldHours = tempTimeArray[0]
      oldMinutes = tempTimeArray[1]
      newMinutes = oldMinutes.to_i + minutesToAdd
      tempHours = oldHours.to_i + hoursToAdd
      amOrPm = oldTimeArray[1]

      # check if adding the minutes goes over an hour
      if newMinutes > 59
        newMinutes = newMinutes - 59
        if newMinutes < 10
          newMinutes = "0#{newMinutes}"
        end
        tempHours += 1
      end
      # check if adding hours will go over 12
      while tempHours > 12
        newHours = tempHours = tempHours - 12
        if amOrPm == "AM"
          amOrPm = "PM"
        else
          amOrPm = "AM"
        end
      end

      newTime = "#{newHours}:#{newMinutes} #{amOrPm}"
      puts "#{newTime}"
      return newTime
    end
  end

  timer = Timer.new.tap do |u|
    u.time = '12:13 AM'
    u.minutes = 10800
    u.start_adding_time
  end
end
