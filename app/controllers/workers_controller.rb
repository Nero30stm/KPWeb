class WorkersController < ApplicationController
	def worker_params
    params.require(:worker).permit(:name, :descr, :job, :photo)
  end
end
