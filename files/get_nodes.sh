for i in {7b52cb68-91bf-4fdb-93da-a639f6098e6d,b2c83af3-e24a-463e-8ecb-b16a00c254f5,bce751e0-ebcc-4620-bbcc-eb5c8d71764e,cf7b8974-149a-446c-9add-95b33f1e3267,6d88eeed-8f1f-4642-8846-4b945ac2e288,4171e3ac-f51e-4783-abf2-43c892216c5f,73f4a339-36ca-4073-a74c-338cf6f32a6b,5ae78316-432b-4513-b82d-1c02e5664933,2ffbde99-7334-4f62-8af9-3663cf2ef9a8,30896adb-4e95-4339-a98c-0cedb0da0afc,2a190aa5-5d0b-4721-b771-ab290d755ac0,3c89bcfd-e77b-4612-b810-fd2356f3532d,384386ed-6a47-4c37-8e9b-fd2387fc3bb4}; 
do echo "------------------------------------------------------------------------------------------------";
   ironic node-show $i | grep uuid | grep -v _ ;
   ironic node-show $i | grep 192;
#   ironic node-show $i | grep properties;
   ironic node-show $i | grep cpu;

 done
   echo "------------------------------------------------------------------------------------------------"
