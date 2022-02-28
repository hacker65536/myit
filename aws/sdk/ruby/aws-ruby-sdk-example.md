```ruby
# frozen_string_literal: true

require 'aws-sdk-ec2'
def select_subnet(subnets)
  ary = []
  trace = false
  client = Aws::EC2::Client.new(http_wire_trace: trace, region: 'ap-northeast-1')
  ec2_resource = Aws::EC2::Resource.new(client: client)
  ec2_resource.subnets({ subnet_ids: subnets }).each_with_index do |v, k|
    ary[k] = v
  end
  return ary[0].id if ary[0].available_ip_address_count > ary[1].available_ip_address_count

  ary[1].id
end

subnets = %w[subnet-11111111111 subnet-22222222222]

#subnet = select_subnet(subnets)
#puts subnet
puts select_subnet(subnets)
```
