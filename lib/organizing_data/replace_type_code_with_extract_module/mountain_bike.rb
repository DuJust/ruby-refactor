module ReplaceTypeCodeWithExtractModule
  class MountainBike

    TIRE_WIDTH_FACTOR = 3
    FRONT_SUSPENSION_FACTOR = 3
    REAR_SUSPENSION_FACTOR = 3

    def initialize(params)
      @type_code = params[:type_code]
      @tire_width = params[:tire_width]
      @front_fork_travel = params[:front_fork_travel]
      @rear_fork_travel = params[:rear_fork_travel]
      @commission = params[:commission]
      @base_price = params[:base_price]
      @front_suspension_price = params[:front_suspension_price]
      @rear_suspension_price = params[:rear_suspension_price]
    end

    def off_road_ability
      result = @tire_width * TIRE_WIDTH_FACTOR
      if @type_code == :front_suspension || @type_code == :full_suspension
        result += @front_fork_travel * FRONT_SUSPENSION_FACTOR
      end
      if @type_code == :full_suspension
        result += @rear_fork_travel * REAR_SUSPENSION_FACTOR
      end
      result
    end


    def price
      case @type_code
        when :rigid
          (1 + @commission) * @base_price
        when :front_suspension
          (1 + @commission) * @base_price + @front_suspension_price
        when :full_suspension
          (1 + @commission) * @base_price + @front_suspension_price + @rear_suspension_price
      end
    end
  end
end