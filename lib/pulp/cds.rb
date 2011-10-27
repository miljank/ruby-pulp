module Pulp
  class Cds < Pulp::Connection::Base
    
    has_crud

    pulp_fields :cluster_id, :description, :hostname, :name

    pulp_action :associate, :params => true, :returns => Pulp::Task
    pulp_action :un_associate, :params => true, :returns => Pulp::Task

    pulp_action :history, :params => true

    pulp_action :sync, :params => false, :task_list => true

    def history(action)
      self.class.base_get("history/#{action}/",self.id).collect{|th| Pulp::TaskHistory.new(th) }
    end
  end
end