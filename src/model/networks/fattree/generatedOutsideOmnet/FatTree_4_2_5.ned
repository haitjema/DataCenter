package datacenter.model.networks.fattree.generatedOutsideOmnet;
import ned.DatarateChannel;
import datacenter.model.switch.EthSwitch;
import datacenter.model.node.server.Server;
import datacenter.model.node.server.*;


network FatTree_4_2_5
{
  parameters:
    **.tree_depth               = 5;
    **.int_switch_down_ports    = 4;
    **.tor_switch_up_ports      = 2;
    **.tor_switch_down_ports    = 2;
    **.switch_up_ports          = 2;
    **.switch_down_ports        = 2;
    **.switch_switch_link_speed = 1000000000 bps;
    **.server_switch_link_speed = 1000000000 bps;
    string ServerType = default("TCPClientServer");
    **.number_of_paths = 16;   

  types:
    channel Link_1Gbps extends DatarateChannel
    {
        @class(DCLink);
        datarate = 1 Gbps;
        delay = 0 us;
    }
    channel Link_10Gbps extends DatarateChannel
    {
        @class(DCLink);
        datarate = 10 Gbps;
        delay = 0 us;
    }

  submodules:
    Server_0_0_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=50,1050,x");
            address = 0;
        gates:
    }
    Server_0_0_0_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=175,1050,x");
            address = 1;
        gates:
    }
    Switch_0_0_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=112,850,x");
            switch_id = "Switch_0_0_0_0_i0";
            depth = 4;
            sub_tree_id = 0;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_0_0_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=300,1050,x");
            address = 2;
        gates:
    }
    Server_0_0_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=425,1050,x");
            address = 3;
        gates:
    }
    Switch_0_0_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=362,850,x");
            switch_id = "Switch_0_0_0_1_i0";
            depth = 4;
            sub_tree_id = 2;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=175,650,x");
            switch_id = "Switch_0_0_0_i0";
            depth = 3;
            sub_tree_id = 0;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_0_0_i1 : EthSwitch
    {
        parameters:
            @display("p=300,650,x");
            switch_id = "Switch_0_0_0_i1";
            depth = 3;
            sub_tree_id = 0;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_0_0_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=550,1050,x");
            address = 4;
        gates:
    }
    Server_0_0_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=675,1050,x");
            address = 5;
        gates:
    }
    Switch_0_0_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=612,850,x");
            switch_id = "Switch_0_0_1_0_i0";
            depth = 4;
            sub_tree_id = 4;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_0_0_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=800,1050,x");
            address = 6;
        gates:
    }
    Server_0_0_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=925,1050,x");
            address = 7;
        gates:
    }
    Switch_0_0_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=862,850,x");
            switch_id = "Switch_0_0_1_1_i0";
            depth = 4;
            sub_tree_id = 6;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=675,650,x");
            switch_id = "Switch_0_0_1_i0";
            depth = 3;
            sub_tree_id = 4;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_0_1_i1 : EthSwitch
    {
        parameters:
            @display("p=800,650,x");
            switch_id = "Switch_0_0_1_i1";
            depth = 3;
            sub_tree_id = 4;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=225,450,x");
            switch_id = "Switch_0_0_i0";
            depth = 2;
            sub_tree_id = 0;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_0_i1 : EthSwitch
    {
        parameters:
            @display("p=400,450,x");
            switch_id = "Switch_0_0_i1";
            depth = 2;
            sub_tree_id = 0;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_0_i2 : EthSwitch
    {
        parameters:
            @display("p=575,450,x");
            switch_id = "Switch_0_0_i2";
            depth = 2;
            sub_tree_id = 0;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_0_i3 : EthSwitch
    {
        parameters:
            @display("p=750,450,x");
            switch_id = "Switch_0_0_i3";
            depth = 2;
            sub_tree_id = 0;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_0_1_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=1050,1050,x");
            address = 8;
        gates:
    }
    Server_0_1_0_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=1175,1050,x");
            address = 9;
        gates:
    }
    Switch_0_1_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=1112,850,x");
            switch_id = "Switch_0_1_0_0_i0";
            depth = 4;
            sub_tree_id = 8;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_0_1_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=1300,1050,x");
            address = 10;
        gates:
    }
    Server_0_1_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=1425,1050,x");
            address = 11;
        gates:
    }
    Switch_0_1_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=1362,850,x");
            switch_id = "Switch_0_1_0_1_i0";
            depth = 4;
            sub_tree_id = 10;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=1175,650,x");
            switch_id = "Switch_0_1_0_i0";
            depth = 3;
            sub_tree_id = 8;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_1_0_i1 : EthSwitch
    {
        parameters:
            @display("p=1300,650,x");
            switch_id = "Switch_0_1_0_i1";
            depth = 3;
            sub_tree_id = 8;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_0_1_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=1550,1050,x");
            address = 12;
        gates:
    }
    Server_0_1_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=1675,1050,x");
            address = 13;
        gates:
    }
    Switch_0_1_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=1612,850,x");
            switch_id = "Switch_0_1_1_0_i0";
            depth = 4;
            sub_tree_id = 12;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_0_1_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=1800,1050,x");
            address = 14;
        gates:
    }
    Server_0_1_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=1925,1050,x");
            address = 15;
        gates:
    }
    Switch_0_1_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=1862,850,x");
            switch_id = "Switch_0_1_1_1_i0";
            depth = 4;
            sub_tree_id = 14;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=1675,650,x");
            switch_id = "Switch_0_1_1_i0";
            depth = 3;
            sub_tree_id = 12;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_1_1_i1 : EthSwitch
    {
        parameters:
            @display("p=1800,650,x");
            switch_id = "Switch_0_1_1_i1";
            depth = 3;
            sub_tree_id = 12;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=1225,450,x");
            switch_id = "Switch_0_1_i0";
            depth = 2;
            sub_tree_id = 8;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_1_i1 : EthSwitch
    {
        parameters:
            @display("p=1400,450,x");
            switch_id = "Switch_0_1_i1";
            depth = 2;
            sub_tree_id = 8;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_1_i2 : EthSwitch
    {
        parameters:
            @display("p=1575,450,x");
            switch_id = "Switch_0_1_i2";
            depth = 2;
            sub_tree_id = 8;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_1_i3 : EthSwitch
    {
        parameters:
            @display("p=1750,450,x");
            switch_id = "Switch_0_1_i3";
            depth = 2;
            sub_tree_id = 8;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_i0 : EthSwitch
    {
        parameters:
            @display("p=258,250,x");
            switch_id = "Switch_0_i0";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_i1 : EthSwitch
    {
        parameters:
            @display("p=466,250,x");
            switch_id = "Switch_0_i1";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_i2 : EthSwitch
    {
        parameters:
            @display("p=674,250,x");
            switch_id = "Switch_0_i2";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_i3 : EthSwitch
    {
        parameters:
            @display("p=882,250,x");
            switch_id = "Switch_0_i3";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_i4 : EthSwitch
    {
        parameters:
            @display("p=1090,250,x");
            switch_id = "Switch_0_i4";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_i5 : EthSwitch
    {
        parameters:
            @display("p=1298,250,x");
            switch_id = "Switch_0_i5";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_i6 : EthSwitch
    {
        parameters:
            @display("p=1506,250,x");
            switch_id = "Switch_0_i6";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_i7 : EthSwitch
    {
        parameters:
            @display("p=1714,250,x");
            switch_id = "Switch_0_i7";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_1_0_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=2050,1050,x");
            address = 16;
        gates:
    }
    Server_1_0_0_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=2175,1050,x");
            address = 17;
        gates:
    }
    Switch_1_0_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=2112,850,x");
            switch_id = "Switch_1_0_0_0_i0";
            depth = 4;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_1_0_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=2300,1050,x");
            address = 18;
        gates:
    }
    Server_1_0_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=2425,1050,x");
            address = 19;
        gates:
    }
    Switch_1_0_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=2362,850,x");
            switch_id = "Switch_1_0_0_1_i0";
            depth = 4;
            sub_tree_id = 18;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=2175,650,x");
            switch_id = "Switch_1_0_0_i0";
            depth = 3;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_0_0_i1 : EthSwitch
    {
        parameters:
            @display("p=2300,650,x");
            switch_id = "Switch_1_0_0_i1";
            depth = 3;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_1_0_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=2550,1050,x");
            address = 20;
        gates:
    }
    Server_1_0_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=2675,1050,x");
            address = 21;
        gates:
    }
    Switch_1_0_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=2612,850,x");
            switch_id = "Switch_1_0_1_0_i0";
            depth = 4;
            sub_tree_id = 20;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_1_0_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=2800,1050,x");
            address = 22;
        gates:
    }
    Server_1_0_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=2925,1050,x");
            address = 23;
        gates:
    }
    Switch_1_0_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=2862,850,x");
            switch_id = "Switch_1_0_1_1_i0";
            depth = 4;
            sub_tree_id = 22;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=2675,650,x");
            switch_id = "Switch_1_0_1_i0";
            depth = 3;
            sub_tree_id = 20;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_0_1_i1 : EthSwitch
    {
        parameters:
            @display("p=2800,650,x");
            switch_id = "Switch_1_0_1_i1";
            depth = 3;
            sub_tree_id = 20;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=2225,450,x");
            switch_id = "Switch_1_0_i0";
            depth = 2;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_0_i1 : EthSwitch
    {
        parameters:
            @display("p=2400,450,x");
            switch_id = "Switch_1_0_i1";
            depth = 2;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_0_i2 : EthSwitch
    {
        parameters:
            @display("p=2575,450,x");
            switch_id = "Switch_1_0_i2";
            depth = 2;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_0_i3 : EthSwitch
    {
        parameters:
            @display("p=2750,450,x");
            switch_id = "Switch_1_0_i3";
            depth = 2;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_1_1_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=3050,1050,x");
            address = 24;
        gates:
    }
    Server_1_1_0_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=3175,1050,x");
            address = 25;
        gates:
    }
    Switch_1_1_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=3112,850,x");
            switch_id = "Switch_1_1_0_0_i0";
            depth = 4;
            sub_tree_id = 24;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_1_1_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=3300,1050,x");
            address = 26;
        gates:
    }
    Server_1_1_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=3425,1050,x");
            address = 27;
        gates:
    }
    Switch_1_1_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=3362,850,x");
            switch_id = "Switch_1_1_0_1_i0";
            depth = 4;
            sub_tree_id = 26;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=3175,650,x");
            switch_id = "Switch_1_1_0_i0";
            depth = 3;
            sub_tree_id = 24;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_1_0_i1 : EthSwitch
    {
        parameters:
            @display("p=3300,650,x");
            switch_id = "Switch_1_1_0_i1";
            depth = 3;
            sub_tree_id = 24;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_1_1_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=3550,1050,x");
            address = 28;
        gates:
    }
    Server_1_1_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=3675,1050,x");
            address = 29;
        gates:
    }
    Switch_1_1_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=3612,850,x");
            switch_id = "Switch_1_1_1_0_i0";
            depth = 4;
            sub_tree_id = 28;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_1_1_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=3800,1050,x");
            address = 30;
        gates:
    }
    Server_1_1_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=3925,1050,x");
            address = 31;
        gates:
    }
    Switch_1_1_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=3862,850,x");
            switch_id = "Switch_1_1_1_1_i0";
            depth = 4;
            sub_tree_id = 30;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=3675,650,x");
            switch_id = "Switch_1_1_1_i0";
            depth = 3;
            sub_tree_id = 28;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_1_1_i1 : EthSwitch
    {
        parameters:
            @display("p=3800,650,x");
            switch_id = "Switch_1_1_1_i1";
            depth = 3;
            sub_tree_id = 28;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=3225,450,x");
            switch_id = "Switch_1_1_i0";
            depth = 2;
            sub_tree_id = 24;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_1_i1 : EthSwitch
    {
        parameters:
            @display("p=3400,450,x");
            switch_id = "Switch_1_1_i1";
            depth = 2;
            sub_tree_id = 24;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_1_i2 : EthSwitch
    {
        parameters:
            @display("p=3575,450,x");
            switch_id = "Switch_1_1_i2";
            depth = 2;
            sub_tree_id = 24;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_1_i3 : EthSwitch
    {
        parameters:
            @display("p=3750,450,x");
            switch_id = "Switch_1_1_i3";
            depth = 2;
            sub_tree_id = 24;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_i0 : EthSwitch
    {
        parameters:
            @display("p=2258,250,x");
            switch_id = "Switch_1_i0";
            depth = 1;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_i1 : EthSwitch
    {
        parameters:
            @display("p=2466,250,x");
            switch_id = "Switch_1_i1";
            depth = 1;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_i2 : EthSwitch
    {
        parameters:
            @display("p=2674,250,x");
            switch_id = "Switch_1_i2";
            depth = 1;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_i3 : EthSwitch
    {
        parameters:
            @display("p=2882,250,x");
            switch_id = "Switch_1_i3";
            depth = 1;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_i4 : EthSwitch
    {
        parameters:
            @display("p=3090,250,x");
            switch_id = "Switch_1_i4";
            depth = 1;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_i5 : EthSwitch
    {
        parameters:
            @display("p=3298,250,x");
            switch_id = "Switch_1_i5";
            depth = 1;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_i6 : EthSwitch
    {
        parameters:
            @display("p=3506,250,x");
            switch_id = "Switch_1_i6";
            depth = 1;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_i7 : EthSwitch
    {
        parameters:
            @display("p=3714,250,x");
            switch_id = "Switch_1_i7";
            depth = 1;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_2_0_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=4050,1050,x");
            address = 32;
        gates:
    }
    Server_2_0_0_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=4175,1050,x");
            address = 33;
        gates:
    }
    Switch_2_0_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=4112,850,x");
            switch_id = "Switch_2_0_0_0_i0";
            depth = 4;
            sub_tree_id = 32;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_2_0_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=4300,1050,x");
            address = 34;
        gates:
    }
    Server_2_0_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=4425,1050,x");
            address = 35;
        gates:
    }
    Switch_2_0_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=4362,850,x");
            switch_id = "Switch_2_0_0_1_i0";
            depth = 4;
            sub_tree_id = 34;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=4175,650,x");
            switch_id = "Switch_2_0_0_i0";
            depth = 3;
            sub_tree_id = 32;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_0_0_i1 : EthSwitch
    {
        parameters:
            @display("p=4300,650,x");
            switch_id = "Switch_2_0_0_i1";
            depth = 3;
            sub_tree_id = 32;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_2_0_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=4550,1050,x");
            address = 36;
        gates:
    }
    Server_2_0_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=4675,1050,x");
            address = 37;
        gates:
    }
    Switch_2_0_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=4612,850,x");
            switch_id = "Switch_2_0_1_0_i0";
            depth = 4;
            sub_tree_id = 36;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_2_0_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=4800,1050,x");
            address = 38;
        gates:
    }
    Server_2_0_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=4925,1050,x");
            address = 39;
        gates:
    }
    Switch_2_0_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=4862,850,x");
            switch_id = "Switch_2_0_1_1_i0";
            depth = 4;
            sub_tree_id = 38;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=4675,650,x");
            switch_id = "Switch_2_0_1_i0";
            depth = 3;
            sub_tree_id = 36;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_0_1_i1 : EthSwitch
    {
        parameters:
            @display("p=4800,650,x");
            switch_id = "Switch_2_0_1_i1";
            depth = 3;
            sub_tree_id = 36;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_0_i0 : EthSwitch
    {
        parameters:
            @display("p=4225,450,x");
            switch_id = "Switch_2_0_i0";
            depth = 2;
            sub_tree_id = 32;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_0_i1 : EthSwitch
    {
        parameters:
            @display("p=4400,450,x");
            switch_id = "Switch_2_0_i1";
            depth = 2;
            sub_tree_id = 32;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_0_i2 : EthSwitch
    {
        parameters:
            @display("p=4575,450,x");
            switch_id = "Switch_2_0_i2";
            depth = 2;
            sub_tree_id = 32;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_0_i3 : EthSwitch
    {
        parameters:
            @display("p=4750,450,x");
            switch_id = "Switch_2_0_i3";
            depth = 2;
            sub_tree_id = 32;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_2_1_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=5050,1050,x");
            address = 40;
        gates:
    }
    Server_2_1_0_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=5175,1050,x");
            address = 41;
        gates:
    }
    Switch_2_1_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=5112,850,x");
            switch_id = "Switch_2_1_0_0_i0";
            depth = 4;
            sub_tree_id = 40;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_2_1_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=5300,1050,x");
            address = 42;
        gates:
    }
    Server_2_1_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=5425,1050,x");
            address = 43;
        gates:
    }
    Switch_2_1_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=5362,850,x");
            switch_id = "Switch_2_1_0_1_i0";
            depth = 4;
            sub_tree_id = 42;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=5175,650,x");
            switch_id = "Switch_2_1_0_i0";
            depth = 3;
            sub_tree_id = 40;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_1_0_i1 : EthSwitch
    {
        parameters:
            @display("p=5300,650,x");
            switch_id = "Switch_2_1_0_i1";
            depth = 3;
            sub_tree_id = 40;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_2_1_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=5550,1050,x");
            address = 44;
        gates:
    }
    Server_2_1_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=5675,1050,x");
            address = 45;
        gates:
    }
    Switch_2_1_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=5612,850,x");
            switch_id = "Switch_2_1_1_0_i0";
            depth = 4;
            sub_tree_id = 44;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_2_1_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=5800,1050,x");
            address = 46;
        gates:
    }
    Server_2_1_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=5925,1050,x");
            address = 47;
        gates:
    }
    Switch_2_1_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=5862,850,x");
            switch_id = "Switch_2_1_1_1_i0";
            depth = 4;
            sub_tree_id = 46;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=5675,650,x");
            switch_id = "Switch_2_1_1_i0";
            depth = 3;
            sub_tree_id = 44;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_1_1_i1 : EthSwitch
    {
        parameters:
            @display("p=5800,650,x");
            switch_id = "Switch_2_1_1_i1";
            depth = 3;
            sub_tree_id = 44;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_1_i0 : EthSwitch
    {
        parameters:
            @display("p=5225,450,x");
            switch_id = "Switch_2_1_i0";
            depth = 2;
            sub_tree_id = 40;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_1_i1 : EthSwitch
    {
        parameters:
            @display("p=5400,450,x");
            switch_id = "Switch_2_1_i1";
            depth = 2;
            sub_tree_id = 40;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_1_i2 : EthSwitch
    {
        parameters:
            @display("p=5575,450,x");
            switch_id = "Switch_2_1_i2";
            depth = 2;
            sub_tree_id = 40;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_1_i3 : EthSwitch
    {
        parameters:
            @display("p=5750,450,x");
            switch_id = "Switch_2_1_i3";
            depth = 2;
            sub_tree_id = 40;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_i0 : EthSwitch
    {
        parameters:
            @display("p=4258,250,x");
            switch_id = "Switch_2_i0";
            depth = 1;
            sub_tree_id = 32;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_i1 : EthSwitch
    {
        parameters:
            @display("p=4466,250,x");
            switch_id = "Switch_2_i1";
            depth = 1;
            sub_tree_id = 32;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_i2 : EthSwitch
    {
        parameters:
            @display("p=4674,250,x");
            switch_id = "Switch_2_i2";
            depth = 1;
            sub_tree_id = 32;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_i3 : EthSwitch
    {
        parameters:
            @display("p=4882,250,x");
            switch_id = "Switch_2_i3";
            depth = 1;
            sub_tree_id = 32;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_i4 : EthSwitch
    {
        parameters:
            @display("p=5090,250,x");
            switch_id = "Switch_2_i4";
            depth = 1;
            sub_tree_id = 32;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_i5 : EthSwitch
    {
        parameters:
            @display("p=5298,250,x");
            switch_id = "Switch_2_i5";
            depth = 1;
            sub_tree_id = 32;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_i6 : EthSwitch
    {
        parameters:
            @display("p=5506,250,x");
            switch_id = "Switch_2_i6";
            depth = 1;
            sub_tree_id = 32;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_i7 : EthSwitch
    {
        parameters:
            @display("p=5714,250,x");
            switch_id = "Switch_2_i7";
            depth = 1;
            sub_tree_id = 32;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_3_0_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=6050,1050,x");
            address = 48;
        gates:
    }
    Server_3_0_0_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=6175,1050,x");
            address = 49;
        gates:
    }
    Switch_3_0_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=6112,850,x");
            switch_id = "Switch_3_0_0_0_i0";
            depth = 4;
            sub_tree_id = 48;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_3_0_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=6300,1050,x");
            address = 50;
        gates:
    }
    Server_3_0_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=6425,1050,x");
            address = 51;
        gates:
    }
    Switch_3_0_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=6362,850,x");
            switch_id = "Switch_3_0_0_1_i0";
            depth = 4;
            sub_tree_id = 50;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=6175,650,x");
            switch_id = "Switch_3_0_0_i0";
            depth = 3;
            sub_tree_id = 48;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_0_0_i1 : EthSwitch
    {
        parameters:
            @display("p=6300,650,x");
            switch_id = "Switch_3_0_0_i1";
            depth = 3;
            sub_tree_id = 48;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_3_0_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=6550,1050,x");
            address = 52;
        gates:
    }
    Server_3_0_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=6675,1050,x");
            address = 53;
        gates:
    }
    Switch_3_0_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=6612,850,x");
            switch_id = "Switch_3_0_1_0_i0";
            depth = 4;
            sub_tree_id = 52;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_3_0_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=6800,1050,x");
            address = 54;
        gates:
    }
    Server_3_0_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=6925,1050,x");
            address = 55;
        gates:
    }
    Switch_3_0_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=6862,850,x");
            switch_id = "Switch_3_0_1_1_i0";
            depth = 4;
            sub_tree_id = 54;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=6675,650,x");
            switch_id = "Switch_3_0_1_i0";
            depth = 3;
            sub_tree_id = 52;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_0_1_i1 : EthSwitch
    {
        parameters:
            @display("p=6800,650,x");
            switch_id = "Switch_3_0_1_i1";
            depth = 3;
            sub_tree_id = 52;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_0_i0 : EthSwitch
    {
        parameters:
            @display("p=6225,450,x");
            switch_id = "Switch_3_0_i0";
            depth = 2;
            sub_tree_id = 48;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_0_i1 : EthSwitch
    {
        parameters:
            @display("p=6400,450,x");
            switch_id = "Switch_3_0_i1";
            depth = 2;
            sub_tree_id = 48;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_0_i2 : EthSwitch
    {
        parameters:
            @display("p=6575,450,x");
            switch_id = "Switch_3_0_i2";
            depth = 2;
            sub_tree_id = 48;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_0_i3 : EthSwitch
    {
        parameters:
            @display("p=6750,450,x");
            switch_id = "Switch_3_0_i3";
            depth = 2;
            sub_tree_id = 48;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_3_1_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=7050,1050,x");
            address = 56;
        gates:
    }
    Server_3_1_0_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=7175,1050,x");
            address = 57;
        gates:
    }
    Switch_3_1_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=7112,850,x");
            switch_id = "Switch_3_1_0_0_i0";
            depth = 4;
            sub_tree_id = 56;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_3_1_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=7300,1050,x");
            address = 58;
        gates:
    }
    Server_3_1_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=7425,1050,x");
            address = 59;
        gates:
    }
    Switch_3_1_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=7362,850,x");
            switch_id = "Switch_3_1_0_1_i0";
            depth = 4;
            sub_tree_id = 58;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=7175,650,x");
            switch_id = "Switch_3_1_0_i0";
            depth = 3;
            sub_tree_id = 56;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_1_0_i1 : EthSwitch
    {
        parameters:
            @display("p=7300,650,x");
            switch_id = "Switch_3_1_0_i1";
            depth = 3;
            sub_tree_id = 56;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_3_1_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=7550,1050,x");
            address = 60;
        gates:
    }
    Server_3_1_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=7675,1050,x");
            address = 61;
        gates:
    }
    Switch_3_1_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=7612,850,x");
            switch_id = "Switch_3_1_1_0_i0";
            depth = 4;
            sub_tree_id = 60;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_3_1_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=7800,1050,x");
            address = 62;
        gates:
    }
    Server_3_1_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=7925,1050,x");
            address = 63;
        gates:
    }
    Switch_3_1_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=7862,850,x");
            switch_id = "Switch_3_1_1_1_i0";
            depth = 4;
            sub_tree_id = 62;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=7675,650,x");
            switch_id = "Switch_3_1_1_i0";
            depth = 3;
            sub_tree_id = 60;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_1_1_i1 : EthSwitch
    {
        parameters:
            @display("p=7800,650,x");
            switch_id = "Switch_3_1_1_i1";
            depth = 3;
            sub_tree_id = 60;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_1_i0 : EthSwitch
    {
        parameters:
            @display("p=7225,450,x");
            switch_id = "Switch_3_1_i0";
            depth = 2;
            sub_tree_id = 56;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_1_i1 : EthSwitch
    {
        parameters:
            @display("p=7400,450,x");
            switch_id = "Switch_3_1_i1";
            depth = 2;
            sub_tree_id = 56;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_1_i2 : EthSwitch
    {
        parameters:
            @display("p=7575,450,x");
            switch_id = "Switch_3_1_i2";
            depth = 2;
            sub_tree_id = 56;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_1_i3 : EthSwitch
    {
        parameters:
            @display("p=7750,450,x");
            switch_id = "Switch_3_1_i3";
            depth = 2;
            sub_tree_id = 56;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_i0 : EthSwitch
    {
        parameters:
            @display("p=6258,250,x");
            switch_id = "Switch_3_i0";
            depth = 1;
            sub_tree_id = 48;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_i1 : EthSwitch
    {
        parameters:
            @display("p=6466,250,x");
            switch_id = "Switch_3_i1";
            depth = 1;
            sub_tree_id = 48;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_i2 : EthSwitch
    {
        parameters:
            @display("p=6674,250,x");
            switch_id = "Switch_3_i2";
            depth = 1;
            sub_tree_id = 48;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_i3 : EthSwitch
    {
        parameters:
            @display("p=6882,250,x");
            switch_id = "Switch_3_i3";
            depth = 1;
            sub_tree_id = 48;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_i4 : EthSwitch
    {
        parameters:
            @display("p=7090,250,x");
            switch_id = "Switch_3_i4";
            depth = 1;
            sub_tree_id = 48;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_i5 : EthSwitch
    {
        parameters:
            @display("p=7298,250,x");
            switch_id = "Switch_3_i5";
            depth = 1;
            sub_tree_id = 48;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_i6 : EthSwitch
    {
        parameters:
            @display("p=7506,250,x");
            switch_id = "Switch_3_i6";
            depth = 1;
            sub_tree_id = 48;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_i7 : EthSwitch
    {
        parameters:
            @display("p=7714,250,x");
            switch_id = "Switch_3_i7";
            depth = 1;
            sub_tree_id = 48;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_i0 : EthSwitch
    {
        parameters:
            @display("p=513,50,x");
            switch_id = "Switch_i0";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[0];
    }
    Switch_i1 : EthSwitch
    {
        parameters:
            @display("p=976,50,x");
            switch_id = "Switch_i1";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[0];
    }
    Switch_i2 : EthSwitch
    {
        parameters:
            @display("p=1439,50,x");
            switch_id = "Switch_i2";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[0];
    }
    Switch_i3 : EthSwitch
    {
        parameters:
            @display("p=1902,50,x");
            switch_id = "Switch_i3";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[0];
    }
    Switch_i4 : EthSwitch
    {
        parameters:
            @display("p=2365,50,x");
            switch_id = "Switch_i4";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[0];
    }
    Switch_i5 : EthSwitch
    {
        parameters:
            @display("p=2828,50,x");
            switch_id = "Switch_i5";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[0];
    }
    Switch_i6 : EthSwitch
    {
        parameters:
            @display("p=3291,50,x");
            switch_id = "Switch_i6";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[0];
    }
    Switch_i7 : EthSwitch
    {
        parameters:
            @display("p=3754,50,x");
            switch_id = "Switch_i7";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[0];
    }
    Switch_i8 : EthSwitch
    {
        parameters:
            @display("p=4217,50,x");
            switch_id = "Switch_i8";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[0];
    }
    Switch_i9 : EthSwitch
    {
        parameters:
            @display("p=4680,50,x");
            switch_id = "Switch_i9";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[0];
    }
    Switch_i10 : EthSwitch
    {
        parameters:
            @display("p=5143,50,x");
            switch_id = "Switch_i10";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[0];
    }
    Switch_i11 : EthSwitch
    {
        parameters:
            @display("p=5606,50,x");
            switch_id = "Switch_i11";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[0];
    }
    Switch_i12 : EthSwitch
    {
        parameters:
            @display("p=6069,50,x");
            switch_id = "Switch_i12";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[0];
    }
    Switch_i13 : EthSwitch
    {
        parameters:
            @display("p=6532,50,x");
            switch_id = "Switch_i13";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[0];
    }
    Switch_i14 : EthSwitch
    {
        parameters:
            @display("p=6995,50,x");
            switch_id = "Switch_i14";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[0];
    }
    Switch_i15 : EthSwitch
    {
        parameters:
            @display("p=7458,50,x");
            switch_id = "Switch_i15";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[0];
    }

    connections:
     Switch_0_0_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_0_0_0_0_0.port;
     Switch_0_0_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_0_0_0_0_1.port;
     Switch_0_0_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_0_0_0_1_0.port;
     Switch_0_0_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_0_0_0_1_1.port;
     Switch_0_0_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_0_0_0_i0.up_port[0];
     Switch_0_0_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_0_0_0_1_i0.up_port[0];
     Switch_0_0_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_0_0_0_i0.up_port[1];
     Switch_0_0_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_0_0_0_1_i0.up_port[1];
     Switch_0_0_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_0_0_1_0_0.port;
     Switch_0_0_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_0_0_1_0_1.port;
     Switch_0_0_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_0_0_1_1_0.port;
     Switch_0_0_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_0_0_1_1_1.port;
     Switch_0_0_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_0_1_0_i0.up_port[0];
     Switch_0_0_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_0_0_1_1_i0.up_port[0];
     Switch_0_0_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_0_1_0_i0.up_port[1];
     Switch_0_0_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_0_0_1_1_i0.up_port[1];
     Switch_0_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_0_0_i0.up_port[0];
     Switch_0_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_0_0_1_i0.up_port[0];
     Switch_0_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_0_0_i0.up_port[1];
     Switch_0_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_0_0_1_i0.up_port[1];
     Switch_0_0_i2.down_port[0] <--> Link_1Gbps <--> Switch_0_0_0_i1.up_port[0];
     Switch_0_0_i2.down_port[1] <--> Link_1Gbps <--> Switch_0_0_1_i1.up_port[0];
     Switch_0_0_i3.down_port[0] <--> Link_1Gbps <--> Switch_0_0_0_i1.up_port[1];
     Switch_0_0_i3.down_port[1] <--> Link_1Gbps <--> Switch_0_0_1_i1.up_port[1];
     Switch_0_1_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_0_1_0_0_0.port;
     Switch_0_1_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_0_1_0_0_1.port;
     Switch_0_1_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_0_1_0_1_0.port;
     Switch_0_1_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_0_1_0_1_1.port;
     Switch_0_1_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_1_0_0_i0.up_port[0];
     Switch_0_1_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_0_1_0_1_i0.up_port[0];
     Switch_0_1_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_1_0_0_i0.up_port[1];
     Switch_0_1_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_0_1_0_1_i0.up_port[1];
     Switch_0_1_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_0_1_1_0_0.port;
     Switch_0_1_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_0_1_1_0_1.port;
     Switch_0_1_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_0_1_1_1_0.port;
     Switch_0_1_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_0_1_1_1_1.port;
     Switch_0_1_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_1_1_0_i0.up_port[0];
     Switch_0_1_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_0_1_1_1_i0.up_port[0];
     Switch_0_1_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_1_1_0_i0.up_port[1];
     Switch_0_1_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_0_1_1_1_i0.up_port[1];
     Switch_0_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_1_0_i0.up_port[0];
     Switch_0_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_0_1_1_i0.up_port[0];
     Switch_0_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_1_0_i0.up_port[1];
     Switch_0_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_0_1_1_i0.up_port[1];
     Switch_0_1_i2.down_port[0] <--> Link_1Gbps <--> Switch_0_1_0_i1.up_port[0];
     Switch_0_1_i2.down_port[1] <--> Link_1Gbps <--> Switch_0_1_1_i1.up_port[0];
     Switch_0_1_i3.down_port[0] <--> Link_1Gbps <--> Switch_0_1_0_i1.up_port[1];
     Switch_0_1_i3.down_port[1] <--> Link_1Gbps <--> Switch_0_1_1_i1.up_port[1];
     Switch_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i0.up_port[0];
     Switch_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i0.up_port[0];
     Switch_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i0.up_port[1];
     Switch_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i0.up_port[1];
     Switch_0_i2.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i1.up_port[0];
     Switch_0_i2.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i1.up_port[0];
     Switch_0_i3.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i1.up_port[1];
     Switch_0_i3.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i1.up_port[1];
     Switch_0_i4.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i2.up_port[0];
     Switch_0_i4.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i2.up_port[0];
     Switch_0_i5.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i2.up_port[1];
     Switch_0_i5.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i2.up_port[1];
     Switch_0_i6.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i3.up_port[0];
     Switch_0_i6.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i3.up_port[0];
     Switch_0_i7.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i3.up_port[1];
     Switch_0_i7.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i3.up_port[1];
     Switch_1_0_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_1_0_0_0_0.port;
     Switch_1_0_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_1_0_0_0_1.port;
     Switch_1_0_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_1_0_0_1_0.port;
     Switch_1_0_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_1_0_0_1_1.port;
     Switch_1_0_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_1_0_0_0_i0.up_port[0];
     Switch_1_0_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_0_0_1_i0.up_port[0];
     Switch_1_0_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_1_0_0_0_i0.up_port[1];
     Switch_1_0_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_0_0_1_i0.up_port[1];
     Switch_1_0_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_1_0_1_0_0.port;
     Switch_1_0_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_1_0_1_0_1.port;
     Switch_1_0_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_1_0_1_1_0.port;
     Switch_1_0_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_1_0_1_1_1.port;
     Switch_1_0_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_1_0_1_0_i0.up_port[0];
     Switch_1_0_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_0_1_1_i0.up_port[0];
     Switch_1_0_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_1_0_1_0_i0.up_port[1];
     Switch_1_0_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_0_1_1_i0.up_port[1];
     Switch_1_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_1_0_0_i0.up_port[0];
     Switch_1_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_0_1_i0.up_port[0];
     Switch_1_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_1_0_0_i0.up_port[1];
     Switch_1_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_0_1_i0.up_port[1];
     Switch_1_0_i2.down_port[0] <--> Link_1Gbps <--> Switch_1_0_0_i1.up_port[0];
     Switch_1_0_i2.down_port[1] <--> Link_1Gbps <--> Switch_1_0_1_i1.up_port[0];
     Switch_1_0_i3.down_port[0] <--> Link_1Gbps <--> Switch_1_0_0_i1.up_port[1];
     Switch_1_0_i3.down_port[1] <--> Link_1Gbps <--> Switch_1_0_1_i1.up_port[1];
     Switch_1_1_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_1_1_0_0_0.port;
     Switch_1_1_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_1_1_0_0_1.port;
     Switch_1_1_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_1_1_0_1_0.port;
     Switch_1_1_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_1_1_0_1_1.port;
     Switch_1_1_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_1_1_0_0_i0.up_port[0];
     Switch_1_1_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_1_0_1_i0.up_port[0];
     Switch_1_1_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_1_1_0_0_i0.up_port[1];
     Switch_1_1_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_1_0_1_i0.up_port[1];
     Switch_1_1_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_1_1_1_0_0.port;
     Switch_1_1_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_1_1_1_0_1.port;
     Switch_1_1_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_1_1_1_1_0.port;
     Switch_1_1_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_1_1_1_1_1.port;
     Switch_1_1_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_1_1_1_0_i0.up_port[0];
     Switch_1_1_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_1_1_1_i0.up_port[0];
     Switch_1_1_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_1_1_1_0_i0.up_port[1];
     Switch_1_1_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_1_1_1_i0.up_port[1];
     Switch_1_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_1_1_0_i0.up_port[0];
     Switch_1_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_1_1_i0.up_port[0];
     Switch_1_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_1_1_0_i0.up_port[1];
     Switch_1_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_1_1_i0.up_port[1];
     Switch_1_1_i2.down_port[0] <--> Link_1Gbps <--> Switch_1_1_0_i1.up_port[0];
     Switch_1_1_i2.down_port[1] <--> Link_1Gbps <--> Switch_1_1_1_i1.up_port[0];
     Switch_1_1_i3.down_port[0] <--> Link_1Gbps <--> Switch_1_1_0_i1.up_port[1];
     Switch_1_1_i3.down_port[1] <--> Link_1Gbps <--> Switch_1_1_1_i1.up_port[1];
     Switch_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i0.up_port[0];
     Switch_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i0.up_port[0];
     Switch_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i0.up_port[1];
     Switch_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i0.up_port[1];
     Switch_1_i2.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i1.up_port[0];
     Switch_1_i2.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i1.up_port[0];
     Switch_1_i3.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i1.up_port[1];
     Switch_1_i3.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i1.up_port[1];
     Switch_1_i4.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i2.up_port[0];
     Switch_1_i4.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i2.up_port[0];
     Switch_1_i5.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i2.up_port[1];
     Switch_1_i5.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i2.up_port[1];
     Switch_1_i6.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i3.up_port[0];
     Switch_1_i6.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i3.up_port[0];
     Switch_1_i7.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i3.up_port[1];
     Switch_1_i7.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i3.up_port[1];
     Switch_2_0_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_2_0_0_0_0.port;
     Switch_2_0_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_2_0_0_0_1.port;
     Switch_2_0_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_2_0_0_1_0.port;
     Switch_2_0_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_2_0_0_1_1.port;
     Switch_2_0_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_2_0_0_0_i0.up_port[0];
     Switch_2_0_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_2_0_0_1_i0.up_port[0];
     Switch_2_0_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_2_0_0_0_i0.up_port[1];
     Switch_2_0_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_2_0_0_1_i0.up_port[1];
     Switch_2_0_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_2_0_1_0_0.port;
     Switch_2_0_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_2_0_1_0_1.port;
     Switch_2_0_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_2_0_1_1_0.port;
     Switch_2_0_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_2_0_1_1_1.port;
     Switch_2_0_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_2_0_1_0_i0.up_port[0];
     Switch_2_0_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_2_0_1_1_i0.up_port[0];
     Switch_2_0_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_2_0_1_0_i0.up_port[1];
     Switch_2_0_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_2_0_1_1_i0.up_port[1];
     Switch_2_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_2_0_0_i0.up_port[0];
     Switch_2_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_2_0_1_i0.up_port[0];
     Switch_2_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_2_0_0_i0.up_port[1];
     Switch_2_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_2_0_1_i0.up_port[1];
     Switch_2_0_i2.down_port[0] <--> Link_1Gbps <--> Switch_2_0_0_i1.up_port[0];
     Switch_2_0_i2.down_port[1] <--> Link_1Gbps <--> Switch_2_0_1_i1.up_port[0];
     Switch_2_0_i3.down_port[0] <--> Link_1Gbps <--> Switch_2_0_0_i1.up_port[1];
     Switch_2_0_i3.down_port[1] <--> Link_1Gbps <--> Switch_2_0_1_i1.up_port[1];
     Switch_2_1_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_2_1_0_0_0.port;
     Switch_2_1_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_2_1_0_0_1.port;
     Switch_2_1_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_2_1_0_1_0.port;
     Switch_2_1_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_2_1_0_1_1.port;
     Switch_2_1_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_2_1_0_0_i0.up_port[0];
     Switch_2_1_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_2_1_0_1_i0.up_port[0];
     Switch_2_1_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_2_1_0_0_i0.up_port[1];
     Switch_2_1_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_2_1_0_1_i0.up_port[1];
     Switch_2_1_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_2_1_1_0_0.port;
     Switch_2_1_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_2_1_1_0_1.port;
     Switch_2_1_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_2_1_1_1_0.port;
     Switch_2_1_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_2_1_1_1_1.port;
     Switch_2_1_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_2_1_1_0_i0.up_port[0];
     Switch_2_1_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_2_1_1_1_i0.up_port[0];
     Switch_2_1_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_2_1_1_0_i0.up_port[1];
     Switch_2_1_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_2_1_1_1_i0.up_port[1];
     Switch_2_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_2_1_0_i0.up_port[0];
     Switch_2_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_2_1_1_i0.up_port[0];
     Switch_2_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_2_1_0_i0.up_port[1];
     Switch_2_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_2_1_1_i0.up_port[1];
     Switch_2_1_i2.down_port[0] <--> Link_1Gbps <--> Switch_2_1_0_i1.up_port[0];
     Switch_2_1_i2.down_port[1] <--> Link_1Gbps <--> Switch_2_1_1_i1.up_port[0];
     Switch_2_1_i3.down_port[0] <--> Link_1Gbps <--> Switch_2_1_0_i1.up_port[1];
     Switch_2_1_i3.down_port[1] <--> Link_1Gbps <--> Switch_2_1_1_i1.up_port[1];
     Switch_2_i0.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i0.up_port[0];
     Switch_2_i0.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i0.up_port[0];
     Switch_2_i1.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i0.up_port[1];
     Switch_2_i1.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i0.up_port[1];
     Switch_2_i2.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i1.up_port[0];
     Switch_2_i2.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i1.up_port[0];
     Switch_2_i3.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i1.up_port[1];
     Switch_2_i3.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i1.up_port[1];
     Switch_2_i4.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i2.up_port[0];
     Switch_2_i4.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i2.up_port[0];
     Switch_2_i5.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i2.up_port[1];
     Switch_2_i5.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i2.up_port[1];
     Switch_2_i6.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i3.up_port[0];
     Switch_2_i6.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i3.up_port[0];
     Switch_2_i7.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i3.up_port[1];
     Switch_2_i7.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i3.up_port[1];
     Switch_3_0_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_3_0_0_0_0.port;
     Switch_3_0_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_3_0_0_0_1.port;
     Switch_3_0_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_3_0_0_1_0.port;
     Switch_3_0_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_3_0_0_1_1.port;
     Switch_3_0_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_3_0_0_0_i0.up_port[0];
     Switch_3_0_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_3_0_0_1_i0.up_port[0];
     Switch_3_0_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_3_0_0_0_i0.up_port[1];
     Switch_3_0_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_3_0_0_1_i0.up_port[1];
     Switch_3_0_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_3_0_1_0_0.port;
     Switch_3_0_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_3_0_1_0_1.port;
     Switch_3_0_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_3_0_1_1_0.port;
     Switch_3_0_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_3_0_1_1_1.port;
     Switch_3_0_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_3_0_1_0_i0.up_port[0];
     Switch_3_0_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_3_0_1_1_i0.up_port[0];
     Switch_3_0_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_3_0_1_0_i0.up_port[1];
     Switch_3_0_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_3_0_1_1_i0.up_port[1];
     Switch_3_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_3_0_0_i0.up_port[0];
     Switch_3_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_3_0_1_i0.up_port[0];
     Switch_3_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_3_0_0_i0.up_port[1];
     Switch_3_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_3_0_1_i0.up_port[1];
     Switch_3_0_i2.down_port[0] <--> Link_1Gbps <--> Switch_3_0_0_i1.up_port[0];
     Switch_3_0_i2.down_port[1] <--> Link_1Gbps <--> Switch_3_0_1_i1.up_port[0];
     Switch_3_0_i3.down_port[0] <--> Link_1Gbps <--> Switch_3_0_0_i1.up_port[1];
     Switch_3_0_i3.down_port[1] <--> Link_1Gbps <--> Switch_3_0_1_i1.up_port[1];
     Switch_3_1_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_3_1_0_0_0.port;
     Switch_3_1_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_3_1_0_0_1.port;
     Switch_3_1_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_3_1_0_1_0.port;
     Switch_3_1_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_3_1_0_1_1.port;
     Switch_3_1_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_3_1_0_0_i0.up_port[0];
     Switch_3_1_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_3_1_0_1_i0.up_port[0];
     Switch_3_1_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_3_1_0_0_i0.up_port[1];
     Switch_3_1_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_3_1_0_1_i0.up_port[1];
     Switch_3_1_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_3_1_1_0_0.port;
     Switch_3_1_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_3_1_1_0_1.port;
     Switch_3_1_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_3_1_1_1_0.port;
     Switch_3_1_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_3_1_1_1_1.port;
     Switch_3_1_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_3_1_1_0_i0.up_port[0];
     Switch_3_1_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_3_1_1_1_i0.up_port[0];
     Switch_3_1_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_3_1_1_0_i0.up_port[1];
     Switch_3_1_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_3_1_1_1_i0.up_port[1];
     Switch_3_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_3_1_0_i0.up_port[0];
     Switch_3_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_3_1_1_i0.up_port[0];
     Switch_3_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_3_1_0_i0.up_port[1];
     Switch_3_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_3_1_1_i0.up_port[1];
     Switch_3_1_i2.down_port[0] <--> Link_1Gbps <--> Switch_3_1_0_i1.up_port[0];
     Switch_3_1_i2.down_port[1] <--> Link_1Gbps <--> Switch_3_1_1_i1.up_port[0];
     Switch_3_1_i3.down_port[0] <--> Link_1Gbps <--> Switch_3_1_0_i1.up_port[1];
     Switch_3_1_i3.down_port[1] <--> Link_1Gbps <--> Switch_3_1_1_i1.up_port[1];
     Switch_3_i0.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i0.up_port[0];
     Switch_3_i0.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i0.up_port[0];
     Switch_3_i1.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i0.up_port[1];
     Switch_3_i1.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i0.up_port[1];
     Switch_3_i2.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i1.up_port[0];
     Switch_3_i2.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i1.up_port[0];
     Switch_3_i3.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i1.up_port[1];
     Switch_3_i3.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i1.up_port[1];
     Switch_3_i4.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i2.up_port[0];
     Switch_3_i4.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i2.up_port[0];
     Switch_3_i5.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i2.up_port[1];
     Switch_3_i5.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i2.up_port[1];
     Switch_3_i6.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i3.up_port[0];
     Switch_3_i6.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i3.up_port[0];
     Switch_3_i7.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i3.up_port[1];
     Switch_3_i7.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i3.up_port[1];
     Switch_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_i0.up_port[0];
     Switch_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_i0.up_port[0];
     Switch_i0.down_port[2] <--> Link_1Gbps <--> Switch_2_i0.up_port[0];
     Switch_i0.down_port[3] <--> Link_1Gbps <--> Switch_3_i0.up_port[0];
     Switch_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_i0.up_port[1];
     Switch_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_i0.up_port[1];
     Switch_i1.down_port[2] <--> Link_1Gbps <--> Switch_2_i0.up_port[1];
     Switch_i1.down_port[3] <--> Link_1Gbps <--> Switch_3_i0.up_port[1];
     Switch_i2.down_port[0] <--> Link_1Gbps <--> Switch_0_i1.up_port[0];
     Switch_i2.down_port[1] <--> Link_1Gbps <--> Switch_1_i1.up_port[0];
     Switch_i2.down_port[2] <--> Link_1Gbps <--> Switch_2_i1.up_port[0];
     Switch_i2.down_port[3] <--> Link_1Gbps <--> Switch_3_i1.up_port[0];
     Switch_i3.down_port[0] <--> Link_1Gbps <--> Switch_0_i1.up_port[1];
     Switch_i3.down_port[1] <--> Link_1Gbps <--> Switch_1_i1.up_port[1];
     Switch_i3.down_port[2] <--> Link_1Gbps <--> Switch_2_i1.up_port[1];
     Switch_i3.down_port[3] <--> Link_1Gbps <--> Switch_3_i1.up_port[1];
     Switch_i4.down_port[0] <--> Link_1Gbps <--> Switch_0_i2.up_port[0];
     Switch_i4.down_port[1] <--> Link_1Gbps <--> Switch_1_i2.up_port[0];
     Switch_i4.down_port[2] <--> Link_1Gbps <--> Switch_2_i2.up_port[0];
     Switch_i4.down_port[3] <--> Link_1Gbps <--> Switch_3_i2.up_port[0];
     Switch_i5.down_port[0] <--> Link_1Gbps <--> Switch_0_i2.up_port[1];
     Switch_i5.down_port[1] <--> Link_1Gbps <--> Switch_1_i2.up_port[1];
     Switch_i5.down_port[2] <--> Link_1Gbps <--> Switch_2_i2.up_port[1];
     Switch_i5.down_port[3] <--> Link_1Gbps <--> Switch_3_i2.up_port[1];
     Switch_i6.down_port[0] <--> Link_1Gbps <--> Switch_0_i3.up_port[0];
     Switch_i6.down_port[1] <--> Link_1Gbps <--> Switch_1_i3.up_port[0];
     Switch_i6.down_port[2] <--> Link_1Gbps <--> Switch_2_i3.up_port[0];
     Switch_i6.down_port[3] <--> Link_1Gbps <--> Switch_3_i3.up_port[0];
     Switch_i7.down_port[0] <--> Link_1Gbps <--> Switch_0_i3.up_port[1];
     Switch_i7.down_port[1] <--> Link_1Gbps <--> Switch_1_i3.up_port[1];
     Switch_i7.down_port[2] <--> Link_1Gbps <--> Switch_2_i3.up_port[1];
     Switch_i7.down_port[3] <--> Link_1Gbps <--> Switch_3_i3.up_port[1];
     Switch_i8.down_port[0] <--> Link_1Gbps <--> Switch_0_i4.up_port[0];
     Switch_i8.down_port[1] <--> Link_1Gbps <--> Switch_1_i4.up_port[0];
     Switch_i8.down_port[2] <--> Link_1Gbps <--> Switch_2_i4.up_port[0];
     Switch_i8.down_port[3] <--> Link_1Gbps <--> Switch_3_i4.up_port[0];
     Switch_i9.down_port[0] <--> Link_1Gbps <--> Switch_0_i4.up_port[1];
     Switch_i9.down_port[1] <--> Link_1Gbps <--> Switch_1_i4.up_port[1];
     Switch_i9.down_port[2] <--> Link_1Gbps <--> Switch_2_i4.up_port[1];
     Switch_i9.down_port[3] <--> Link_1Gbps <--> Switch_3_i4.up_port[1];
     Switch_i10.down_port[0] <--> Link_1Gbps <--> Switch_0_i5.up_port[0];
     Switch_i10.down_port[1] <--> Link_1Gbps <--> Switch_1_i5.up_port[0];
     Switch_i10.down_port[2] <--> Link_1Gbps <--> Switch_2_i5.up_port[0];
     Switch_i10.down_port[3] <--> Link_1Gbps <--> Switch_3_i5.up_port[0];
     Switch_i11.down_port[0] <--> Link_1Gbps <--> Switch_0_i5.up_port[1];
     Switch_i11.down_port[1] <--> Link_1Gbps <--> Switch_1_i5.up_port[1];
     Switch_i11.down_port[2] <--> Link_1Gbps <--> Switch_2_i5.up_port[1];
     Switch_i11.down_port[3] <--> Link_1Gbps <--> Switch_3_i5.up_port[1];
     Switch_i12.down_port[0] <--> Link_1Gbps <--> Switch_0_i6.up_port[0];
     Switch_i12.down_port[1] <--> Link_1Gbps <--> Switch_1_i6.up_port[0];
     Switch_i12.down_port[2] <--> Link_1Gbps <--> Switch_2_i6.up_port[0];
     Switch_i12.down_port[3] <--> Link_1Gbps <--> Switch_3_i6.up_port[0];
     Switch_i13.down_port[0] <--> Link_1Gbps <--> Switch_0_i6.up_port[1];
     Switch_i13.down_port[1] <--> Link_1Gbps <--> Switch_1_i6.up_port[1];
     Switch_i13.down_port[2] <--> Link_1Gbps <--> Switch_2_i6.up_port[1];
     Switch_i13.down_port[3] <--> Link_1Gbps <--> Switch_3_i6.up_port[1];
     Switch_i14.down_port[0] <--> Link_1Gbps <--> Switch_0_i7.up_port[0];
     Switch_i14.down_port[1] <--> Link_1Gbps <--> Switch_1_i7.up_port[0];
     Switch_i14.down_port[2] <--> Link_1Gbps <--> Switch_2_i7.up_port[0];
     Switch_i14.down_port[3] <--> Link_1Gbps <--> Switch_3_i7.up_port[0];
     Switch_i15.down_port[0] <--> Link_1Gbps <--> Switch_0_i7.up_port[1];
     Switch_i15.down_port[1] <--> Link_1Gbps <--> Switch_1_i7.up_port[1];
     Switch_i15.down_port[2] <--> Link_1Gbps <--> Switch_2_i7.up_port[1];
     Switch_i15.down_port[3] <--> Link_1Gbps <--> Switch_3_i7.up_port[1];
}
