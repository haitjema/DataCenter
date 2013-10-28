package datacenter.model.networks.fattree.generatedOutsideOmnet;
import ned.DatarateChannel;
import datacenter.model.switch.EthSwitch;
import datacenter.model.node.server.Server;
import datacenter.model.node.server.*;


network FatTree_4_2_4
{
  parameters:
    **.tree_depth               = 4;
    **.int_switch_down_ports    = 4;
    **.tor_switch_up_ports      = 2;
    **.tor_switch_down_ports    = 2;
    **.switch_up_ports          = 2;
    **.switch_down_ports        = 2;
    **.switch_switch_link_speed = 1000000000 bps;
    **.server_switch_link_speed = 1000000000 bps;
    string ServerType = default("TCPClientServer");
    **.number_of_paths = 8;

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
    Server_0_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=50,850,x");
            address = 0;
        gates:
    }
    Server_0_0_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=175,850,x");
            address = 1;
        gates:
    }
    Switch_0_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=112,650,x");
            switch_id = "Switch_0_0_0_i0";
            depth = 3;
            sub_tree_id = 0;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_0_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=300,850,x");
            address = 2;
        gates:
    }
    Server_0_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=425,850,x");
            address = 3;
        gates:
    }
    Switch_0_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=362,650,x");
            switch_id = "Switch_0_0_1_i0";
            depth = 3;
            sub_tree_id = 2;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=175,450,x");
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
            @display("p=300,450,x");
            switch_id = "Switch_0_0_i1";
            depth = 2;
            sub_tree_id = 0;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_0_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=550,850,x");
            address = 4;
        gates:
    }
    Server_0_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=675,850,x");
            address = 5;
        gates:
    }
    Switch_0_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=612,650,x");
            switch_id = "Switch_0_1_0_i0";
            depth = 3;
            sub_tree_id = 4;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_0_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=800,850,x");
            address = 6;
        gates:
    }
    Server_0_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=925,850,x");
            address = 7;
        gates:
    }
    Switch_0_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=862,650,x");
            switch_id = "Switch_0_1_1_i0";
            depth = 3;
            sub_tree_id = 6;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=675,450,x");
            switch_id = "Switch_0_1_i0";
            depth = 2;
            sub_tree_id = 4;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_1_i1 : EthSwitch
    {
        parameters:
            @display("p=800,450,x");
            switch_id = "Switch_0_1_i1";
            depth = 2;
            sub_tree_id = 4;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_i0 : EthSwitch
    {
        parameters:
            @display("p=225,250,x");
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
            @display("p=400,250,x");
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
            @display("p=575,250,x");
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
            @display("p=750,250,x");
            switch_id = "Switch_0_i3";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_1_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=1050,850,x");
            address = 8;
        gates:
    }
    Server_1_0_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=1175,850,x");
            address = 9;
        gates:
    }
    Switch_1_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=1112,650,x");
            switch_id = "Switch_1_0_0_i0";
            depth = 3;
            sub_tree_id = 8;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_1_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=1300,850,x");
            address = 10;
        gates:
    }
    Server_1_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=1425,850,x");
            address = 11;
        gates:
    }
    Switch_1_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=1362,650,x");
            switch_id = "Switch_1_0_1_i0";
            depth = 3;
            sub_tree_id = 10;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=1175,450,x");
            switch_id = "Switch_1_0_i0";
            depth = 2;
            sub_tree_id = 8;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_0_i1 : EthSwitch
    {
        parameters:
            @display("p=1300,450,x");
            switch_id = "Switch_1_0_i1";
            depth = 2;
            sub_tree_id = 8;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_1_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=1550,850,x");
            address = 12;
        gates:
    }
    Server_1_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=1675,850,x");
            address = 13;
        gates:
    }
    Switch_1_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=1612,650,x");
            switch_id = "Switch_1_1_0_i0";
            depth = 3;
            sub_tree_id = 12;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_1_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=1800,850,x");
            address = 14;
        gates:
    }
    Server_1_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=1925,850,x");
            address = 15;
        gates:
    }
    Switch_1_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=1862,650,x");
            switch_id = "Switch_1_1_1_i0";
            depth = 3;
            sub_tree_id = 14;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=1675,450,x");
            switch_id = "Switch_1_1_i0";
            depth = 2;
            sub_tree_id = 12;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_1_i1 : EthSwitch
    {
        parameters:
            @display("p=1800,450,x");
            switch_id = "Switch_1_1_i1";
            depth = 2;
            sub_tree_id = 12;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_i0 : EthSwitch
    {
        parameters:
            @display("p=1225,250,x");
            switch_id = "Switch_1_i0";
            depth = 1;
            sub_tree_id = 8;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_i1 : EthSwitch
    {
        parameters:
            @display("p=1400,250,x");
            switch_id = "Switch_1_i1";
            depth = 1;
            sub_tree_id = 8;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_i2 : EthSwitch
    {
        parameters:
            @display("p=1575,250,x");
            switch_id = "Switch_1_i2";
            depth = 1;
            sub_tree_id = 8;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_i3 : EthSwitch
    {
        parameters:
            @display("p=1750,250,x");
            switch_id = "Switch_1_i3";
            depth = 1;
            sub_tree_id = 8;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_2_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=2050,850,x");
            address = 16;
        gates:
    }
    Server_2_0_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=2175,850,x");
            address = 17;
        gates:
    }
    Switch_2_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=2112,650,x");
            switch_id = "Switch_2_0_0_i0";
            depth = 3;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_2_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=2300,850,x");
            address = 18;
        gates:
    }
    Server_2_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=2425,850,x");
            address = 19;
        gates:
    }
    Switch_2_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=2362,650,x");
            switch_id = "Switch_2_0_1_i0";
            depth = 3;
            sub_tree_id = 18;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_0_i0 : EthSwitch
    {
        parameters:
            @display("p=2175,450,x");
            switch_id = "Switch_2_0_i0";
            depth = 2;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_0_i1 : EthSwitch
    {
        parameters:
            @display("p=2300,450,x");
            switch_id = "Switch_2_0_i1";
            depth = 2;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_2_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=2550,850,x");
            address = 20;
        gates:
    }
    Server_2_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=2675,850,x");
            address = 21;
        gates:
    }
    Switch_2_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=2612,650,x");
            switch_id = "Switch_2_1_0_i0";
            depth = 3;
            sub_tree_id = 20;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_2_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=2800,850,x");
            address = 22;
        gates:
    }
    Server_2_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=2925,850,x");
            address = 23;
        gates:
    }
    Switch_2_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=2862,650,x");
            switch_id = "Switch_2_1_1_i0";
            depth = 3;
            sub_tree_id = 22;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_1_i0 : EthSwitch
    {
        parameters:
            @display("p=2675,450,x");
            switch_id = "Switch_2_1_i0";
            depth = 2;
            sub_tree_id = 20;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_1_i1 : EthSwitch
    {
        parameters:
            @display("p=2800,450,x");
            switch_id = "Switch_2_1_i1";
            depth = 2;
            sub_tree_id = 20;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_i0 : EthSwitch
    {
        parameters:
            @display("p=2225,250,x");
            switch_id = "Switch_2_i0";
            depth = 1;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_i1 : EthSwitch
    {
        parameters:
            @display("p=2400,250,x");
            switch_id = "Switch_2_i1";
            depth = 1;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_i2 : EthSwitch
    {
        parameters:
            @display("p=2575,250,x");
            switch_id = "Switch_2_i2";
            depth = 1;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_i3 : EthSwitch
    {
        parameters:
            @display("p=2750,250,x");
            switch_id = "Switch_2_i3";
            depth = 1;
            sub_tree_id = 16;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_3_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=3050,850,x");
            address = 24;
        gates:
    }
    Server_3_0_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=3175,850,x");
            address = 25;
        gates:
    }
    Switch_3_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=3112,650,x");
            switch_id = "Switch_3_0_0_i0";
            depth = 3;
            sub_tree_id = 24;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_3_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=3300,850,x");
            address = 26;
        gates:
    }
    Server_3_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=3425,850,x");
            address = 27;
        gates:
    }
    Switch_3_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=3362,650,x");
            switch_id = "Switch_3_0_1_i0";
            depth = 3;
            sub_tree_id = 26;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_0_i0 : EthSwitch
    {
        parameters:
            @display("p=3175,450,x");
            switch_id = "Switch_3_0_i0";
            depth = 2;
            sub_tree_id = 24;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_0_i1 : EthSwitch
    {
        parameters:
            @display("p=3300,450,x");
            switch_id = "Switch_3_0_i1";
            depth = 2;
            sub_tree_id = 24;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_3_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=3550,850,x");
            address = 28;
        gates:
    }
    Server_3_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=3675,850,x");
            address = 29;
        gates:
    }
    Switch_3_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=3612,650,x");
            switch_id = "Switch_3_1_0_i0";
            depth = 3;
            sub_tree_id = 28;
        gates:
            down_port[2];
            up_port[2];
    }
    Server_3_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=3800,850,x");
            address = 30;
        gates:
    }
    Server_3_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=3925,850,x");
            address = 31;
        gates:
    }
    Switch_3_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=3862,650,x");
            switch_id = "Switch_3_1_1_i0";
            depth = 3;
            sub_tree_id = 30;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_1_i0 : EthSwitch
    {
        parameters:
            @display("p=3675,450,x");
            switch_id = "Switch_3_1_i0";
            depth = 2;
            sub_tree_id = 28;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_1_i1 : EthSwitch
    {
        parameters:
            @display("p=3800,450,x");
            switch_id = "Switch_3_1_i1";
            depth = 2;
            sub_tree_id = 28;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_i0 : EthSwitch
    {
        parameters:
            @display("p=3225,250,x");
            switch_id = "Switch_3_i0";
            depth = 1;
            sub_tree_id = 24;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_i1 : EthSwitch
    {
        parameters:
            @display("p=3400,250,x");
            switch_id = "Switch_3_i1";
            depth = 1;
            sub_tree_id = 24;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_i2 : EthSwitch
    {
        parameters:
            @display("p=3575,250,x");
            switch_id = "Switch_3_i2";
            depth = 1;
            sub_tree_id = 24;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_i3 : EthSwitch
    {
        parameters:
            @display("p=3750,250,x");
            switch_id = "Switch_3_i3";
            depth = 1;
            sub_tree_id = 24;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_i0 : EthSwitch
    {
        parameters:
            @display("p=480,50,x");
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
            @display("p=910,50,x");
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
            @display("p=1340,50,x");
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
            @display("p=1770,50,x");
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
            @display("p=2200,50,x");
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
            @display("p=2630,50,x");
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
            @display("p=3060,50,x");
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
            @display("p=3490,50,x");
            switch_id = "Switch_i7";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[0];
    }

    connections:
     Switch_0_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_0_0_0_0.port;
     Switch_0_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_0_0_0_1.port;
     Switch_0_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_0_0_1_0.port;
     Switch_0_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_0_0_1_1.port;
     Switch_0_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_0_0_i0.up_port[0];
     Switch_0_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_0_0_1_i0.up_port[0];
     Switch_0_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_0_0_i0.up_port[1];
     Switch_0_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_0_0_1_i0.up_port[1];
     Switch_0_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_0_1_0_0.port;
     Switch_0_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_0_1_0_1.port;
     Switch_0_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_0_1_1_0.port;
     Switch_0_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_0_1_1_1.port;
     Switch_0_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_1_0_i0.up_port[0];
     Switch_0_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_0_1_1_i0.up_port[0];
     Switch_0_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_1_0_i0.up_port[1];
     Switch_0_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_0_1_1_i0.up_port[1];
     Switch_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i0.up_port[0];
     Switch_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i0.up_port[0];
     Switch_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i0.up_port[1];
     Switch_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i0.up_port[1];
     Switch_0_i2.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i1.up_port[0];
     Switch_0_i2.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i1.up_port[0];
     Switch_0_i3.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i1.up_port[1];
     Switch_0_i3.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i1.up_port[1];
     Switch_1_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_1_0_0_0.port;
     Switch_1_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_1_0_0_1.port;
     Switch_1_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_1_0_1_0.port;
     Switch_1_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_1_0_1_1.port;
     Switch_1_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_1_0_0_i0.up_port[0];
     Switch_1_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_0_1_i0.up_port[0];
     Switch_1_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_1_0_0_i0.up_port[1];
     Switch_1_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_0_1_i0.up_port[1];
     Switch_1_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_1_1_0_0.port;
     Switch_1_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_1_1_0_1.port;
     Switch_1_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_1_1_1_0.port;
     Switch_1_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_1_1_1_1.port;
     Switch_1_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_1_1_0_i0.up_port[0];
     Switch_1_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_1_1_i0.up_port[0];
     Switch_1_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_1_1_0_i0.up_port[1];
     Switch_1_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_1_1_i0.up_port[1];
     Switch_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i0.up_port[0];
     Switch_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i0.up_port[0];
     Switch_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i0.up_port[1];
     Switch_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i0.up_port[1];
     Switch_1_i2.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i1.up_port[0];
     Switch_1_i2.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i1.up_port[0];
     Switch_1_i3.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i1.up_port[1];
     Switch_1_i3.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i1.up_port[1];
     Switch_2_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_2_0_0_0.port;
     Switch_2_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_2_0_0_1.port;
     Switch_2_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_2_0_1_0.port;
     Switch_2_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_2_0_1_1.port;
     Switch_2_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_2_0_0_i0.up_port[0];
     Switch_2_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_2_0_1_i0.up_port[0];
     Switch_2_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_2_0_0_i0.up_port[1];
     Switch_2_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_2_0_1_i0.up_port[1];
     Switch_2_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_2_1_0_0.port;
     Switch_2_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_2_1_0_1.port;
     Switch_2_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_2_1_1_0.port;
     Switch_2_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_2_1_1_1.port;
     Switch_2_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_2_1_0_i0.up_port[0];
     Switch_2_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_2_1_1_i0.up_port[0];
     Switch_2_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_2_1_0_i0.up_port[1];
     Switch_2_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_2_1_1_i0.up_port[1];
     Switch_2_i0.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i0.up_port[0];
     Switch_2_i0.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i0.up_port[0];
     Switch_2_i1.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i0.up_port[1];
     Switch_2_i1.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i0.up_port[1];
     Switch_2_i2.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i1.up_port[0];
     Switch_2_i2.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i1.up_port[0];
     Switch_2_i3.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i1.up_port[1];
     Switch_2_i3.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i1.up_port[1];
     Switch_3_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_3_0_0_0.port;
     Switch_3_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_3_0_0_1.port;
     Switch_3_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_3_0_1_0.port;
     Switch_3_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_3_0_1_1.port;
     Switch_3_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_3_0_0_i0.up_port[0];
     Switch_3_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_3_0_1_i0.up_port[0];
     Switch_3_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_3_0_0_i0.up_port[1];
     Switch_3_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_3_0_1_i0.up_port[1];
     Switch_3_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_3_1_0_0.port;
     Switch_3_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_3_1_0_1.port;
     Switch_3_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_3_1_1_0.port;
     Switch_3_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_3_1_1_1.port;
     Switch_3_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_3_1_0_i0.up_port[0];
     Switch_3_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_3_1_1_i0.up_port[0];
     Switch_3_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_3_1_0_i0.up_port[1];
     Switch_3_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_3_1_1_i0.up_port[1];
     Switch_3_i0.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i0.up_port[0];
     Switch_3_i0.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i0.up_port[0];
     Switch_3_i1.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i0.up_port[1];
     Switch_3_i1.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i0.up_port[1];
     Switch_3_i2.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i1.up_port[0];
     Switch_3_i2.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i1.up_port[0];
     Switch_3_i3.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i1.up_port[1];
     Switch_3_i3.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i1.up_port[1];
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
}
