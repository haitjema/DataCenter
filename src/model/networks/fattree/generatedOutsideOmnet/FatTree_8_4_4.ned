package datacenter.model.networks.fattree.generatedOutsideOmnet;
import ned.DatarateChannel;
import datacenter.model.switch.EthSwitch;
import datacenter.model.node.server.Server;
import datacenter.model.node.server.*;


network FatTree_8_4_4
{
  parameters:
    **.tree_depth               = 4;
    **.int_switch_down_ports    = 8;
    **.tor_switch_up_ports      = 4;
    **.tor_switch_down_ports    = 4;
    **.switch_up_ports          = 4;
    **.switch_down_ports        = 4;
    **.switch_switch_link_speed = 1000000000 bps;
    **.server_switch_link_speed = 1000000000 bps;
    string ServerType = default("TCPClientServer");
    **.number_of_paths = 64;

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
    Server_0_0_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=300,850,x");
            address = 2;
        gates:
    }
    Server_0_0_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=425,850,x");
            address = 3;
        gates:
    }
    Switch_0_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=237,650,x");
            switch_id = "Switch_0_0_0_i0";
            depth = 3;
            sub_tree_id = 0;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_0_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=550,850,x");
            address = 4;
        gates:
    }
    Server_0_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=675,850,x");
            address = 5;
        gates:
    }
    Server_0_0_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=800,850,x");
            address = 6;
        gates:
    }
    Server_0_0_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=925,850,x");
            address = 7;
        gates:
    }
    Switch_0_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=737,650,x");
            switch_id = "Switch_0_0_1_i0";
            depth = 3;
            sub_tree_id = 4;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_0_0_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=1050,850,x");
            address = 8;
        gates:
    }
    Server_0_0_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=1175,850,x");
            address = 9;
        gates:
    }
    Server_0_0_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=1300,850,x");
            address = 10;
        gates:
    }
    Server_0_0_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=1425,850,x");
            address = 11;
        gates:
    }
    Switch_0_0_2_i0 : EthSwitch
    {
        parameters:
            @display("p=1237,650,x");
            switch_id = "Switch_0_0_2_i0";
            depth = 3;
            sub_tree_id = 8;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_0_0_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=1550,850,x");
            address = 12;
        gates:
    }
    Server_0_0_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=1675,850,x");
            address = 13;
        gates:
    }
    Server_0_0_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=1800,850,x");
            address = 14;
        gates:
    }
    Server_0_0_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=1925,850,x");
            address = 15;
        gates:
    }
    Switch_0_0_3_i0 : EthSwitch
    {
        parameters:
            @display("p=1737,650,x");
            switch_id = "Switch_0_0_3_i0";
            depth = 3;
            sub_tree_id = 12;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=425,450,x");
            switch_id = "Switch_0_0_i0";
            depth = 2;
            sub_tree_id = 0;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_0_i1 : EthSwitch
    {
        parameters:
            @display("p=800,450,x");
            switch_id = "Switch_0_0_i1";
            depth = 2;
            sub_tree_id = 0;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_0_i2 : EthSwitch
    {
        parameters:
            @display("p=1175,450,x");
            switch_id = "Switch_0_0_i2";
            depth = 2;
            sub_tree_id = 0;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_0_i3 : EthSwitch
    {
        parameters:
            @display("p=1550,450,x");
            switch_id = "Switch_0_0_i3";
            depth = 2;
            sub_tree_id = 0;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_0_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=2050,850,x");
            address = 16;
        gates:
    }
    Server_0_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=2175,850,x");
            address = 17;
        gates:
    }
    Server_0_1_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=2300,850,x");
            address = 18;
        gates:
    }
    Server_0_1_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=2425,850,x");
            address = 19;
        gates:
    }
    Switch_0_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=2237,650,x");
            switch_id = "Switch_0_1_0_i0";
            depth = 3;
            sub_tree_id = 16;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_0_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=2550,850,x");
            address = 20;
        gates:
    }
    Server_0_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=2675,850,x");
            address = 21;
        gates:
    }
    Server_0_1_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=2800,850,x");
            address = 22;
        gates:
    }
    Server_0_1_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=2925,850,x");
            address = 23;
        gates:
    }
    Switch_0_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=2737,650,x");
            switch_id = "Switch_0_1_1_i0";
            depth = 3;
            sub_tree_id = 20;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_0_1_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=3050,850,x");
            address = 24;
        gates:
    }
    Server_0_1_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=3175,850,x");
            address = 25;
        gates:
    }
    Server_0_1_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=3300,850,x");
            address = 26;
        gates:
    }
    Server_0_1_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=3425,850,x");
            address = 27;
        gates:
    }
    Switch_0_1_2_i0 : EthSwitch
    {
        parameters:
            @display("p=3237,650,x");
            switch_id = "Switch_0_1_2_i0";
            depth = 3;
            sub_tree_id = 24;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_0_1_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=3550,850,x");
            address = 28;
        gates:
    }
    Server_0_1_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=3675,850,x");
            address = 29;
        gates:
    }
    Server_0_1_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=3800,850,x");
            address = 30;
        gates:
    }
    Server_0_1_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=3925,850,x");
            address = 31;
        gates:
    }
    Switch_0_1_3_i0 : EthSwitch
    {
        parameters:
            @display("p=3737,650,x");
            switch_id = "Switch_0_1_3_i0";
            depth = 3;
            sub_tree_id = 28;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=2425,450,x");
            switch_id = "Switch_0_1_i0";
            depth = 2;
            sub_tree_id = 16;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_1_i1 : EthSwitch
    {
        parameters:
            @display("p=2800,450,x");
            switch_id = "Switch_0_1_i1";
            depth = 2;
            sub_tree_id = 16;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_1_i2 : EthSwitch
    {
        parameters:
            @display("p=3175,450,x");
            switch_id = "Switch_0_1_i2";
            depth = 2;
            sub_tree_id = 16;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_1_i3 : EthSwitch
    {
        parameters:
            @display("p=3550,450,x");
            switch_id = "Switch_0_1_i3";
            depth = 2;
            sub_tree_id = 16;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_0_2_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=4050,850,x");
            address = 32;
        gates:
    }
    Server_0_2_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=4175,850,x");
            address = 33;
        gates:
    }
    Server_0_2_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=4300,850,x");
            address = 34;
        gates:
    }
    Server_0_2_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=4425,850,x");
            address = 35;
        gates:
    }
    Switch_0_2_0_i0 : EthSwitch
    {
        parameters:
            @display("p=4237,650,x");
            switch_id = "Switch_0_2_0_i0";
            depth = 3;
            sub_tree_id = 32;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_0_2_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=4550,850,x");
            address = 36;
        gates:
    }
    Server_0_2_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=4675,850,x");
            address = 37;
        gates:
    }
    Server_0_2_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=4800,850,x");
            address = 38;
        gates:
    }
    Server_0_2_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=4925,850,x");
            address = 39;
        gates:
    }
    Switch_0_2_1_i0 : EthSwitch
    {
        parameters:
            @display("p=4737,650,x");
            switch_id = "Switch_0_2_1_i0";
            depth = 3;
            sub_tree_id = 36;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_0_2_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=5050,850,x");
            address = 40;
        gates:
    }
    Server_0_2_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=5175,850,x");
            address = 41;
        gates:
    }
    Server_0_2_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=5300,850,x");
            address = 42;
        gates:
    }
    Server_0_2_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=5425,850,x");
            address = 43;
        gates:
    }
    Switch_0_2_2_i0 : EthSwitch
    {
        parameters:
            @display("p=5237,650,x");
            switch_id = "Switch_0_2_2_i0";
            depth = 3;
            sub_tree_id = 40;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_0_2_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=5550,850,x");
            address = 44;
        gates:
    }
    Server_0_2_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=5675,850,x");
            address = 45;
        gates:
    }
    Server_0_2_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=5800,850,x");
            address = 46;
        gates:
    }
    Server_0_2_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=5925,850,x");
            address = 47;
        gates:
    }
    Switch_0_2_3_i0 : EthSwitch
    {
        parameters:
            @display("p=5737,650,x");
            switch_id = "Switch_0_2_3_i0";
            depth = 3;
            sub_tree_id = 44;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_2_i0 : EthSwitch
    {
        parameters:
            @display("p=4425,450,x");
            switch_id = "Switch_0_2_i0";
            depth = 2;
            sub_tree_id = 32;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_2_i1 : EthSwitch
    {
        parameters:
            @display("p=4800,450,x");
            switch_id = "Switch_0_2_i1";
            depth = 2;
            sub_tree_id = 32;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_2_i2 : EthSwitch
    {
        parameters:
            @display("p=5175,450,x");
            switch_id = "Switch_0_2_i2";
            depth = 2;
            sub_tree_id = 32;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_2_i3 : EthSwitch
    {
        parameters:
            @display("p=5550,450,x");
            switch_id = "Switch_0_2_i3";
            depth = 2;
            sub_tree_id = 32;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_0_3_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=6050,850,x");
            address = 48;
        gates:
    }
    Server_0_3_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=6175,850,x");
            address = 49;
        gates:
    }
    Server_0_3_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=6300,850,x");
            address = 50;
        gates:
    }
    Server_0_3_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=6425,850,x");
            address = 51;
        gates:
    }
    Switch_0_3_0_i0 : EthSwitch
    {
        parameters:
            @display("p=6237,650,x");
            switch_id = "Switch_0_3_0_i0";
            depth = 3;
            sub_tree_id = 48;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_0_3_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=6550,850,x");
            address = 52;
        gates:
    }
    Server_0_3_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=6675,850,x");
            address = 53;
        gates:
    }
    Server_0_3_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=6800,850,x");
            address = 54;
        gates:
    }
    Server_0_3_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=6925,850,x");
            address = 55;
        gates:
    }
    Switch_0_3_1_i0 : EthSwitch
    {
        parameters:
            @display("p=6737,650,x");
            switch_id = "Switch_0_3_1_i0";
            depth = 3;
            sub_tree_id = 52;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_0_3_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=7050,850,x");
            address = 56;
        gates:
    }
    Server_0_3_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=7175,850,x");
            address = 57;
        gates:
    }
    Server_0_3_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=7300,850,x");
            address = 58;
        gates:
    }
    Server_0_3_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=7425,850,x");
            address = 59;
        gates:
    }
    Switch_0_3_2_i0 : EthSwitch
    {
        parameters:
            @display("p=7237,650,x");
            switch_id = "Switch_0_3_2_i0";
            depth = 3;
            sub_tree_id = 56;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_0_3_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=7550,850,x");
            address = 60;
        gates:
    }
    Server_0_3_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=7675,850,x");
            address = 61;
        gates:
    }
    Server_0_3_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=7800,850,x");
            address = 62;
        gates:
    }
    Server_0_3_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=7925,850,x");
            address = 63;
        gates:
    }
    Switch_0_3_3_i0 : EthSwitch
    {
        parameters:
            @display("p=7737,650,x");
            switch_id = "Switch_0_3_3_i0";
            depth = 3;
            sub_tree_id = 60;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_3_i0 : EthSwitch
    {
        parameters:
            @display("p=6425,450,x");
            switch_id = "Switch_0_3_i0";
            depth = 2;
            sub_tree_id = 48;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_3_i1 : EthSwitch
    {
        parameters:
            @display("p=6800,450,x");
            switch_id = "Switch_0_3_i1";
            depth = 2;
            sub_tree_id = 48;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_3_i2 : EthSwitch
    {
        parameters:
            @display("p=7175,450,x");
            switch_id = "Switch_0_3_i2";
            depth = 2;
            sub_tree_id = 48;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_3_i3 : EthSwitch
    {
        parameters:
            @display("p=7550,450,x");
            switch_id = "Switch_0_3_i3";
            depth = 2;
            sub_tree_id = 48;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_i0 : EthSwitch
    {
        parameters:
            @display("p=513,250,x");
            switch_id = "Switch_0_i0";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_i1 : EthSwitch
    {
        parameters:
            @display("p=976,250,x");
            switch_id = "Switch_0_i1";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_i2 : EthSwitch
    {
        parameters:
            @display("p=1439,250,x");
            switch_id = "Switch_0_i2";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_i3 : EthSwitch
    {
        parameters:
            @display("p=1902,250,x");
            switch_id = "Switch_0_i3";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_i4 : EthSwitch
    {
        parameters:
            @display("p=2365,250,x");
            switch_id = "Switch_0_i4";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_i5 : EthSwitch
    {
        parameters:
            @display("p=2828,250,x");
            switch_id = "Switch_0_i5";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_i6 : EthSwitch
    {
        parameters:
            @display("p=3291,250,x");
            switch_id = "Switch_0_i6";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_i7 : EthSwitch
    {
        parameters:
            @display("p=3754,250,x");
            switch_id = "Switch_0_i7";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_i8 : EthSwitch
    {
        parameters:
            @display("p=4217,250,x");
            switch_id = "Switch_0_i8";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_i9 : EthSwitch
    {
        parameters:
            @display("p=4680,250,x");
            switch_id = "Switch_0_i9";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_i10 : EthSwitch
    {
        parameters:
            @display("p=5143,250,x");
            switch_id = "Switch_0_i10";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_i11 : EthSwitch
    {
        parameters:
            @display("p=5606,250,x");
            switch_id = "Switch_0_i11";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_i12 : EthSwitch
    {
        parameters:
            @display("p=6069,250,x");
            switch_id = "Switch_0_i12";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_i13 : EthSwitch
    {
        parameters:
            @display("p=6532,250,x");
            switch_id = "Switch_0_i13";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_i14 : EthSwitch
    {
        parameters:
            @display("p=6995,250,x");
            switch_id = "Switch_0_i14";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_0_i15 : EthSwitch
    {
        parameters:
            @display("p=7458,250,x");
            switch_id = "Switch_0_i15";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_1_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=8050,850,x");
            address = 64;
        gates:
    }
    Server_1_0_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=8175,850,x");
            address = 65;
        gates:
    }
    Server_1_0_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=8300,850,x");
            address = 66;
        gates:
    }
    Server_1_0_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=8425,850,x");
            address = 67;
        gates:
    }
    Switch_1_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=8237,650,x");
            switch_id = "Switch_1_0_0_i0";
            depth = 3;
            sub_tree_id = 64;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_1_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=8550,850,x");
            address = 68;
        gates:
    }
    Server_1_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=8675,850,x");
            address = 69;
        gates:
    }
    Server_1_0_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=8800,850,x");
            address = 70;
        gates:
    }
    Server_1_0_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=8925,850,x");
            address = 71;
        gates:
    }
    Switch_1_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=8737,650,x");
            switch_id = "Switch_1_0_1_i0";
            depth = 3;
            sub_tree_id = 68;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_1_0_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=9050,850,x");
            address = 72;
        gates:
    }
    Server_1_0_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=9175,850,x");
            address = 73;
        gates:
    }
    Server_1_0_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=9300,850,x");
            address = 74;
        gates:
    }
    Server_1_0_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=9425,850,x");
            address = 75;
        gates:
    }
    Switch_1_0_2_i0 : EthSwitch
    {
        parameters:
            @display("p=9237,650,x");
            switch_id = "Switch_1_0_2_i0";
            depth = 3;
            sub_tree_id = 72;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_1_0_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=9550,850,x");
            address = 76;
        gates:
    }
    Server_1_0_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=9675,850,x");
            address = 77;
        gates:
    }
    Server_1_0_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=9800,850,x");
            address = 78;
        gates:
    }
    Server_1_0_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=9925,850,x");
            address = 79;
        gates:
    }
    Switch_1_0_3_i0 : EthSwitch
    {
        parameters:
            @display("p=9737,650,x");
            switch_id = "Switch_1_0_3_i0";
            depth = 3;
            sub_tree_id = 76;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=8425,450,x");
            switch_id = "Switch_1_0_i0";
            depth = 2;
            sub_tree_id = 64;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_0_i1 : EthSwitch
    {
        parameters:
            @display("p=8800,450,x");
            switch_id = "Switch_1_0_i1";
            depth = 2;
            sub_tree_id = 64;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_0_i2 : EthSwitch
    {
        parameters:
            @display("p=9175,450,x");
            switch_id = "Switch_1_0_i2";
            depth = 2;
            sub_tree_id = 64;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_0_i3 : EthSwitch
    {
        parameters:
            @display("p=9550,450,x");
            switch_id = "Switch_1_0_i3";
            depth = 2;
            sub_tree_id = 64;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_1_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=10050,850,x");
            address = 80;
        gates:
    }
    Server_1_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=10175,850,x");
            address = 81;
        gates:
    }
    Server_1_1_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=10300,850,x");
            address = 82;
        gates:
    }
    Server_1_1_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=10425,850,x");
            address = 83;
        gates:
    }
    Switch_1_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=10237,650,x");
            switch_id = "Switch_1_1_0_i0";
            depth = 3;
            sub_tree_id = 80;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_1_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=10550,850,x");
            address = 84;
        gates:
    }
    Server_1_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=10675,850,x");
            address = 85;
        gates:
    }
    Server_1_1_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=10800,850,x");
            address = 86;
        gates:
    }
    Server_1_1_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=10925,850,x");
            address = 87;
        gates:
    }
    Switch_1_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=10737,650,x");
            switch_id = "Switch_1_1_1_i0";
            depth = 3;
            sub_tree_id = 84;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_1_1_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=11050,850,x");
            address = 88;
        gates:
    }
    Server_1_1_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=11175,850,x");
            address = 89;
        gates:
    }
    Server_1_1_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=11300,850,x");
            address = 90;
        gates:
    }
    Server_1_1_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=11425,850,x");
            address = 91;
        gates:
    }
    Switch_1_1_2_i0 : EthSwitch
    {
        parameters:
            @display("p=11237,650,x");
            switch_id = "Switch_1_1_2_i0";
            depth = 3;
            sub_tree_id = 88;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_1_1_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=11550,850,x");
            address = 92;
        gates:
    }
    Server_1_1_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=11675,850,x");
            address = 93;
        gates:
    }
    Server_1_1_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=11800,850,x");
            address = 94;
        gates:
    }
    Server_1_1_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=11925,850,x");
            address = 95;
        gates:
    }
    Switch_1_1_3_i0 : EthSwitch
    {
        parameters:
            @display("p=11737,650,x");
            switch_id = "Switch_1_1_3_i0";
            depth = 3;
            sub_tree_id = 92;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=10425,450,x");
            switch_id = "Switch_1_1_i0";
            depth = 2;
            sub_tree_id = 80;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_1_i1 : EthSwitch
    {
        parameters:
            @display("p=10800,450,x");
            switch_id = "Switch_1_1_i1";
            depth = 2;
            sub_tree_id = 80;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_1_i2 : EthSwitch
    {
        parameters:
            @display("p=11175,450,x");
            switch_id = "Switch_1_1_i2";
            depth = 2;
            sub_tree_id = 80;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_1_i3 : EthSwitch
    {
        parameters:
            @display("p=11550,450,x");
            switch_id = "Switch_1_1_i3";
            depth = 2;
            sub_tree_id = 80;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_1_2_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=12050,850,x");
            address = 96;
        gates:
    }
    Server_1_2_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=12175,850,x");
            address = 97;
        gates:
    }
    Server_1_2_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=12300,850,x");
            address = 98;
        gates:
    }
    Server_1_2_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=12425,850,x");
            address = 99;
        gates:
    }
    Switch_1_2_0_i0 : EthSwitch
    {
        parameters:
            @display("p=12237,650,x");
            switch_id = "Switch_1_2_0_i0";
            depth = 3;
            sub_tree_id = 96;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_1_2_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=12550,850,x");
            address = 100;
        gates:
    }
    Server_1_2_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=12675,850,x");
            address = 101;
        gates:
    }
    Server_1_2_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=12800,850,x");
            address = 102;
        gates:
    }
    Server_1_2_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=12925,850,x");
            address = 103;
        gates:
    }
    Switch_1_2_1_i0 : EthSwitch
    {
        parameters:
            @display("p=12737,650,x");
            switch_id = "Switch_1_2_1_i0";
            depth = 3;
            sub_tree_id = 100;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_1_2_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=13050,850,x");
            address = 104;
        gates:
    }
    Server_1_2_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=13175,850,x");
            address = 105;
        gates:
    }
    Server_1_2_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=13300,850,x");
            address = 106;
        gates:
    }
    Server_1_2_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=13425,850,x");
            address = 107;
        gates:
    }
    Switch_1_2_2_i0 : EthSwitch
    {
        parameters:
            @display("p=13237,650,x");
            switch_id = "Switch_1_2_2_i0";
            depth = 3;
            sub_tree_id = 104;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_1_2_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=13550,850,x");
            address = 108;
        gates:
    }
    Server_1_2_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=13675,850,x");
            address = 109;
        gates:
    }
    Server_1_2_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=13800,850,x");
            address = 110;
        gates:
    }
    Server_1_2_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=13925,850,x");
            address = 111;
        gates:
    }
    Switch_1_2_3_i0 : EthSwitch
    {
        parameters:
            @display("p=13737,650,x");
            switch_id = "Switch_1_2_3_i0";
            depth = 3;
            sub_tree_id = 108;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_2_i0 : EthSwitch
    {
        parameters:
            @display("p=12425,450,x");
            switch_id = "Switch_1_2_i0";
            depth = 2;
            sub_tree_id = 96;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_2_i1 : EthSwitch
    {
        parameters:
            @display("p=12800,450,x");
            switch_id = "Switch_1_2_i1";
            depth = 2;
            sub_tree_id = 96;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_2_i2 : EthSwitch
    {
        parameters:
            @display("p=13175,450,x");
            switch_id = "Switch_1_2_i2";
            depth = 2;
            sub_tree_id = 96;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_2_i3 : EthSwitch
    {
        parameters:
            @display("p=13550,450,x");
            switch_id = "Switch_1_2_i3";
            depth = 2;
            sub_tree_id = 96;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_1_3_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=14050,850,x");
            address = 112;
        gates:
    }
    Server_1_3_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=14175,850,x");
            address = 113;
        gates:
    }
    Server_1_3_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=14300,850,x");
            address = 114;
        gates:
    }
    Server_1_3_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=14425,850,x");
            address = 115;
        gates:
    }
    Switch_1_3_0_i0 : EthSwitch
    {
        parameters:
            @display("p=14237,650,x");
            switch_id = "Switch_1_3_0_i0";
            depth = 3;
            sub_tree_id = 112;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_1_3_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=14550,850,x");
            address = 116;
        gates:
    }
    Server_1_3_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=14675,850,x");
            address = 117;
        gates:
    }
    Server_1_3_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=14800,850,x");
            address = 118;
        gates:
    }
    Server_1_3_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=14925,850,x");
            address = 119;
        gates:
    }
    Switch_1_3_1_i0 : EthSwitch
    {
        parameters:
            @display("p=14737,650,x");
            switch_id = "Switch_1_3_1_i0";
            depth = 3;
            sub_tree_id = 116;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_1_3_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=15050,850,x");
            address = 120;
        gates:
    }
    Server_1_3_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=15175,850,x");
            address = 121;
        gates:
    }
    Server_1_3_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=15300,850,x");
            address = 122;
        gates:
    }
    Server_1_3_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=15425,850,x");
            address = 123;
        gates:
    }
    Switch_1_3_2_i0 : EthSwitch
    {
        parameters:
            @display("p=15237,650,x");
            switch_id = "Switch_1_3_2_i0";
            depth = 3;
            sub_tree_id = 120;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_1_3_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=15550,850,x");
            address = 124;
        gates:
    }
    Server_1_3_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=15675,850,x");
            address = 125;
        gates:
    }
    Server_1_3_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=15800,850,x");
            address = 126;
        gates:
    }
    Server_1_3_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=15925,850,x");
            address = 127;
        gates:
    }
    Switch_1_3_3_i0 : EthSwitch
    {
        parameters:
            @display("p=15737,650,x");
            switch_id = "Switch_1_3_3_i0";
            depth = 3;
            sub_tree_id = 124;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_3_i0 : EthSwitch
    {
        parameters:
            @display("p=14425,450,x");
            switch_id = "Switch_1_3_i0";
            depth = 2;
            sub_tree_id = 112;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_3_i1 : EthSwitch
    {
        parameters:
            @display("p=14800,450,x");
            switch_id = "Switch_1_3_i1";
            depth = 2;
            sub_tree_id = 112;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_3_i2 : EthSwitch
    {
        parameters:
            @display("p=15175,450,x");
            switch_id = "Switch_1_3_i2";
            depth = 2;
            sub_tree_id = 112;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_3_i3 : EthSwitch
    {
        parameters:
            @display("p=15550,450,x");
            switch_id = "Switch_1_3_i3";
            depth = 2;
            sub_tree_id = 112;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_i0 : EthSwitch
    {
        parameters:
            @display("p=8513,250,x");
            switch_id = "Switch_1_i0";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_i1 : EthSwitch
    {
        parameters:
            @display("p=8976,250,x");
            switch_id = "Switch_1_i1";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_i2 : EthSwitch
    {
        parameters:
            @display("p=9439,250,x");
            switch_id = "Switch_1_i2";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_i3 : EthSwitch
    {
        parameters:
            @display("p=9902,250,x");
            switch_id = "Switch_1_i3";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_i4 : EthSwitch
    {
        parameters:
            @display("p=10365,250,x");
            switch_id = "Switch_1_i4";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_i5 : EthSwitch
    {
        parameters:
            @display("p=10828,250,x");
            switch_id = "Switch_1_i5";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_i6 : EthSwitch
    {
        parameters:
            @display("p=11291,250,x");
            switch_id = "Switch_1_i6";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_i7 : EthSwitch
    {
        parameters:
            @display("p=11754,250,x");
            switch_id = "Switch_1_i7";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_i8 : EthSwitch
    {
        parameters:
            @display("p=12217,250,x");
            switch_id = "Switch_1_i8";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_i9 : EthSwitch
    {
        parameters:
            @display("p=12680,250,x");
            switch_id = "Switch_1_i9";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_i10 : EthSwitch
    {
        parameters:
            @display("p=13143,250,x");
            switch_id = "Switch_1_i10";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_i11 : EthSwitch
    {
        parameters:
            @display("p=13606,250,x");
            switch_id = "Switch_1_i11";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_i12 : EthSwitch
    {
        parameters:
            @display("p=14069,250,x");
            switch_id = "Switch_1_i12";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_i13 : EthSwitch
    {
        parameters:
            @display("p=14532,250,x");
            switch_id = "Switch_1_i13";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_i14 : EthSwitch
    {
        parameters:
            @display("p=14995,250,x");
            switch_id = "Switch_1_i14";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_1_i15 : EthSwitch
    {
        parameters:
            @display("p=15458,250,x");
            switch_id = "Switch_1_i15";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_2_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=16050,850,x");
            address = 128;
        gates:
    }
    Server_2_0_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=16175,850,x");
            address = 129;
        gates:
    }
    Server_2_0_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=16300,850,x");
            address = 130;
        gates:
    }
    Server_2_0_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=16425,850,x");
            address = 131;
        gates:
    }
    Switch_2_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=16237,650,x");
            switch_id = "Switch_2_0_0_i0";
            depth = 3;
            sub_tree_id = 128;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_2_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=16550,850,x");
            address = 132;
        gates:
    }
    Server_2_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=16675,850,x");
            address = 133;
        gates:
    }
    Server_2_0_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=16800,850,x");
            address = 134;
        gates:
    }
    Server_2_0_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=16925,850,x");
            address = 135;
        gates:
    }
    Switch_2_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=16737,650,x");
            switch_id = "Switch_2_0_1_i0";
            depth = 3;
            sub_tree_id = 132;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_2_0_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=17050,850,x");
            address = 136;
        gates:
    }
    Server_2_0_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=17175,850,x");
            address = 137;
        gates:
    }
    Server_2_0_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=17300,850,x");
            address = 138;
        gates:
    }
    Server_2_0_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=17425,850,x");
            address = 139;
        gates:
    }
    Switch_2_0_2_i0 : EthSwitch
    {
        parameters:
            @display("p=17237,650,x");
            switch_id = "Switch_2_0_2_i0";
            depth = 3;
            sub_tree_id = 136;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_2_0_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=17550,850,x");
            address = 140;
        gates:
    }
    Server_2_0_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=17675,850,x");
            address = 141;
        gates:
    }
    Server_2_0_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=17800,850,x");
            address = 142;
        gates:
    }
    Server_2_0_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=17925,850,x");
            address = 143;
        gates:
    }
    Switch_2_0_3_i0 : EthSwitch
    {
        parameters:
            @display("p=17737,650,x");
            switch_id = "Switch_2_0_3_i0";
            depth = 3;
            sub_tree_id = 140;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_0_i0 : EthSwitch
    {
        parameters:
            @display("p=16425,450,x");
            switch_id = "Switch_2_0_i0";
            depth = 2;
            sub_tree_id = 128;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_0_i1 : EthSwitch
    {
        parameters:
            @display("p=16800,450,x");
            switch_id = "Switch_2_0_i1";
            depth = 2;
            sub_tree_id = 128;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_0_i2 : EthSwitch
    {
        parameters:
            @display("p=17175,450,x");
            switch_id = "Switch_2_0_i2";
            depth = 2;
            sub_tree_id = 128;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_0_i3 : EthSwitch
    {
        parameters:
            @display("p=17550,450,x");
            switch_id = "Switch_2_0_i3";
            depth = 2;
            sub_tree_id = 128;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_2_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=18050,850,x");
            address = 144;
        gates:
    }
    Server_2_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=18175,850,x");
            address = 145;
        gates:
    }
    Server_2_1_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=18300,850,x");
            address = 146;
        gates:
    }
    Server_2_1_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=18425,850,x");
            address = 147;
        gates:
    }
    Switch_2_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=18237,650,x");
            switch_id = "Switch_2_1_0_i0";
            depth = 3;
            sub_tree_id = 144;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_2_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=18550,850,x");
            address = 148;
        gates:
    }
    Server_2_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=18675,850,x");
            address = 149;
        gates:
    }
    Server_2_1_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=18800,850,x");
            address = 150;
        gates:
    }
    Server_2_1_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=18925,850,x");
            address = 151;
        gates:
    }
    Switch_2_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=18737,650,x");
            switch_id = "Switch_2_1_1_i0";
            depth = 3;
            sub_tree_id = 148;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_2_1_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=19050,850,x");
            address = 152;
        gates:
    }
    Server_2_1_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=19175,850,x");
            address = 153;
        gates:
    }
    Server_2_1_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=19300,850,x");
            address = 154;
        gates:
    }
    Server_2_1_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=19425,850,x");
            address = 155;
        gates:
    }
    Switch_2_1_2_i0 : EthSwitch
    {
        parameters:
            @display("p=19237,650,x");
            switch_id = "Switch_2_1_2_i0";
            depth = 3;
            sub_tree_id = 152;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_2_1_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=19550,850,x");
            address = 156;
        gates:
    }
    Server_2_1_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=19675,850,x");
            address = 157;
        gates:
    }
    Server_2_1_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=19800,850,x");
            address = 158;
        gates:
    }
    Server_2_1_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=19925,850,x");
            address = 159;
        gates:
    }
    Switch_2_1_3_i0 : EthSwitch
    {
        parameters:
            @display("p=19737,650,x");
            switch_id = "Switch_2_1_3_i0";
            depth = 3;
            sub_tree_id = 156;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_1_i0 : EthSwitch
    {
        parameters:
            @display("p=18425,450,x");
            switch_id = "Switch_2_1_i0";
            depth = 2;
            sub_tree_id = 144;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_1_i1 : EthSwitch
    {
        parameters:
            @display("p=18800,450,x");
            switch_id = "Switch_2_1_i1";
            depth = 2;
            sub_tree_id = 144;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_1_i2 : EthSwitch
    {
        parameters:
            @display("p=19175,450,x");
            switch_id = "Switch_2_1_i2";
            depth = 2;
            sub_tree_id = 144;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_1_i3 : EthSwitch
    {
        parameters:
            @display("p=19550,450,x");
            switch_id = "Switch_2_1_i3";
            depth = 2;
            sub_tree_id = 144;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_2_2_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=20050,850,x");
            address = 160;
        gates:
    }
    Server_2_2_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=20175,850,x");
            address = 161;
        gates:
    }
    Server_2_2_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=20300,850,x");
            address = 162;
        gates:
    }
    Server_2_2_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=20425,850,x");
            address = 163;
        gates:
    }
    Switch_2_2_0_i0 : EthSwitch
    {
        parameters:
            @display("p=20237,650,x");
            switch_id = "Switch_2_2_0_i0";
            depth = 3;
            sub_tree_id = 160;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_2_2_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=20550,850,x");
            address = 164;
        gates:
    }
    Server_2_2_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=20675,850,x");
            address = 165;
        gates:
    }
    Server_2_2_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=20800,850,x");
            address = 166;
        gates:
    }
    Server_2_2_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=20925,850,x");
            address = 167;
        gates:
    }
    Switch_2_2_1_i0 : EthSwitch
    {
        parameters:
            @display("p=20737,650,x");
            switch_id = "Switch_2_2_1_i0";
            depth = 3;
            sub_tree_id = 164;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_2_2_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=21050,850,x");
            address = 168;
        gates:
    }
    Server_2_2_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=21175,850,x");
            address = 169;
        gates:
    }
    Server_2_2_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=21300,850,x");
            address = 170;
        gates:
    }
    Server_2_2_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=21425,850,x");
            address = 171;
        gates:
    }
    Switch_2_2_2_i0 : EthSwitch
    {
        parameters:
            @display("p=21237,650,x");
            switch_id = "Switch_2_2_2_i0";
            depth = 3;
            sub_tree_id = 168;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_2_2_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=21550,850,x");
            address = 172;
        gates:
    }
    Server_2_2_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=21675,850,x");
            address = 173;
        gates:
    }
    Server_2_2_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=21800,850,x");
            address = 174;
        gates:
    }
    Server_2_2_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=21925,850,x");
            address = 175;
        gates:
    }
    Switch_2_2_3_i0 : EthSwitch
    {
        parameters:
            @display("p=21737,650,x");
            switch_id = "Switch_2_2_3_i0";
            depth = 3;
            sub_tree_id = 172;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_2_i0 : EthSwitch
    {
        parameters:
            @display("p=20425,450,x");
            switch_id = "Switch_2_2_i0";
            depth = 2;
            sub_tree_id = 160;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_2_i1 : EthSwitch
    {
        parameters:
            @display("p=20800,450,x");
            switch_id = "Switch_2_2_i1";
            depth = 2;
            sub_tree_id = 160;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_2_i2 : EthSwitch
    {
        parameters:
            @display("p=21175,450,x");
            switch_id = "Switch_2_2_i2";
            depth = 2;
            sub_tree_id = 160;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_2_i3 : EthSwitch
    {
        parameters:
            @display("p=21550,450,x");
            switch_id = "Switch_2_2_i3";
            depth = 2;
            sub_tree_id = 160;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_2_3_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=22050,850,x");
            address = 176;
        gates:
    }
    Server_2_3_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=22175,850,x");
            address = 177;
        gates:
    }
    Server_2_3_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=22300,850,x");
            address = 178;
        gates:
    }
    Server_2_3_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=22425,850,x");
            address = 179;
        gates:
    }
    Switch_2_3_0_i0 : EthSwitch
    {
        parameters:
            @display("p=22237,650,x");
            switch_id = "Switch_2_3_0_i0";
            depth = 3;
            sub_tree_id = 176;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_2_3_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=22550,850,x");
            address = 180;
        gates:
    }
    Server_2_3_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=22675,850,x");
            address = 181;
        gates:
    }
    Server_2_3_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=22800,850,x");
            address = 182;
        gates:
    }
    Server_2_3_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=22925,850,x");
            address = 183;
        gates:
    }
    Switch_2_3_1_i0 : EthSwitch
    {
        parameters:
            @display("p=22737,650,x");
            switch_id = "Switch_2_3_1_i0";
            depth = 3;
            sub_tree_id = 180;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_2_3_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=23050,850,x");
            address = 184;
        gates:
    }
    Server_2_3_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=23175,850,x");
            address = 185;
        gates:
    }
    Server_2_3_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=23300,850,x");
            address = 186;
        gates:
    }
    Server_2_3_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=23425,850,x");
            address = 187;
        gates:
    }
    Switch_2_3_2_i0 : EthSwitch
    {
        parameters:
            @display("p=23237,650,x");
            switch_id = "Switch_2_3_2_i0";
            depth = 3;
            sub_tree_id = 184;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_2_3_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=23550,850,x");
            address = 188;
        gates:
    }
    Server_2_3_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=23675,850,x");
            address = 189;
        gates:
    }
    Server_2_3_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=23800,850,x");
            address = 190;
        gates:
    }
    Server_2_3_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=23925,850,x");
            address = 191;
        gates:
    }
    Switch_2_3_3_i0 : EthSwitch
    {
        parameters:
            @display("p=23737,650,x");
            switch_id = "Switch_2_3_3_i0";
            depth = 3;
            sub_tree_id = 188;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_3_i0 : EthSwitch
    {
        parameters:
            @display("p=22425,450,x");
            switch_id = "Switch_2_3_i0";
            depth = 2;
            sub_tree_id = 176;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_3_i1 : EthSwitch
    {
        parameters:
            @display("p=22800,450,x");
            switch_id = "Switch_2_3_i1";
            depth = 2;
            sub_tree_id = 176;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_3_i2 : EthSwitch
    {
        parameters:
            @display("p=23175,450,x");
            switch_id = "Switch_2_3_i2";
            depth = 2;
            sub_tree_id = 176;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_3_i3 : EthSwitch
    {
        parameters:
            @display("p=23550,450,x");
            switch_id = "Switch_2_3_i3";
            depth = 2;
            sub_tree_id = 176;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_i0 : EthSwitch
    {
        parameters:
            @display("p=16513,250,x");
            switch_id = "Switch_2_i0";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_i1 : EthSwitch
    {
        parameters:
            @display("p=16976,250,x");
            switch_id = "Switch_2_i1";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_i2 : EthSwitch
    {
        parameters:
            @display("p=17439,250,x");
            switch_id = "Switch_2_i2";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_i3 : EthSwitch
    {
        parameters:
            @display("p=17902,250,x");
            switch_id = "Switch_2_i3";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_i4 : EthSwitch
    {
        parameters:
            @display("p=18365,250,x");
            switch_id = "Switch_2_i4";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_i5 : EthSwitch
    {
        parameters:
            @display("p=18828,250,x");
            switch_id = "Switch_2_i5";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_i6 : EthSwitch
    {
        parameters:
            @display("p=19291,250,x");
            switch_id = "Switch_2_i6";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_i7 : EthSwitch
    {
        parameters:
            @display("p=19754,250,x");
            switch_id = "Switch_2_i7";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_i8 : EthSwitch
    {
        parameters:
            @display("p=20217,250,x");
            switch_id = "Switch_2_i8";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_i9 : EthSwitch
    {
        parameters:
            @display("p=20680,250,x");
            switch_id = "Switch_2_i9";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_i10 : EthSwitch
    {
        parameters:
            @display("p=21143,250,x");
            switch_id = "Switch_2_i10";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_i11 : EthSwitch
    {
        parameters:
            @display("p=21606,250,x");
            switch_id = "Switch_2_i11";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_i12 : EthSwitch
    {
        parameters:
            @display("p=22069,250,x");
            switch_id = "Switch_2_i12";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_i13 : EthSwitch
    {
        parameters:
            @display("p=22532,250,x");
            switch_id = "Switch_2_i13";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_i14 : EthSwitch
    {
        parameters:
            @display("p=22995,250,x");
            switch_id = "Switch_2_i14";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_2_i15 : EthSwitch
    {
        parameters:
            @display("p=23458,250,x");
            switch_id = "Switch_2_i15";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_3_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=24050,850,x");
            address = 192;
        gates:
    }
    Server_3_0_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=24175,850,x");
            address = 193;
        gates:
    }
    Server_3_0_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=24300,850,x");
            address = 194;
        gates:
    }
    Server_3_0_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=24425,850,x");
            address = 195;
        gates:
    }
    Switch_3_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=24237,650,x");
            switch_id = "Switch_3_0_0_i0";
            depth = 3;
            sub_tree_id = 192;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_3_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=24550,850,x");
            address = 196;
        gates:
    }
    Server_3_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=24675,850,x");
            address = 197;
        gates:
    }
    Server_3_0_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=24800,850,x");
            address = 198;
        gates:
    }
    Server_3_0_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=24925,850,x");
            address = 199;
        gates:
    }
    Switch_3_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=24737,650,x");
            switch_id = "Switch_3_0_1_i0";
            depth = 3;
            sub_tree_id = 196;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_3_0_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=25050,850,x");
            address = 200;
        gates:
    }
    Server_3_0_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=25175,850,x");
            address = 201;
        gates:
    }
    Server_3_0_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=25300,850,x");
            address = 202;
        gates:
    }
    Server_3_0_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=25425,850,x");
            address = 203;
        gates:
    }
    Switch_3_0_2_i0 : EthSwitch
    {
        parameters:
            @display("p=25237,650,x");
            switch_id = "Switch_3_0_2_i0";
            depth = 3;
            sub_tree_id = 200;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_3_0_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=25550,850,x");
            address = 204;
        gates:
    }
    Server_3_0_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=25675,850,x");
            address = 205;
        gates:
    }
    Server_3_0_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=25800,850,x");
            address = 206;
        gates:
    }
    Server_3_0_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=25925,850,x");
            address = 207;
        gates:
    }
    Switch_3_0_3_i0 : EthSwitch
    {
        parameters:
            @display("p=25737,650,x");
            switch_id = "Switch_3_0_3_i0";
            depth = 3;
            sub_tree_id = 204;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_0_i0 : EthSwitch
    {
        parameters:
            @display("p=24425,450,x");
            switch_id = "Switch_3_0_i0";
            depth = 2;
            sub_tree_id = 192;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_0_i1 : EthSwitch
    {
        parameters:
            @display("p=24800,450,x");
            switch_id = "Switch_3_0_i1";
            depth = 2;
            sub_tree_id = 192;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_0_i2 : EthSwitch
    {
        parameters:
            @display("p=25175,450,x");
            switch_id = "Switch_3_0_i2";
            depth = 2;
            sub_tree_id = 192;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_0_i3 : EthSwitch
    {
        parameters:
            @display("p=25550,450,x");
            switch_id = "Switch_3_0_i3";
            depth = 2;
            sub_tree_id = 192;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_3_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=26050,850,x");
            address = 208;
        gates:
    }
    Server_3_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=26175,850,x");
            address = 209;
        gates:
    }
    Server_3_1_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=26300,850,x");
            address = 210;
        gates:
    }
    Server_3_1_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=26425,850,x");
            address = 211;
        gates:
    }
    Switch_3_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=26237,650,x");
            switch_id = "Switch_3_1_0_i0";
            depth = 3;
            sub_tree_id = 208;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_3_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=26550,850,x");
            address = 212;
        gates:
    }
    Server_3_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=26675,850,x");
            address = 213;
        gates:
    }
    Server_3_1_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=26800,850,x");
            address = 214;
        gates:
    }
    Server_3_1_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=26925,850,x");
            address = 215;
        gates:
    }
    Switch_3_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=26737,650,x");
            switch_id = "Switch_3_1_1_i0";
            depth = 3;
            sub_tree_id = 212;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_3_1_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=27050,850,x");
            address = 216;
        gates:
    }
    Server_3_1_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=27175,850,x");
            address = 217;
        gates:
    }
    Server_3_1_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=27300,850,x");
            address = 218;
        gates:
    }
    Server_3_1_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=27425,850,x");
            address = 219;
        gates:
    }
    Switch_3_1_2_i0 : EthSwitch
    {
        parameters:
            @display("p=27237,650,x");
            switch_id = "Switch_3_1_2_i0";
            depth = 3;
            sub_tree_id = 216;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_3_1_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=27550,850,x");
            address = 220;
        gates:
    }
    Server_3_1_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=27675,850,x");
            address = 221;
        gates:
    }
    Server_3_1_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=27800,850,x");
            address = 222;
        gates:
    }
    Server_3_1_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=27925,850,x");
            address = 223;
        gates:
    }
    Switch_3_1_3_i0 : EthSwitch
    {
        parameters:
            @display("p=27737,650,x");
            switch_id = "Switch_3_1_3_i0";
            depth = 3;
            sub_tree_id = 220;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_1_i0 : EthSwitch
    {
        parameters:
            @display("p=26425,450,x");
            switch_id = "Switch_3_1_i0";
            depth = 2;
            sub_tree_id = 208;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_1_i1 : EthSwitch
    {
        parameters:
            @display("p=26800,450,x");
            switch_id = "Switch_3_1_i1";
            depth = 2;
            sub_tree_id = 208;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_1_i2 : EthSwitch
    {
        parameters:
            @display("p=27175,450,x");
            switch_id = "Switch_3_1_i2";
            depth = 2;
            sub_tree_id = 208;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_1_i3 : EthSwitch
    {
        parameters:
            @display("p=27550,450,x");
            switch_id = "Switch_3_1_i3";
            depth = 2;
            sub_tree_id = 208;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_3_2_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=28050,850,x");
            address = 224;
        gates:
    }
    Server_3_2_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=28175,850,x");
            address = 225;
        gates:
    }
    Server_3_2_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=28300,850,x");
            address = 226;
        gates:
    }
    Server_3_2_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=28425,850,x");
            address = 227;
        gates:
    }
    Switch_3_2_0_i0 : EthSwitch
    {
        parameters:
            @display("p=28237,650,x");
            switch_id = "Switch_3_2_0_i0";
            depth = 3;
            sub_tree_id = 224;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_3_2_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=28550,850,x");
            address = 228;
        gates:
    }
    Server_3_2_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=28675,850,x");
            address = 229;
        gates:
    }
    Server_3_2_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=28800,850,x");
            address = 230;
        gates:
    }
    Server_3_2_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=28925,850,x");
            address = 231;
        gates:
    }
    Switch_3_2_1_i0 : EthSwitch
    {
        parameters:
            @display("p=28737,650,x");
            switch_id = "Switch_3_2_1_i0";
            depth = 3;
            sub_tree_id = 228;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_3_2_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=29050,850,x");
            address = 232;
        gates:
    }
    Server_3_2_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=29175,850,x");
            address = 233;
        gates:
    }
    Server_3_2_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=29300,850,x");
            address = 234;
        gates:
    }
    Server_3_2_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=29425,850,x");
            address = 235;
        gates:
    }
    Switch_3_2_2_i0 : EthSwitch
    {
        parameters:
            @display("p=29237,650,x");
            switch_id = "Switch_3_2_2_i0";
            depth = 3;
            sub_tree_id = 232;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_3_2_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=29550,850,x");
            address = 236;
        gates:
    }
    Server_3_2_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=29675,850,x");
            address = 237;
        gates:
    }
    Server_3_2_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=29800,850,x");
            address = 238;
        gates:
    }
    Server_3_2_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=29925,850,x");
            address = 239;
        gates:
    }
    Switch_3_2_3_i0 : EthSwitch
    {
        parameters:
            @display("p=29737,650,x");
            switch_id = "Switch_3_2_3_i0";
            depth = 3;
            sub_tree_id = 236;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_2_i0 : EthSwitch
    {
        parameters:
            @display("p=28425,450,x");
            switch_id = "Switch_3_2_i0";
            depth = 2;
            sub_tree_id = 224;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_2_i1 : EthSwitch
    {
        parameters:
            @display("p=28800,450,x");
            switch_id = "Switch_3_2_i1";
            depth = 2;
            sub_tree_id = 224;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_2_i2 : EthSwitch
    {
        parameters:
            @display("p=29175,450,x");
            switch_id = "Switch_3_2_i2";
            depth = 2;
            sub_tree_id = 224;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_2_i3 : EthSwitch
    {
        parameters:
            @display("p=29550,450,x");
            switch_id = "Switch_3_2_i3";
            depth = 2;
            sub_tree_id = 224;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_3_3_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=30050,850,x");
            address = 240;
        gates:
    }
    Server_3_3_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=30175,850,x");
            address = 241;
        gates:
    }
    Server_3_3_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=30300,850,x");
            address = 242;
        gates:
    }
    Server_3_3_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=30425,850,x");
            address = 243;
        gates:
    }
    Switch_3_3_0_i0 : EthSwitch
    {
        parameters:
            @display("p=30237,650,x");
            switch_id = "Switch_3_3_0_i0";
            depth = 3;
            sub_tree_id = 240;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_3_3_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=30550,850,x");
            address = 244;
        gates:
    }
    Server_3_3_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=30675,850,x");
            address = 245;
        gates:
    }
    Server_3_3_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=30800,850,x");
            address = 246;
        gates:
    }
    Server_3_3_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=30925,850,x");
            address = 247;
        gates:
    }
    Switch_3_3_1_i0 : EthSwitch
    {
        parameters:
            @display("p=30737,650,x");
            switch_id = "Switch_3_3_1_i0";
            depth = 3;
            sub_tree_id = 244;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_3_3_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=31050,850,x");
            address = 248;
        gates:
    }
    Server_3_3_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=31175,850,x");
            address = 249;
        gates:
    }
    Server_3_3_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=31300,850,x");
            address = 250;
        gates:
    }
    Server_3_3_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=31425,850,x");
            address = 251;
        gates:
    }
    Switch_3_3_2_i0 : EthSwitch
    {
        parameters:
            @display("p=31237,650,x");
            switch_id = "Switch_3_3_2_i0";
            depth = 3;
            sub_tree_id = 248;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_3_3_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=31550,850,x");
            address = 252;
        gates:
    }
    Server_3_3_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=31675,850,x");
            address = 253;
        gates:
    }
    Server_3_3_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=31800,850,x");
            address = 254;
        gates:
    }
    Server_3_3_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=31925,850,x");
            address = 255;
        gates:
    }
    Switch_3_3_3_i0 : EthSwitch
    {
        parameters:
            @display("p=31737,650,x");
            switch_id = "Switch_3_3_3_i0";
            depth = 3;
            sub_tree_id = 252;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_3_i0 : EthSwitch
    {
        parameters:
            @display("p=30425,450,x");
            switch_id = "Switch_3_3_i0";
            depth = 2;
            sub_tree_id = 240;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_3_i1 : EthSwitch
    {
        parameters:
            @display("p=30800,450,x");
            switch_id = "Switch_3_3_i1";
            depth = 2;
            sub_tree_id = 240;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_3_i2 : EthSwitch
    {
        parameters:
            @display("p=31175,450,x");
            switch_id = "Switch_3_3_i2";
            depth = 2;
            sub_tree_id = 240;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_3_i3 : EthSwitch
    {
        parameters:
            @display("p=31550,450,x");
            switch_id = "Switch_3_3_i3";
            depth = 2;
            sub_tree_id = 240;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_i0 : EthSwitch
    {
        parameters:
            @display("p=24513,250,x");
            switch_id = "Switch_3_i0";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_i1 : EthSwitch
    {
        parameters:
            @display("p=24976,250,x");
            switch_id = "Switch_3_i1";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_i2 : EthSwitch
    {
        parameters:
            @display("p=25439,250,x");
            switch_id = "Switch_3_i2";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_i3 : EthSwitch
    {
        parameters:
            @display("p=25902,250,x");
            switch_id = "Switch_3_i3";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_i4 : EthSwitch
    {
        parameters:
            @display("p=26365,250,x");
            switch_id = "Switch_3_i4";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_i5 : EthSwitch
    {
        parameters:
            @display("p=26828,250,x");
            switch_id = "Switch_3_i5";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_i6 : EthSwitch
    {
        parameters:
            @display("p=27291,250,x");
            switch_id = "Switch_3_i6";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_i7 : EthSwitch
    {
        parameters:
            @display("p=27754,250,x");
            switch_id = "Switch_3_i7";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_i8 : EthSwitch
    {
        parameters:
            @display("p=28217,250,x");
            switch_id = "Switch_3_i8";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_i9 : EthSwitch
    {
        parameters:
            @display("p=28680,250,x");
            switch_id = "Switch_3_i9";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_i10 : EthSwitch
    {
        parameters:
            @display("p=29143,250,x");
            switch_id = "Switch_3_i10";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_i11 : EthSwitch
    {
        parameters:
            @display("p=29606,250,x");
            switch_id = "Switch_3_i11";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_i12 : EthSwitch
    {
        parameters:
            @display("p=30069,250,x");
            switch_id = "Switch_3_i12";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_i13 : EthSwitch
    {
        parameters:
            @display("p=30532,250,x");
            switch_id = "Switch_3_i13";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_i14 : EthSwitch
    {
        parameters:
            @display("p=30995,250,x");
            switch_id = "Switch_3_i14";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_3_i15 : EthSwitch
    {
        parameters:
            @display("p=31458,250,x");
            switch_id = "Switch_3_i15";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_4_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=32050,850,x");
            address = 256;
        gates:
    }
    Server_4_0_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=32175,850,x");
            address = 257;
        gates:
    }
    Server_4_0_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=32300,850,x");
            address = 258;
        gates:
    }
    Server_4_0_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=32425,850,x");
            address = 259;
        gates:
    }
    Switch_4_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=32237,650,x");
            switch_id = "Switch_4_0_0_i0";
            depth = 3;
            sub_tree_id = 256;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_4_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=32550,850,x");
            address = 260;
        gates:
    }
    Server_4_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=32675,850,x");
            address = 261;
        gates:
    }
    Server_4_0_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=32800,850,x");
            address = 262;
        gates:
    }
    Server_4_0_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=32925,850,x");
            address = 263;
        gates:
    }
    Switch_4_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=32737,650,x");
            switch_id = "Switch_4_0_1_i0";
            depth = 3;
            sub_tree_id = 260;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_4_0_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=33050,850,x");
            address = 264;
        gates:
    }
    Server_4_0_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=33175,850,x");
            address = 265;
        gates:
    }
    Server_4_0_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=33300,850,x");
            address = 266;
        gates:
    }
    Server_4_0_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=33425,850,x");
            address = 267;
        gates:
    }
    Switch_4_0_2_i0 : EthSwitch
    {
        parameters:
            @display("p=33237,650,x");
            switch_id = "Switch_4_0_2_i0";
            depth = 3;
            sub_tree_id = 264;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_4_0_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=33550,850,x");
            address = 268;
        gates:
    }
    Server_4_0_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=33675,850,x");
            address = 269;
        gates:
    }
    Server_4_0_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=33800,850,x");
            address = 270;
        gates:
    }
    Server_4_0_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=33925,850,x");
            address = 271;
        gates:
    }
    Switch_4_0_3_i0 : EthSwitch
    {
        parameters:
            @display("p=33737,650,x");
            switch_id = "Switch_4_0_3_i0";
            depth = 3;
            sub_tree_id = 268;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_0_i0 : EthSwitch
    {
        parameters:
            @display("p=32425,450,x");
            switch_id = "Switch_4_0_i0";
            depth = 2;
            sub_tree_id = 256;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_0_i1 : EthSwitch
    {
        parameters:
            @display("p=32800,450,x");
            switch_id = "Switch_4_0_i1";
            depth = 2;
            sub_tree_id = 256;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_0_i2 : EthSwitch
    {
        parameters:
            @display("p=33175,450,x");
            switch_id = "Switch_4_0_i2";
            depth = 2;
            sub_tree_id = 256;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_0_i3 : EthSwitch
    {
        parameters:
            @display("p=33550,450,x");
            switch_id = "Switch_4_0_i3";
            depth = 2;
            sub_tree_id = 256;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_4_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=34050,850,x");
            address = 272;
        gates:
    }
    Server_4_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=34175,850,x");
            address = 273;
        gates:
    }
    Server_4_1_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=34300,850,x");
            address = 274;
        gates:
    }
    Server_4_1_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=34425,850,x");
            address = 275;
        gates:
    }
    Switch_4_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=34237,650,x");
            switch_id = "Switch_4_1_0_i0";
            depth = 3;
            sub_tree_id = 272;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_4_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=34550,850,x");
            address = 276;
        gates:
    }
    Server_4_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=34675,850,x");
            address = 277;
        gates:
    }
    Server_4_1_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=34800,850,x");
            address = 278;
        gates:
    }
    Server_4_1_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=34925,850,x");
            address = 279;
        gates:
    }
    Switch_4_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=34737,650,x");
            switch_id = "Switch_4_1_1_i0";
            depth = 3;
            sub_tree_id = 276;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_4_1_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=35050,850,x");
            address = 280;
        gates:
    }
    Server_4_1_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=35175,850,x");
            address = 281;
        gates:
    }
    Server_4_1_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=35300,850,x");
            address = 282;
        gates:
    }
    Server_4_1_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=35425,850,x");
            address = 283;
        gates:
    }
    Switch_4_1_2_i0 : EthSwitch
    {
        parameters:
            @display("p=35237,650,x");
            switch_id = "Switch_4_1_2_i0";
            depth = 3;
            sub_tree_id = 280;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_4_1_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=35550,850,x");
            address = 284;
        gates:
    }
    Server_4_1_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=35675,850,x");
            address = 285;
        gates:
    }
    Server_4_1_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=35800,850,x");
            address = 286;
        gates:
    }
    Server_4_1_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=35925,850,x");
            address = 287;
        gates:
    }
    Switch_4_1_3_i0 : EthSwitch
    {
        parameters:
            @display("p=35737,650,x");
            switch_id = "Switch_4_1_3_i0";
            depth = 3;
            sub_tree_id = 284;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_1_i0 : EthSwitch
    {
        parameters:
            @display("p=34425,450,x");
            switch_id = "Switch_4_1_i0";
            depth = 2;
            sub_tree_id = 272;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_1_i1 : EthSwitch
    {
        parameters:
            @display("p=34800,450,x");
            switch_id = "Switch_4_1_i1";
            depth = 2;
            sub_tree_id = 272;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_1_i2 : EthSwitch
    {
        parameters:
            @display("p=35175,450,x");
            switch_id = "Switch_4_1_i2";
            depth = 2;
            sub_tree_id = 272;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_1_i3 : EthSwitch
    {
        parameters:
            @display("p=35550,450,x");
            switch_id = "Switch_4_1_i3";
            depth = 2;
            sub_tree_id = 272;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_4_2_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=36050,850,x");
            address = 288;
        gates:
    }
    Server_4_2_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=36175,850,x");
            address = 289;
        gates:
    }
    Server_4_2_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=36300,850,x");
            address = 290;
        gates:
    }
    Server_4_2_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=36425,850,x");
            address = 291;
        gates:
    }
    Switch_4_2_0_i0 : EthSwitch
    {
        parameters:
            @display("p=36237,650,x");
            switch_id = "Switch_4_2_0_i0";
            depth = 3;
            sub_tree_id = 288;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_4_2_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=36550,850,x");
            address = 292;
        gates:
    }
    Server_4_2_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=36675,850,x");
            address = 293;
        gates:
    }
    Server_4_2_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=36800,850,x");
            address = 294;
        gates:
    }
    Server_4_2_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=36925,850,x");
            address = 295;
        gates:
    }
    Switch_4_2_1_i0 : EthSwitch
    {
        parameters:
            @display("p=36737,650,x");
            switch_id = "Switch_4_2_1_i0";
            depth = 3;
            sub_tree_id = 292;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_4_2_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=37050,850,x");
            address = 296;
        gates:
    }
    Server_4_2_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=37175,850,x");
            address = 297;
        gates:
    }
    Server_4_2_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=37300,850,x");
            address = 298;
        gates:
    }
    Server_4_2_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=37425,850,x");
            address = 299;
        gates:
    }
    Switch_4_2_2_i0 : EthSwitch
    {
        parameters:
            @display("p=37237,650,x");
            switch_id = "Switch_4_2_2_i0";
            depth = 3;
            sub_tree_id = 296;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_4_2_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=37550,850,x");
            address = 300;
        gates:
    }
    Server_4_2_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=37675,850,x");
            address = 301;
        gates:
    }
    Server_4_2_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=37800,850,x");
            address = 302;
        gates:
    }
    Server_4_2_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=37925,850,x");
            address = 303;
        gates:
    }
    Switch_4_2_3_i0 : EthSwitch
    {
        parameters:
            @display("p=37737,650,x");
            switch_id = "Switch_4_2_3_i0";
            depth = 3;
            sub_tree_id = 300;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_2_i0 : EthSwitch
    {
        parameters:
            @display("p=36425,450,x");
            switch_id = "Switch_4_2_i0";
            depth = 2;
            sub_tree_id = 288;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_2_i1 : EthSwitch
    {
        parameters:
            @display("p=36800,450,x");
            switch_id = "Switch_4_2_i1";
            depth = 2;
            sub_tree_id = 288;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_2_i2 : EthSwitch
    {
        parameters:
            @display("p=37175,450,x");
            switch_id = "Switch_4_2_i2";
            depth = 2;
            sub_tree_id = 288;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_2_i3 : EthSwitch
    {
        parameters:
            @display("p=37550,450,x");
            switch_id = "Switch_4_2_i3";
            depth = 2;
            sub_tree_id = 288;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_4_3_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=38050,850,x");
            address = 304;
        gates:
    }
    Server_4_3_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=38175,850,x");
            address = 305;
        gates:
    }
    Server_4_3_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=38300,850,x");
            address = 306;
        gates:
    }
    Server_4_3_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=38425,850,x");
            address = 307;
        gates:
    }
    Switch_4_3_0_i0 : EthSwitch
    {
        parameters:
            @display("p=38237,650,x");
            switch_id = "Switch_4_3_0_i0";
            depth = 3;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_4_3_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=38550,850,x");
            address = 308;
        gates:
    }
    Server_4_3_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=38675,850,x");
            address = 309;
        gates:
    }
    Server_4_3_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=38800,850,x");
            address = 310;
        gates:
    }
    Server_4_3_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=38925,850,x");
            address = 311;
        gates:
    }
    Switch_4_3_1_i0 : EthSwitch
    {
        parameters:
            @display("p=38737,650,x");
            switch_id = "Switch_4_3_1_i0";
            depth = 3;
            sub_tree_id = 308;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_4_3_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=39050,850,x");
            address = 312;
        gates:
    }
    Server_4_3_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=39175,850,x");
            address = 313;
        gates:
    }
    Server_4_3_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=39300,850,x");
            address = 314;
        gates:
    }
    Server_4_3_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=39425,850,x");
            address = 315;
        gates:
    }
    Switch_4_3_2_i0 : EthSwitch
    {
        parameters:
            @display("p=39237,650,x");
            switch_id = "Switch_4_3_2_i0";
            depth = 3;
            sub_tree_id = 312;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_4_3_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=39550,850,x");
            address = 316;
        gates:
    }
    Server_4_3_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=39675,850,x");
            address = 317;
        gates:
    }
    Server_4_3_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=39800,850,x");
            address = 318;
        gates:
    }
    Server_4_3_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=39925,850,x");
            address = 319;
        gates:
    }
    Switch_4_3_3_i0 : EthSwitch
    {
        parameters:
            @display("p=39737,650,x");
            switch_id = "Switch_4_3_3_i0";
            depth = 3;
            sub_tree_id = 316;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_3_i0 : EthSwitch
    {
        parameters:
            @display("p=38425,450,x");
            switch_id = "Switch_4_3_i0";
            depth = 2;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_3_i1 : EthSwitch
    {
        parameters:
            @display("p=38800,450,x");
            switch_id = "Switch_4_3_i1";
            depth = 2;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_3_i2 : EthSwitch
    {
        parameters:
            @display("p=39175,450,x");
            switch_id = "Switch_4_3_i2";
            depth = 2;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_3_i3 : EthSwitch
    {
        parameters:
            @display("p=39550,450,x");
            switch_id = "Switch_4_3_i3";
            depth = 2;
            sub_tree_id = 304;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_i0 : EthSwitch
    {
        parameters:
            @display("p=32513,250,x");
            switch_id = "Switch_4_i0";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_i1 : EthSwitch
    {
        parameters:
            @display("p=32976,250,x");
            switch_id = "Switch_4_i1";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_i2 : EthSwitch
    {
        parameters:
            @display("p=33439,250,x");
            switch_id = "Switch_4_i2";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_i3 : EthSwitch
    {
        parameters:
            @display("p=33902,250,x");
            switch_id = "Switch_4_i3";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_i4 : EthSwitch
    {
        parameters:
            @display("p=34365,250,x");
            switch_id = "Switch_4_i4";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_i5 : EthSwitch
    {
        parameters:
            @display("p=34828,250,x");
            switch_id = "Switch_4_i5";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_i6 : EthSwitch
    {
        parameters:
            @display("p=35291,250,x");
            switch_id = "Switch_4_i6";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_i7 : EthSwitch
    {
        parameters:
            @display("p=35754,250,x");
            switch_id = "Switch_4_i7";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_i8 : EthSwitch
    {
        parameters:
            @display("p=36217,250,x");
            switch_id = "Switch_4_i8";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_i9 : EthSwitch
    {
        parameters:
            @display("p=36680,250,x");
            switch_id = "Switch_4_i9";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_i10 : EthSwitch
    {
        parameters:
            @display("p=37143,250,x");
            switch_id = "Switch_4_i10";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_i11 : EthSwitch
    {
        parameters:
            @display("p=37606,250,x");
            switch_id = "Switch_4_i11";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_i12 : EthSwitch
    {
        parameters:
            @display("p=38069,250,x");
            switch_id = "Switch_4_i12";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_i13 : EthSwitch
    {
        parameters:
            @display("p=38532,250,x");
            switch_id = "Switch_4_i13";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_i14 : EthSwitch
    {
        parameters:
            @display("p=38995,250,x");
            switch_id = "Switch_4_i14";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_4_i15 : EthSwitch
    {
        parameters:
            @display("p=39458,250,x");
            switch_id = "Switch_4_i15";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_5_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=40050,850,x");
            address = 320;
        gates:
    }
    Server_5_0_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=40175,850,x");
            address = 321;
        gates:
    }
    Server_5_0_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=40300,850,x");
            address = 322;
        gates:
    }
    Server_5_0_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=40425,850,x");
            address = 323;
        gates:
    }
    Switch_5_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=40237,650,x");
            switch_id = "Switch_5_0_0_i0";
            depth = 3;
            sub_tree_id = 320;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_5_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=40550,850,x");
            address = 324;
        gates:
    }
    Server_5_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=40675,850,x");
            address = 325;
        gates:
    }
    Server_5_0_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=40800,850,x");
            address = 326;
        gates:
    }
    Server_5_0_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=40925,850,x");
            address = 327;
        gates:
    }
    Switch_5_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=40737,650,x");
            switch_id = "Switch_5_0_1_i0";
            depth = 3;
            sub_tree_id = 324;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_5_0_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=41050,850,x");
            address = 328;
        gates:
    }
    Server_5_0_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=41175,850,x");
            address = 329;
        gates:
    }
    Server_5_0_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=41300,850,x");
            address = 330;
        gates:
    }
    Server_5_0_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=41425,850,x");
            address = 331;
        gates:
    }
    Switch_5_0_2_i0 : EthSwitch
    {
        parameters:
            @display("p=41237,650,x");
            switch_id = "Switch_5_0_2_i0";
            depth = 3;
            sub_tree_id = 328;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_5_0_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=41550,850,x");
            address = 332;
        gates:
    }
    Server_5_0_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=41675,850,x");
            address = 333;
        gates:
    }
    Server_5_0_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=41800,850,x");
            address = 334;
        gates:
    }
    Server_5_0_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=41925,850,x");
            address = 335;
        gates:
    }
    Switch_5_0_3_i0 : EthSwitch
    {
        parameters:
            @display("p=41737,650,x");
            switch_id = "Switch_5_0_3_i0";
            depth = 3;
            sub_tree_id = 332;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_0_i0 : EthSwitch
    {
        parameters:
            @display("p=40425,450,x");
            switch_id = "Switch_5_0_i0";
            depth = 2;
            sub_tree_id = 320;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_0_i1 : EthSwitch
    {
        parameters:
            @display("p=40800,450,x");
            switch_id = "Switch_5_0_i1";
            depth = 2;
            sub_tree_id = 320;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_0_i2 : EthSwitch
    {
        parameters:
            @display("p=41175,450,x");
            switch_id = "Switch_5_0_i2";
            depth = 2;
            sub_tree_id = 320;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_0_i3 : EthSwitch
    {
        parameters:
            @display("p=41550,450,x");
            switch_id = "Switch_5_0_i3";
            depth = 2;
            sub_tree_id = 320;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_5_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=42050,850,x");
            address = 336;
        gates:
    }
    Server_5_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=42175,850,x");
            address = 337;
        gates:
    }
    Server_5_1_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=42300,850,x");
            address = 338;
        gates:
    }
    Server_5_1_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=42425,850,x");
            address = 339;
        gates:
    }
    Switch_5_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=42237,650,x");
            switch_id = "Switch_5_1_0_i0";
            depth = 3;
            sub_tree_id = 336;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_5_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=42550,850,x");
            address = 340;
        gates:
    }
    Server_5_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=42675,850,x");
            address = 341;
        gates:
    }
    Server_5_1_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=42800,850,x");
            address = 342;
        gates:
    }
    Server_5_1_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=42925,850,x");
            address = 343;
        gates:
    }
    Switch_5_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=42737,650,x");
            switch_id = "Switch_5_1_1_i0";
            depth = 3;
            sub_tree_id = 340;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_5_1_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=43050,850,x");
            address = 344;
        gates:
    }
    Server_5_1_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=43175,850,x");
            address = 345;
        gates:
    }
    Server_5_1_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=43300,850,x");
            address = 346;
        gates:
    }
    Server_5_1_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=43425,850,x");
            address = 347;
        gates:
    }
    Switch_5_1_2_i0 : EthSwitch
    {
        parameters:
            @display("p=43237,650,x");
            switch_id = "Switch_5_1_2_i0";
            depth = 3;
            sub_tree_id = 344;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_5_1_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=43550,850,x");
            address = 348;
        gates:
    }
    Server_5_1_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=43675,850,x");
            address = 349;
        gates:
    }
    Server_5_1_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=43800,850,x");
            address = 350;
        gates:
    }
    Server_5_1_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=43925,850,x");
            address = 351;
        gates:
    }
    Switch_5_1_3_i0 : EthSwitch
    {
        parameters:
            @display("p=43737,650,x");
            switch_id = "Switch_5_1_3_i0";
            depth = 3;
            sub_tree_id = 348;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_1_i0 : EthSwitch
    {
        parameters:
            @display("p=42425,450,x");
            switch_id = "Switch_5_1_i0";
            depth = 2;
            sub_tree_id = 336;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_1_i1 : EthSwitch
    {
        parameters:
            @display("p=42800,450,x");
            switch_id = "Switch_5_1_i1";
            depth = 2;
            sub_tree_id = 336;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_1_i2 : EthSwitch
    {
        parameters:
            @display("p=43175,450,x");
            switch_id = "Switch_5_1_i2";
            depth = 2;
            sub_tree_id = 336;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_1_i3 : EthSwitch
    {
        parameters:
            @display("p=43550,450,x");
            switch_id = "Switch_5_1_i3";
            depth = 2;
            sub_tree_id = 336;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_5_2_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=44050,850,x");
            address = 352;
        gates:
    }
    Server_5_2_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=44175,850,x");
            address = 353;
        gates:
    }
    Server_5_2_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=44300,850,x");
            address = 354;
        gates:
    }
    Server_5_2_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=44425,850,x");
            address = 355;
        gates:
    }
    Switch_5_2_0_i0 : EthSwitch
    {
        parameters:
            @display("p=44237,650,x");
            switch_id = "Switch_5_2_0_i0";
            depth = 3;
            sub_tree_id = 352;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_5_2_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=44550,850,x");
            address = 356;
        gates:
    }
    Server_5_2_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=44675,850,x");
            address = 357;
        gates:
    }
    Server_5_2_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=44800,850,x");
            address = 358;
        gates:
    }
    Server_5_2_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=44925,850,x");
            address = 359;
        gates:
    }
    Switch_5_2_1_i0 : EthSwitch
    {
        parameters:
            @display("p=44737,650,x");
            switch_id = "Switch_5_2_1_i0";
            depth = 3;
            sub_tree_id = 356;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_5_2_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=45050,850,x");
            address = 360;
        gates:
    }
    Server_5_2_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=45175,850,x");
            address = 361;
        gates:
    }
    Server_5_2_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=45300,850,x");
            address = 362;
        gates:
    }
    Server_5_2_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=45425,850,x");
            address = 363;
        gates:
    }
    Switch_5_2_2_i0 : EthSwitch
    {
        parameters:
            @display("p=45237,650,x");
            switch_id = "Switch_5_2_2_i0";
            depth = 3;
            sub_tree_id = 360;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_5_2_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=45550,850,x");
            address = 364;
        gates:
    }
    Server_5_2_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=45675,850,x");
            address = 365;
        gates:
    }
    Server_5_2_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=45800,850,x");
            address = 366;
        gates:
    }
    Server_5_2_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=45925,850,x");
            address = 367;
        gates:
    }
    Switch_5_2_3_i0 : EthSwitch
    {
        parameters:
            @display("p=45737,650,x");
            switch_id = "Switch_5_2_3_i0";
            depth = 3;
            sub_tree_id = 364;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_2_i0 : EthSwitch
    {
        parameters:
            @display("p=44425,450,x");
            switch_id = "Switch_5_2_i0";
            depth = 2;
            sub_tree_id = 352;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_2_i1 : EthSwitch
    {
        parameters:
            @display("p=44800,450,x");
            switch_id = "Switch_5_2_i1";
            depth = 2;
            sub_tree_id = 352;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_2_i2 : EthSwitch
    {
        parameters:
            @display("p=45175,450,x");
            switch_id = "Switch_5_2_i2";
            depth = 2;
            sub_tree_id = 352;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_2_i3 : EthSwitch
    {
        parameters:
            @display("p=45550,450,x");
            switch_id = "Switch_5_2_i3";
            depth = 2;
            sub_tree_id = 352;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_5_3_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=46050,850,x");
            address = 368;
        gates:
    }
    Server_5_3_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=46175,850,x");
            address = 369;
        gates:
    }
    Server_5_3_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=46300,850,x");
            address = 370;
        gates:
    }
    Server_5_3_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=46425,850,x");
            address = 371;
        gates:
    }
    Switch_5_3_0_i0 : EthSwitch
    {
        parameters:
            @display("p=46237,650,x");
            switch_id = "Switch_5_3_0_i0";
            depth = 3;
            sub_tree_id = 368;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_5_3_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=46550,850,x");
            address = 372;
        gates:
    }
    Server_5_3_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=46675,850,x");
            address = 373;
        gates:
    }
    Server_5_3_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=46800,850,x");
            address = 374;
        gates:
    }
    Server_5_3_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=46925,850,x");
            address = 375;
        gates:
    }
    Switch_5_3_1_i0 : EthSwitch
    {
        parameters:
            @display("p=46737,650,x");
            switch_id = "Switch_5_3_1_i0";
            depth = 3;
            sub_tree_id = 372;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_5_3_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=47050,850,x");
            address = 376;
        gates:
    }
    Server_5_3_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=47175,850,x");
            address = 377;
        gates:
    }
    Server_5_3_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=47300,850,x");
            address = 378;
        gates:
    }
    Server_5_3_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=47425,850,x");
            address = 379;
        gates:
    }
    Switch_5_3_2_i0 : EthSwitch
    {
        parameters:
            @display("p=47237,650,x");
            switch_id = "Switch_5_3_2_i0";
            depth = 3;
            sub_tree_id = 376;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_5_3_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=47550,850,x");
            address = 380;
        gates:
    }
    Server_5_3_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=47675,850,x");
            address = 381;
        gates:
    }
    Server_5_3_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=47800,850,x");
            address = 382;
        gates:
    }
    Server_5_3_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=47925,850,x");
            address = 383;
        gates:
    }
    Switch_5_3_3_i0 : EthSwitch
    {
        parameters:
            @display("p=47737,650,x");
            switch_id = "Switch_5_3_3_i0";
            depth = 3;
            sub_tree_id = 380;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_3_i0 : EthSwitch
    {
        parameters:
            @display("p=46425,450,x");
            switch_id = "Switch_5_3_i0";
            depth = 2;
            sub_tree_id = 368;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_3_i1 : EthSwitch
    {
        parameters:
            @display("p=46800,450,x");
            switch_id = "Switch_5_3_i1";
            depth = 2;
            sub_tree_id = 368;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_3_i2 : EthSwitch
    {
        parameters:
            @display("p=47175,450,x");
            switch_id = "Switch_5_3_i2";
            depth = 2;
            sub_tree_id = 368;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_3_i3 : EthSwitch
    {
        parameters:
            @display("p=47550,450,x");
            switch_id = "Switch_5_3_i3";
            depth = 2;
            sub_tree_id = 368;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_i0 : EthSwitch
    {
        parameters:
            @display("p=40513,250,x");
            switch_id = "Switch_5_i0";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_i1 : EthSwitch
    {
        parameters:
            @display("p=40976,250,x");
            switch_id = "Switch_5_i1";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_i2 : EthSwitch
    {
        parameters:
            @display("p=41439,250,x");
            switch_id = "Switch_5_i2";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_i3 : EthSwitch
    {
        parameters:
            @display("p=41902,250,x");
            switch_id = "Switch_5_i3";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_i4 : EthSwitch
    {
        parameters:
            @display("p=42365,250,x");
            switch_id = "Switch_5_i4";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_i5 : EthSwitch
    {
        parameters:
            @display("p=42828,250,x");
            switch_id = "Switch_5_i5";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_i6 : EthSwitch
    {
        parameters:
            @display("p=43291,250,x");
            switch_id = "Switch_5_i6";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_i7 : EthSwitch
    {
        parameters:
            @display("p=43754,250,x");
            switch_id = "Switch_5_i7";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_i8 : EthSwitch
    {
        parameters:
            @display("p=44217,250,x");
            switch_id = "Switch_5_i8";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_i9 : EthSwitch
    {
        parameters:
            @display("p=44680,250,x");
            switch_id = "Switch_5_i9";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_i10 : EthSwitch
    {
        parameters:
            @display("p=45143,250,x");
            switch_id = "Switch_5_i10";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_i11 : EthSwitch
    {
        parameters:
            @display("p=45606,250,x");
            switch_id = "Switch_5_i11";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_i12 : EthSwitch
    {
        parameters:
            @display("p=46069,250,x");
            switch_id = "Switch_5_i12";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_i13 : EthSwitch
    {
        parameters:
            @display("p=46532,250,x");
            switch_id = "Switch_5_i13";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_i14 : EthSwitch
    {
        parameters:
            @display("p=46995,250,x");
            switch_id = "Switch_5_i14";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_5_i15 : EthSwitch
    {
        parameters:
            @display("p=47458,250,x");
            switch_id = "Switch_5_i15";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_6_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=48050,850,x");
            address = 384;
        gates:
    }
    Server_6_0_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=48175,850,x");
            address = 385;
        gates:
    }
    Server_6_0_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=48300,850,x");
            address = 386;
        gates:
    }
    Server_6_0_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=48425,850,x");
            address = 387;
        gates:
    }
    Switch_6_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=48237,650,x");
            switch_id = "Switch_6_0_0_i0";
            depth = 3;
            sub_tree_id = 384;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_6_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=48550,850,x");
            address = 388;
        gates:
    }
    Server_6_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=48675,850,x");
            address = 389;
        gates:
    }
    Server_6_0_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=48800,850,x");
            address = 390;
        gates:
    }
    Server_6_0_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=48925,850,x");
            address = 391;
        gates:
    }
    Switch_6_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=48737,650,x");
            switch_id = "Switch_6_0_1_i0";
            depth = 3;
            sub_tree_id = 388;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_6_0_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=49050,850,x");
            address = 392;
        gates:
    }
    Server_6_0_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=49175,850,x");
            address = 393;
        gates:
    }
    Server_6_0_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=49300,850,x");
            address = 394;
        gates:
    }
    Server_6_0_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=49425,850,x");
            address = 395;
        gates:
    }
    Switch_6_0_2_i0 : EthSwitch
    {
        parameters:
            @display("p=49237,650,x");
            switch_id = "Switch_6_0_2_i0";
            depth = 3;
            sub_tree_id = 392;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_6_0_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=49550,850,x");
            address = 396;
        gates:
    }
    Server_6_0_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=49675,850,x");
            address = 397;
        gates:
    }
    Server_6_0_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=49800,850,x");
            address = 398;
        gates:
    }
    Server_6_0_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=49925,850,x");
            address = 399;
        gates:
    }
    Switch_6_0_3_i0 : EthSwitch
    {
        parameters:
            @display("p=49737,650,x");
            switch_id = "Switch_6_0_3_i0";
            depth = 3;
            sub_tree_id = 396;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_0_i0 : EthSwitch
    {
        parameters:
            @display("p=48425,450,x");
            switch_id = "Switch_6_0_i0";
            depth = 2;
            sub_tree_id = 384;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_0_i1 : EthSwitch
    {
        parameters:
            @display("p=48800,450,x");
            switch_id = "Switch_6_0_i1";
            depth = 2;
            sub_tree_id = 384;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_0_i2 : EthSwitch
    {
        parameters:
            @display("p=49175,450,x");
            switch_id = "Switch_6_0_i2";
            depth = 2;
            sub_tree_id = 384;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_0_i3 : EthSwitch
    {
        parameters:
            @display("p=49550,450,x");
            switch_id = "Switch_6_0_i3";
            depth = 2;
            sub_tree_id = 384;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_6_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=50050,850,x");
            address = 400;
        gates:
    }
    Server_6_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=50175,850,x");
            address = 401;
        gates:
    }
    Server_6_1_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=50300,850,x");
            address = 402;
        gates:
    }
    Server_6_1_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=50425,850,x");
            address = 403;
        gates:
    }
    Switch_6_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=50237,650,x");
            switch_id = "Switch_6_1_0_i0";
            depth = 3;
            sub_tree_id = 400;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_6_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=50550,850,x");
            address = 404;
        gates:
    }
    Server_6_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=50675,850,x");
            address = 405;
        gates:
    }
    Server_6_1_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=50800,850,x");
            address = 406;
        gates:
    }
    Server_6_1_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=50925,850,x");
            address = 407;
        gates:
    }
    Switch_6_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=50737,650,x");
            switch_id = "Switch_6_1_1_i0";
            depth = 3;
            sub_tree_id = 404;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_6_1_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=51050,850,x");
            address = 408;
        gates:
    }
    Server_6_1_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=51175,850,x");
            address = 409;
        gates:
    }
    Server_6_1_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=51300,850,x");
            address = 410;
        gates:
    }
    Server_6_1_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=51425,850,x");
            address = 411;
        gates:
    }
    Switch_6_1_2_i0 : EthSwitch
    {
        parameters:
            @display("p=51237,650,x");
            switch_id = "Switch_6_1_2_i0";
            depth = 3;
            sub_tree_id = 408;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_6_1_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=51550,850,x");
            address = 412;
        gates:
    }
    Server_6_1_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=51675,850,x");
            address = 413;
        gates:
    }
    Server_6_1_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=51800,850,x");
            address = 414;
        gates:
    }
    Server_6_1_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=51925,850,x");
            address = 415;
        gates:
    }
    Switch_6_1_3_i0 : EthSwitch
    {
        parameters:
            @display("p=51737,650,x");
            switch_id = "Switch_6_1_3_i0";
            depth = 3;
            sub_tree_id = 412;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_1_i0 : EthSwitch
    {
        parameters:
            @display("p=50425,450,x");
            switch_id = "Switch_6_1_i0";
            depth = 2;
            sub_tree_id = 400;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_1_i1 : EthSwitch
    {
        parameters:
            @display("p=50800,450,x");
            switch_id = "Switch_6_1_i1";
            depth = 2;
            sub_tree_id = 400;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_1_i2 : EthSwitch
    {
        parameters:
            @display("p=51175,450,x");
            switch_id = "Switch_6_1_i2";
            depth = 2;
            sub_tree_id = 400;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_1_i3 : EthSwitch
    {
        parameters:
            @display("p=51550,450,x");
            switch_id = "Switch_6_1_i3";
            depth = 2;
            sub_tree_id = 400;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_6_2_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=52050,850,x");
            address = 416;
        gates:
    }
    Server_6_2_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=52175,850,x");
            address = 417;
        gates:
    }
    Server_6_2_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=52300,850,x");
            address = 418;
        gates:
    }
    Server_6_2_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=52425,850,x");
            address = 419;
        gates:
    }
    Switch_6_2_0_i0 : EthSwitch
    {
        parameters:
            @display("p=52237,650,x");
            switch_id = "Switch_6_2_0_i0";
            depth = 3;
            sub_tree_id = 416;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_6_2_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=52550,850,x");
            address = 420;
        gates:
    }
    Server_6_2_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=52675,850,x");
            address = 421;
        gates:
    }
    Server_6_2_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=52800,850,x");
            address = 422;
        gates:
    }
    Server_6_2_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=52925,850,x");
            address = 423;
        gates:
    }
    Switch_6_2_1_i0 : EthSwitch
    {
        parameters:
            @display("p=52737,650,x");
            switch_id = "Switch_6_2_1_i0";
            depth = 3;
            sub_tree_id = 420;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_6_2_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=53050,850,x");
            address = 424;
        gates:
    }
    Server_6_2_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=53175,850,x");
            address = 425;
        gates:
    }
    Server_6_2_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=53300,850,x");
            address = 426;
        gates:
    }
    Server_6_2_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=53425,850,x");
            address = 427;
        gates:
    }
    Switch_6_2_2_i0 : EthSwitch
    {
        parameters:
            @display("p=53237,650,x");
            switch_id = "Switch_6_2_2_i0";
            depth = 3;
            sub_tree_id = 424;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_6_2_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=53550,850,x");
            address = 428;
        gates:
    }
    Server_6_2_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=53675,850,x");
            address = 429;
        gates:
    }
    Server_6_2_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=53800,850,x");
            address = 430;
        gates:
    }
    Server_6_2_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=53925,850,x");
            address = 431;
        gates:
    }
    Switch_6_2_3_i0 : EthSwitch
    {
        parameters:
            @display("p=53737,650,x");
            switch_id = "Switch_6_2_3_i0";
            depth = 3;
            sub_tree_id = 428;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_2_i0 : EthSwitch
    {
        parameters:
            @display("p=52425,450,x");
            switch_id = "Switch_6_2_i0";
            depth = 2;
            sub_tree_id = 416;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_2_i1 : EthSwitch
    {
        parameters:
            @display("p=52800,450,x");
            switch_id = "Switch_6_2_i1";
            depth = 2;
            sub_tree_id = 416;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_2_i2 : EthSwitch
    {
        parameters:
            @display("p=53175,450,x");
            switch_id = "Switch_6_2_i2";
            depth = 2;
            sub_tree_id = 416;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_2_i3 : EthSwitch
    {
        parameters:
            @display("p=53550,450,x");
            switch_id = "Switch_6_2_i3";
            depth = 2;
            sub_tree_id = 416;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_6_3_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=54050,850,x");
            address = 432;
        gates:
    }
    Server_6_3_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=54175,850,x");
            address = 433;
        gates:
    }
    Server_6_3_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=54300,850,x");
            address = 434;
        gates:
    }
    Server_6_3_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=54425,850,x");
            address = 435;
        gates:
    }
    Switch_6_3_0_i0 : EthSwitch
    {
        parameters:
            @display("p=54237,650,x");
            switch_id = "Switch_6_3_0_i0";
            depth = 3;
            sub_tree_id = 432;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_6_3_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=54550,850,x");
            address = 436;
        gates:
    }
    Server_6_3_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=54675,850,x");
            address = 437;
        gates:
    }
    Server_6_3_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=54800,850,x");
            address = 438;
        gates:
    }
    Server_6_3_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=54925,850,x");
            address = 439;
        gates:
    }
    Switch_6_3_1_i0 : EthSwitch
    {
        parameters:
            @display("p=54737,650,x");
            switch_id = "Switch_6_3_1_i0";
            depth = 3;
            sub_tree_id = 436;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_6_3_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=55050,850,x");
            address = 440;
        gates:
    }
    Server_6_3_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=55175,850,x");
            address = 441;
        gates:
    }
    Server_6_3_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=55300,850,x");
            address = 442;
        gates:
    }
    Server_6_3_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=55425,850,x");
            address = 443;
        gates:
    }
    Switch_6_3_2_i0 : EthSwitch
    {
        parameters:
            @display("p=55237,650,x");
            switch_id = "Switch_6_3_2_i0";
            depth = 3;
            sub_tree_id = 440;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_6_3_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=55550,850,x");
            address = 444;
        gates:
    }
    Server_6_3_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=55675,850,x");
            address = 445;
        gates:
    }
    Server_6_3_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=55800,850,x");
            address = 446;
        gates:
    }
    Server_6_3_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=55925,850,x");
            address = 447;
        gates:
    }
    Switch_6_3_3_i0 : EthSwitch
    {
        parameters:
            @display("p=55737,650,x");
            switch_id = "Switch_6_3_3_i0";
            depth = 3;
            sub_tree_id = 444;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_3_i0 : EthSwitch
    {
        parameters:
            @display("p=54425,450,x");
            switch_id = "Switch_6_3_i0";
            depth = 2;
            sub_tree_id = 432;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_3_i1 : EthSwitch
    {
        parameters:
            @display("p=54800,450,x");
            switch_id = "Switch_6_3_i1";
            depth = 2;
            sub_tree_id = 432;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_3_i2 : EthSwitch
    {
        parameters:
            @display("p=55175,450,x");
            switch_id = "Switch_6_3_i2";
            depth = 2;
            sub_tree_id = 432;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_3_i3 : EthSwitch
    {
        parameters:
            @display("p=55550,450,x");
            switch_id = "Switch_6_3_i3";
            depth = 2;
            sub_tree_id = 432;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_i0 : EthSwitch
    {
        parameters:
            @display("p=48513,250,x");
            switch_id = "Switch_6_i0";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_i1 : EthSwitch
    {
        parameters:
            @display("p=48976,250,x");
            switch_id = "Switch_6_i1";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_i2 : EthSwitch
    {
        parameters:
            @display("p=49439,250,x");
            switch_id = "Switch_6_i2";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_i3 : EthSwitch
    {
        parameters:
            @display("p=49902,250,x");
            switch_id = "Switch_6_i3";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_i4 : EthSwitch
    {
        parameters:
            @display("p=50365,250,x");
            switch_id = "Switch_6_i4";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_i5 : EthSwitch
    {
        parameters:
            @display("p=50828,250,x");
            switch_id = "Switch_6_i5";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_i6 : EthSwitch
    {
        parameters:
            @display("p=51291,250,x");
            switch_id = "Switch_6_i6";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_i7 : EthSwitch
    {
        parameters:
            @display("p=51754,250,x");
            switch_id = "Switch_6_i7";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_i8 : EthSwitch
    {
        parameters:
            @display("p=52217,250,x");
            switch_id = "Switch_6_i8";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_i9 : EthSwitch
    {
        parameters:
            @display("p=52680,250,x");
            switch_id = "Switch_6_i9";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_i10 : EthSwitch
    {
        parameters:
            @display("p=53143,250,x");
            switch_id = "Switch_6_i10";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_i11 : EthSwitch
    {
        parameters:
            @display("p=53606,250,x");
            switch_id = "Switch_6_i11";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_i12 : EthSwitch
    {
        parameters:
            @display("p=54069,250,x");
            switch_id = "Switch_6_i12";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_i13 : EthSwitch
    {
        parameters:
            @display("p=54532,250,x");
            switch_id = "Switch_6_i13";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_i14 : EthSwitch
    {
        parameters:
            @display("p=54995,250,x");
            switch_id = "Switch_6_i14";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_6_i15 : EthSwitch
    {
        parameters:
            @display("p=55458,250,x");
            switch_id = "Switch_6_i15";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_7_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=56050,850,x");
            address = 448;
        gates:
    }
    Server_7_0_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=56175,850,x");
            address = 449;
        gates:
    }
    Server_7_0_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=56300,850,x");
            address = 450;
        gates:
    }
    Server_7_0_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=56425,850,x");
            address = 451;
        gates:
    }
    Switch_7_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=56237,650,x");
            switch_id = "Switch_7_0_0_i0";
            depth = 3;
            sub_tree_id = 448;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_7_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=56550,850,x");
            address = 452;
        gates:
    }
    Server_7_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=56675,850,x");
            address = 453;
        gates:
    }
    Server_7_0_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=56800,850,x");
            address = 454;
        gates:
    }
    Server_7_0_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=56925,850,x");
            address = 455;
        gates:
    }
    Switch_7_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=56737,650,x");
            switch_id = "Switch_7_0_1_i0";
            depth = 3;
            sub_tree_id = 452;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_7_0_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=57050,850,x");
            address = 456;
        gates:
    }
    Server_7_0_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=57175,850,x");
            address = 457;
        gates:
    }
    Server_7_0_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=57300,850,x");
            address = 458;
        gates:
    }
    Server_7_0_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=57425,850,x");
            address = 459;
        gates:
    }
    Switch_7_0_2_i0 : EthSwitch
    {
        parameters:
            @display("p=57237,650,x");
            switch_id = "Switch_7_0_2_i0";
            depth = 3;
            sub_tree_id = 456;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_7_0_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=57550,850,x");
            address = 460;
        gates:
    }
    Server_7_0_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=57675,850,x");
            address = 461;
        gates:
    }
    Server_7_0_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=57800,850,x");
            address = 462;
        gates:
    }
    Server_7_0_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=57925,850,x");
            address = 463;
        gates:
    }
    Switch_7_0_3_i0 : EthSwitch
    {
        parameters:
            @display("p=57737,650,x");
            switch_id = "Switch_7_0_3_i0";
            depth = 3;
            sub_tree_id = 460;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_0_i0 : EthSwitch
    {
        parameters:
            @display("p=56425,450,x");
            switch_id = "Switch_7_0_i0";
            depth = 2;
            sub_tree_id = 448;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_0_i1 : EthSwitch
    {
        parameters:
            @display("p=56800,450,x");
            switch_id = "Switch_7_0_i1";
            depth = 2;
            sub_tree_id = 448;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_0_i2 : EthSwitch
    {
        parameters:
            @display("p=57175,450,x");
            switch_id = "Switch_7_0_i2";
            depth = 2;
            sub_tree_id = 448;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_0_i3 : EthSwitch
    {
        parameters:
            @display("p=57550,450,x");
            switch_id = "Switch_7_0_i3";
            depth = 2;
            sub_tree_id = 448;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_7_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=58050,850,x");
            address = 464;
        gates:
    }
    Server_7_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=58175,850,x");
            address = 465;
        gates:
    }
    Server_7_1_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=58300,850,x");
            address = 466;
        gates:
    }
    Server_7_1_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=58425,850,x");
            address = 467;
        gates:
    }
    Switch_7_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=58237,650,x");
            switch_id = "Switch_7_1_0_i0";
            depth = 3;
            sub_tree_id = 464;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_7_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=58550,850,x");
            address = 468;
        gates:
    }
    Server_7_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=58675,850,x");
            address = 469;
        gates:
    }
    Server_7_1_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=58800,850,x");
            address = 470;
        gates:
    }
    Server_7_1_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=58925,850,x");
            address = 471;
        gates:
    }
    Switch_7_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=58737,650,x");
            switch_id = "Switch_7_1_1_i0";
            depth = 3;
            sub_tree_id = 468;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_7_1_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=59050,850,x");
            address = 472;
        gates:
    }
    Server_7_1_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=59175,850,x");
            address = 473;
        gates:
    }
    Server_7_1_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=59300,850,x");
            address = 474;
        gates:
    }
    Server_7_1_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=59425,850,x");
            address = 475;
        gates:
    }
    Switch_7_1_2_i0 : EthSwitch
    {
        parameters:
            @display("p=59237,650,x");
            switch_id = "Switch_7_1_2_i0";
            depth = 3;
            sub_tree_id = 472;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_7_1_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=59550,850,x");
            address = 476;
        gates:
    }
    Server_7_1_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=59675,850,x");
            address = 477;
        gates:
    }
    Server_7_1_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=59800,850,x");
            address = 478;
        gates:
    }
    Server_7_1_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=59925,850,x");
            address = 479;
        gates:
    }
    Switch_7_1_3_i0 : EthSwitch
    {
        parameters:
            @display("p=59737,650,x");
            switch_id = "Switch_7_1_3_i0";
            depth = 3;
            sub_tree_id = 476;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_1_i0 : EthSwitch
    {
        parameters:
            @display("p=58425,450,x");
            switch_id = "Switch_7_1_i0";
            depth = 2;
            sub_tree_id = 464;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_1_i1 : EthSwitch
    {
        parameters:
            @display("p=58800,450,x");
            switch_id = "Switch_7_1_i1";
            depth = 2;
            sub_tree_id = 464;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_1_i2 : EthSwitch
    {
        parameters:
            @display("p=59175,450,x");
            switch_id = "Switch_7_1_i2";
            depth = 2;
            sub_tree_id = 464;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_1_i3 : EthSwitch
    {
        parameters:
            @display("p=59550,450,x");
            switch_id = "Switch_7_1_i3";
            depth = 2;
            sub_tree_id = 464;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_7_2_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=60050,850,x");
            address = 480;
        gates:
    }
    Server_7_2_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=60175,850,x");
            address = 481;
        gates:
    }
    Server_7_2_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=60300,850,x");
            address = 482;
        gates:
    }
    Server_7_2_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=60425,850,x");
            address = 483;
        gates:
    }
    Switch_7_2_0_i0 : EthSwitch
    {
        parameters:
            @display("p=60237,650,x");
            switch_id = "Switch_7_2_0_i0";
            depth = 3;
            sub_tree_id = 480;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_7_2_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=60550,850,x");
            address = 484;
        gates:
    }
    Server_7_2_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=60675,850,x");
            address = 485;
        gates:
    }
    Server_7_2_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=60800,850,x");
            address = 486;
        gates:
    }
    Server_7_2_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=60925,850,x");
            address = 487;
        gates:
    }
    Switch_7_2_1_i0 : EthSwitch
    {
        parameters:
            @display("p=60737,650,x");
            switch_id = "Switch_7_2_1_i0";
            depth = 3;
            sub_tree_id = 484;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_7_2_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=61050,850,x");
            address = 488;
        gates:
    }
    Server_7_2_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=61175,850,x");
            address = 489;
        gates:
    }
    Server_7_2_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=61300,850,x");
            address = 490;
        gates:
    }
    Server_7_2_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=61425,850,x");
            address = 491;
        gates:
    }
    Switch_7_2_2_i0 : EthSwitch
    {
        parameters:
            @display("p=61237,650,x");
            switch_id = "Switch_7_2_2_i0";
            depth = 3;
            sub_tree_id = 488;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_7_2_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=61550,850,x");
            address = 492;
        gates:
    }
    Server_7_2_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=61675,850,x");
            address = 493;
        gates:
    }
    Server_7_2_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=61800,850,x");
            address = 494;
        gates:
    }
    Server_7_2_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=61925,850,x");
            address = 495;
        gates:
    }
    Switch_7_2_3_i0 : EthSwitch
    {
        parameters:
            @display("p=61737,650,x");
            switch_id = "Switch_7_2_3_i0";
            depth = 3;
            sub_tree_id = 492;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_2_i0 : EthSwitch
    {
        parameters:
            @display("p=60425,450,x");
            switch_id = "Switch_7_2_i0";
            depth = 2;
            sub_tree_id = 480;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_2_i1 : EthSwitch
    {
        parameters:
            @display("p=60800,450,x");
            switch_id = "Switch_7_2_i1";
            depth = 2;
            sub_tree_id = 480;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_2_i2 : EthSwitch
    {
        parameters:
            @display("p=61175,450,x");
            switch_id = "Switch_7_2_i2";
            depth = 2;
            sub_tree_id = 480;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_2_i3 : EthSwitch
    {
        parameters:
            @display("p=61550,450,x");
            switch_id = "Switch_7_2_i3";
            depth = 2;
            sub_tree_id = 480;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_7_3_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=62050,850,x");
            address = 496;
        gates:
    }
    Server_7_3_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=62175,850,x");
            address = 497;
        gates:
    }
    Server_7_3_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=62300,850,x");
            address = 498;
        gates:
    }
    Server_7_3_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=62425,850,x");
            address = 499;
        gates:
    }
    Switch_7_3_0_i0 : EthSwitch
    {
        parameters:
            @display("p=62237,650,x");
            switch_id = "Switch_7_3_0_i0";
            depth = 3;
            sub_tree_id = 496;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_7_3_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=62550,850,x");
            address = 500;
        gates:
    }
    Server_7_3_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=62675,850,x");
            address = 501;
        gates:
    }
    Server_7_3_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=62800,850,x");
            address = 502;
        gates:
    }
    Server_7_3_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=62925,850,x");
            address = 503;
        gates:
    }
    Switch_7_3_1_i0 : EthSwitch
    {
        parameters:
            @display("p=62737,650,x");
            switch_id = "Switch_7_3_1_i0";
            depth = 3;
            sub_tree_id = 500;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_7_3_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=63050,850,x");
            address = 504;
        gates:
    }
    Server_7_3_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=63175,850,x");
            address = 505;
        gates:
    }
    Server_7_3_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=63300,850,x");
            address = 506;
        gates:
    }
    Server_7_3_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=63425,850,x");
            address = 507;
        gates:
    }
    Switch_7_3_2_i0 : EthSwitch
    {
        parameters:
            @display("p=63237,650,x");
            switch_id = "Switch_7_3_2_i0";
            depth = 3;
            sub_tree_id = 504;
        gates:
            down_port[4];
            up_port[4];
    }
    Server_7_3_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=63550,850,x");
            address = 508;
        gates:
    }
    Server_7_3_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=63675,850,x");
            address = 509;
        gates:
    }
    Server_7_3_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=63800,850,x");
            address = 510;
        gates:
    }
    Server_7_3_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=63925,850,x");
            address = 511;
        gates:
    }
    Switch_7_3_3_i0 : EthSwitch
    {
        parameters:
            @display("p=63737,650,x");
            switch_id = "Switch_7_3_3_i0";
            depth = 3;
            sub_tree_id = 508;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_3_i0 : EthSwitch
    {
        parameters:
            @display("p=62425,450,x");
            switch_id = "Switch_7_3_i0";
            depth = 2;
            sub_tree_id = 496;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_3_i1 : EthSwitch
    {
        parameters:
            @display("p=62800,450,x");
            switch_id = "Switch_7_3_i1";
            depth = 2;
            sub_tree_id = 496;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_3_i2 : EthSwitch
    {
        parameters:
            @display("p=63175,450,x");
            switch_id = "Switch_7_3_i2";
            depth = 2;
            sub_tree_id = 496;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_3_i3 : EthSwitch
    {
        parameters:
            @display("p=63550,450,x");
            switch_id = "Switch_7_3_i3";
            depth = 2;
            sub_tree_id = 496;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_i0 : EthSwitch
    {
        parameters:
            @display("p=56513,250,x");
            switch_id = "Switch_7_i0";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_i1 : EthSwitch
    {
        parameters:
            @display("p=56976,250,x");
            switch_id = "Switch_7_i1";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_i2 : EthSwitch
    {
        parameters:
            @display("p=57439,250,x");
            switch_id = "Switch_7_i2";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_i3 : EthSwitch
    {
        parameters:
            @display("p=57902,250,x");
            switch_id = "Switch_7_i3";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_i4 : EthSwitch
    {
        parameters:
            @display("p=58365,250,x");
            switch_id = "Switch_7_i4";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_i5 : EthSwitch
    {
        parameters:
            @display("p=58828,250,x");
            switch_id = "Switch_7_i5";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_i6 : EthSwitch
    {
        parameters:
            @display("p=59291,250,x");
            switch_id = "Switch_7_i6";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_i7 : EthSwitch
    {
        parameters:
            @display("p=59754,250,x");
            switch_id = "Switch_7_i7";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_i8 : EthSwitch
    {
        parameters:
            @display("p=60217,250,x");
            switch_id = "Switch_7_i8";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_i9 : EthSwitch
    {
        parameters:
            @display("p=60680,250,x");
            switch_id = "Switch_7_i9";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_i10 : EthSwitch
    {
        parameters:
            @display("p=61143,250,x");
            switch_id = "Switch_7_i10";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_i11 : EthSwitch
    {
        parameters:
            @display("p=61606,250,x");
            switch_id = "Switch_7_i11";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_i12 : EthSwitch
    {
        parameters:
            @display("p=62069,250,x");
            switch_id = "Switch_7_i12";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_i13 : EthSwitch
    {
        parameters:
            @display("p=62532,250,x");
            switch_id = "Switch_7_i13";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_i14 : EthSwitch
    {
        parameters:
            @display("p=62995,250,x");
            switch_id = "Switch_7_i14";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_7_i15 : EthSwitch
    {
        parameters:
            @display("p=63458,250,x");
            switch_id = "Switch_7_i15";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[4];
            up_port[4];
    }
    Switch_i0 : EthSwitch
    {
        parameters:
            @display("p=1032,50,x");
            switch_id = "Switch_i0";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i1 : EthSwitch
    {
        parameters:
            @display("p=2014,50,x");
            switch_id = "Switch_i1";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i2 : EthSwitch
    {
        parameters:
            @display("p=2996,50,x");
            switch_id = "Switch_i2";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i3 : EthSwitch
    {
        parameters:
            @display("p=3978,50,x");
            switch_id = "Switch_i3";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i4 : EthSwitch
    {
        parameters:
            @display("p=4960,50,x");
            switch_id = "Switch_i4";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i5 : EthSwitch
    {
        parameters:
            @display("p=5942,50,x");
            switch_id = "Switch_i5";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i6 : EthSwitch
    {
        parameters:
            @display("p=6924,50,x");
            switch_id = "Switch_i6";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i7 : EthSwitch
    {
        parameters:
            @display("p=7906,50,x");
            switch_id = "Switch_i7";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i8 : EthSwitch
    {
        parameters:
            @display("p=8888,50,x");
            switch_id = "Switch_i8";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i9 : EthSwitch
    {
        parameters:
            @display("p=9870,50,x");
            switch_id = "Switch_i9";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i10 : EthSwitch
    {
        parameters:
            @display("p=10852,50,x");
            switch_id = "Switch_i10";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i11 : EthSwitch
    {
        parameters:
            @display("p=11834,50,x");
            switch_id = "Switch_i11";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i12 : EthSwitch
    {
        parameters:
            @display("p=12816,50,x");
            switch_id = "Switch_i12";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i13 : EthSwitch
    {
        parameters:
            @display("p=13798,50,x");
            switch_id = "Switch_i13";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i14 : EthSwitch
    {
        parameters:
            @display("p=14780,50,x");
            switch_id = "Switch_i14";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i15 : EthSwitch
    {
        parameters:
            @display("p=15762,50,x");
            switch_id = "Switch_i15";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i16 : EthSwitch
    {
        parameters:
            @display("p=16744,50,x");
            switch_id = "Switch_i16";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i17 : EthSwitch
    {
        parameters:
            @display("p=17726,50,x");
            switch_id = "Switch_i17";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i18 : EthSwitch
    {
        parameters:
            @display("p=18708,50,x");
            switch_id = "Switch_i18";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i19 : EthSwitch
    {
        parameters:
            @display("p=19690,50,x");
            switch_id = "Switch_i19";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i20 : EthSwitch
    {
        parameters:
            @display("p=20672,50,x");
            switch_id = "Switch_i20";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i21 : EthSwitch
    {
        parameters:
            @display("p=21654,50,x");
            switch_id = "Switch_i21";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i22 : EthSwitch
    {
        parameters:
            @display("p=22636,50,x");
            switch_id = "Switch_i22";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i23 : EthSwitch
    {
        parameters:
            @display("p=23618,50,x");
            switch_id = "Switch_i23";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i24 : EthSwitch
    {
        parameters:
            @display("p=24600,50,x");
            switch_id = "Switch_i24";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i25 : EthSwitch
    {
        parameters:
            @display("p=25582,50,x");
            switch_id = "Switch_i25";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i26 : EthSwitch
    {
        parameters:
            @display("p=26564,50,x");
            switch_id = "Switch_i26";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i27 : EthSwitch
    {
        parameters:
            @display("p=27546,50,x");
            switch_id = "Switch_i27";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i28 : EthSwitch
    {
        parameters:
            @display("p=28528,50,x");
            switch_id = "Switch_i28";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i29 : EthSwitch
    {
        parameters:
            @display("p=29510,50,x");
            switch_id = "Switch_i29";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i30 : EthSwitch
    {
        parameters:
            @display("p=30492,50,x");
            switch_id = "Switch_i30";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i31 : EthSwitch
    {
        parameters:
            @display("p=31474,50,x");
            switch_id = "Switch_i31";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i32 : EthSwitch
    {
        parameters:
            @display("p=32456,50,x");
            switch_id = "Switch_i32";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i33 : EthSwitch
    {
        parameters:
            @display("p=33438,50,x");
            switch_id = "Switch_i33";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i34 : EthSwitch
    {
        parameters:
            @display("p=34420,50,x");
            switch_id = "Switch_i34";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i35 : EthSwitch
    {
        parameters:
            @display("p=35402,50,x");
            switch_id = "Switch_i35";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i36 : EthSwitch
    {
        parameters:
            @display("p=36384,50,x");
            switch_id = "Switch_i36";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i37 : EthSwitch
    {
        parameters:
            @display("p=37366,50,x");
            switch_id = "Switch_i37";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i38 : EthSwitch
    {
        parameters:
            @display("p=38348,50,x");
            switch_id = "Switch_i38";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i39 : EthSwitch
    {
        parameters:
            @display("p=39330,50,x");
            switch_id = "Switch_i39";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i40 : EthSwitch
    {
        parameters:
            @display("p=40312,50,x");
            switch_id = "Switch_i40";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i41 : EthSwitch
    {
        parameters:
            @display("p=41294,50,x");
            switch_id = "Switch_i41";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i42 : EthSwitch
    {
        parameters:
            @display("p=42276,50,x");
            switch_id = "Switch_i42";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i43 : EthSwitch
    {
        parameters:
            @display("p=43258,50,x");
            switch_id = "Switch_i43";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i44 : EthSwitch
    {
        parameters:
            @display("p=44240,50,x");
            switch_id = "Switch_i44";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i45 : EthSwitch
    {
        parameters:
            @display("p=45222,50,x");
            switch_id = "Switch_i45";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i46 : EthSwitch
    {
        parameters:
            @display("p=46204,50,x");
            switch_id = "Switch_i46";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i47 : EthSwitch
    {
        parameters:
            @display("p=47186,50,x");
            switch_id = "Switch_i47";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i48 : EthSwitch
    {
        parameters:
            @display("p=48168,50,x");
            switch_id = "Switch_i48";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i49 : EthSwitch
    {
        parameters:
            @display("p=49150,50,x");
            switch_id = "Switch_i49";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i50 : EthSwitch
    {
        parameters:
            @display("p=50132,50,x");
            switch_id = "Switch_i50";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i51 : EthSwitch
    {
        parameters:
            @display("p=51114,50,x");
            switch_id = "Switch_i51";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i52 : EthSwitch
    {
        parameters:
            @display("p=52096,50,x");
            switch_id = "Switch_i52";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i53 : EthSwitch
    {
        parameters:
            @display("p=53078,50,x");
            switch_id = "Switch_i53";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i54 : EthSwitch
    {
        parameters:
            @display("p=54060,50,x");
            switch_id = "Switch_i54";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i55 : EthSwitch
    {
        parameters:
            @display("p=55042,50,x");
            switch_id = "Switch_i55";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i56 : EthSwitch
    {
        parameters:
            @display("p=56024,50,x");
            switch_id = "Switch_i56";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i57 : EthSwitch
    {
        parameters:
            @display("p=57006,50,x");
            switch_id = "Switch_i57";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i58 : EthSwitch
    {
        parameters:
            @display("p=57988,50,x");
            switch_id = "Switch_i58";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i59 : EthSwitch
    {
        parameters:
            @display("p=58970,50,x");
            switch_id = "Switch_i59";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i60 : EthSwitch
    {
        parameters:
            @display("p=59952,50,x");
            switch_id = "Switch_i60";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i61 : EthSwitch
    {
        parameters:
            @display("p=60934,50,x");
            switch_id = "Switch_i61";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i62 : EthSwitch
    {
        parameters:
            @display("p=61916,50,x");
            switch_id = "Switch_i62";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }
    Switch_i63 : EthSwitch
    {
        parameters:
            @display("p=62898,50,x");
            switch_id = "Switch_i63";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[0];
    }

    connections:
     Switch_0_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_0_0_0_0.port;
     Switch_0_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_0_0_0_1.port;
     Switch_0_0_0_i0.down_port[2] <--> Link_1Gbps <--> Server_0_0_0_2.port;
     Switch_0_0_0_i0.down_port[3] <--> Link_1Gbps <--> Server_0_0_0_3.port;
     Switch_0_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_0_0_1_0.port;
     Switch_0_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_0_0_1_1.port;
     Switch_0_0_1_i0.down_port[2] <--> Link_1Gbps <--> Server_0_0_1_2.port;
     Switch_0_0_1_i0.down_port[3] <--> Link_1Gbps <--> Server_0_0_1_3.port;
     Switch_0_0_2_i0.down_port[0] <--> Link_1Gbps <--> Server_0_0_2_0.port;
     Switch_0_0_2_i0.down_port[1] <--> Link_1Gbps <--> Server_0_0_2_1.port;
     Switch_0_0_2_i0.down_port[2] <--> Link_1Gbps <--> Server_0_0_2_2.port;
     Switch_0_0_2_i0.down_port[3] <--> Link_1Gbps <--> Server_0_0_2_3.port;
     Switch_0_0_3_i0.down_port[0] <--> Link_1Gbps <--> Server_0_0_3_0.port;
     Switch_0_0_3_i0.down_port[1] <--> Link_1Gbps <--> Server_0_0_3_1.port;
     Switch_0_0_3_i0.down_port[2] <--> Link_1Gbps <--> Server_0_0_3_2.port;
     Switch_0_0_3_i0.down_port[3] <--> Link_1Gbps <--> Server_0_0_3_3.port;
     Switch_0_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_0_0_i0.up_port[0];
     Switch_0_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_0_0_1_i0.up_port[0];
     Switch_0_0_i0.down_port[2] <--> Link_1Gbps <--> Switch_0_0_2_i0.up_port[0];
     Switch_0_0_i0.down_port[3] <--> Link_1Gbps <--> Switch_0_0_3_i0.up_port[0];
     Switch_0_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_0_0_i0.up_port[1];
     Switch_0_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_0_0_1_i0.up_port[1];
     Switch_0_0_i1.down_port[2] <--> Link_1Gbps <--> Switch_0_0_2_i0.up_port[1];
     Switch_0_0_i1.down_port[3] <--> Link_1Gbps <--> Switch_0_0_3_i0.up_port[1];
     Switch_0_0_i2.down_port[0] <--> Link_1Gbps <--> Switch_0_0_0_i0.up_port[2];
     Switch_0_0_i2.down_port[1] <--> Link_1Gbps <--> Switch_0_0_1_i0.up_port[2];
     Switch_0_0_i2.down_port[2] <--> Link_1Gbps <--> Switch_0_0_2_i0.up_port[2];
     Switch_0_0_i2.down_port[3] <--> Link_1Gbps <--> Switch_0_0_3_i0.up_port[2];
     Switch_0_0_i3.down_port[0] <--> Link_1Gbps <--> Switch_0_0_0_i0.up_port[3];
     Switch_0_0_i3.down_port[1] <--> Link_1Gbps <--> Switch_0_0_1_i0.up_port[3];
     Switch_0_0_i3.down_port[2] <--> Link_1Gbps <--> Switch_0_0_2_i0.up_port[3];
     Switch_0_0_i3.down_port[3] <--> Link_1Gbps <--> Switch_0_0_3_i0.up_port[3];
     Switch_0_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_0_1_0_0.port;
     Switch_0_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_0_1_0_1.port;
     Switch_0_1_0_i0.down_port[2] <--> Link_1Gbps <--> Server_0_1_0_2.port;
     Switch_0_1_0_i0.down_port[3] <--> Link_1Gbps <--> Server_0_1_0_3.port;
     Switch_0_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_0_1_1_0.port;
     Switch_0_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_0_1_1_1.port;
     Switch_0_1_1_i0.down_port[2] <--> Link_1Gbps <--> Server_0_1_1_2.port;
     Switch_0_1_1_i0.down_port[3] <--> Link_1Gbps <--> Server_0_1_1_3.port;
     Switch_0_1_2_i0.down_port[0] <--> Link_1Gbps <--> Server_0_1_2_0.port;
     Switch_0_1_2_i0.down_port[1] <--> Link_1Gbps <--> Server_0_1_2_1.port;
     Switch_0_1_2_i0.down_port[2] <--> Link_1Gbps <--> Server_0_1_2_2.port;
     Switch_0_1_2_i0.down_port[3] <--> Link_1Gbps <--> Server_0_1_2_3.port;
     Switch_0_1_3_i0.down_port[0] <--> Link_1Gbps <--> Server_0_1_3_0.port;
     Switch_0_1_3_i0.down_port[1] <--> Link_1Gbps <--> Server_0_1_3_1.port;
     Switch_0_1_3_i0.down_port[2] <--> Link_1Gbps <--> Server_0_1_3_2.port;
     Switch_0_1_3_i0.down_port[3] <--> Link_1Gbps <--> Server_0_1_3_3.port;
     Switch_0_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_1_0_i0.up_port[0];
     Switch_0_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_0_1_1_i0.up_port[0];
     Switch_0_1_i0.down_port[2] <--> Link_1Gbps <--> Switch_0_1_2_i0.up_port[0];
     Switch_0_1_i0.down_port[3] <--> Link_1Gbps <--> Switch_0_1_3_i0.up_port[0];
     Switch_0_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_1_0_i0.up_port[1];
     Switch_0_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_0_1_1_i0.up_port[1];
     Switch_0_1_i1.down_port[2] <--> Link_1Gbps <--> Switch_0_1_2_i0.up_port[1];
     Switch_0_1_i1.down_port[3] <--> Link_1Gbps <--> Switch_0_1_3_i0.up_port[1];
     Switch_0_1_i2.down_port[0] <--> Link_1Gbps <--> Switch_0_1_0_i0.up_port[2];
     Switch_0_1_i2.down_port[1] <--> Link_1Gbps <--> Switch_0_1_1_i0.up_port[2];
     Switch_0_1_i2.down_port[2] <--> Link_1Gbps <--> Switch_0_1_2_i0.up_port[2];
     Switch_0_1_i2.down_port[3] <--> Link_1Gbps <--> Switch_0_1_3_i0.up_port[2];
     Switch_0_1_i3.down_port[0] <--> Link_1Gbps <--> Switch_0_1_0_i0.up_port[3];
     Switch_0_1_i3.down_port[1] <--> Link_1Gbps <--> Switch_0_1_1_i0.up_port[3];
     Switch_0_1_i3.down_port[2] <--> Link_1Gbps <--> Switch_0_1_2_i0.up_port[3];
     Switch_0_1_i3.down_port[3] <--> Link_1Gbps <--> Switch_0_1_3_i0.up_port[3];
     Switch_0_2_0_i0.down_port[0] <--> Link_1Gbps <--> Server_0_2_0_0.port;
     Switch_0_2_0_i0.down_port[1] <--> Link_1Gbps <--> Server_0_2_0_1.port;
     Switch_0_2_0_i0.down_port[2] <--> Link_1Gbps <--> Server_0_2_0_2.port;
     Switch_0_2_0_i0.down_port[3] <--> Link_1Gbps <--> Server_0_2_0_3.port;
     Switch_0_2_1_i0.down_port[0] <--> Link_1Gbps <--> Server_0_2_1_0.port;
     Switch_0_2_1_i0.down_port[1] <--> Link_1Gbps <--> Server_0_2_1_1.port;
     Switch_0_2_1_i0.down_port[2] <--> Link_1Gbps <--> Server_0_2_1_2.port;
     Switch_0_2_1_i0.down_port[3] <--> Link_1Gbps <--> Server_0_2_1_3.port;
     Switch_0_2_2_i0.down_port[0] <--> Link_1Gbps <--> Server_0_2_2_0.port;
     Switch_0_2_2_i0.down_port[1] <--> Link_1Gbps <--> Server_0_2_2_1.port;
     Switch_0_2_2_i0.down_port[2] <--> Link_1Gbps <--> Server_0_2_2_2.port;
     Switch_0_2_2_i0.down_port[3] <--> Link_1Gbps <--> Server_0_2_2_3.port;
     Switch_0_2_3_i0.down_port[0] <--> Link_1Gbps <--> Server_0_2_3_0.port;
     Switch_0_2_3_i0.down_port[1] <--> Link_1Gbps <--> Server_0_2_3_1.port;
     Switch_0_2_3_i0.down_port[2] <--> Link_1Gbps <--> Server_0_2_3_2.port;
     Switch_0_2_3_i0.down_port[3] <--> Link_1Gbps <--> Server_0_2_3_3.port;
     Switch_0_2_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_2_0_i0.up_port[0];
     Switch_0_2_i0.down_port[1] <--> Link_1Gbps <--> Switch_0_2_1_i0.up_port[0];
     Switch_0_2_i0.down_port[2] <--> Link_1Gbps <--> Switch_0_2_2_i0.up_port[0];
     Switch_0_2_i0.down_port[3] <--> Link_1Gbps <--> Switch_0_2_3_i0.up_port[0];
     Switch_0_2_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_2_0_i0.up_port[1];
     Switch_0_2_i1.down_port[1] <--> Link_1Gbps <--> Switch_0_2_1_i0.up_port[1];
     Switch_0_2_i1.down_port[2] <--> Link_1Gbps <--> Switch_0_2_2_i0.up_port[1];
     Switch_0_2_i1.down_port[3] <--> Link_1Gbps <--> Switch_0_2_3_i0.up_port[1];
     Switch_0_2_i2.down_port[0] <--> Link_1Gbps <--> Switch_0_2_0_i0.up_port[2];
     Switch_0_2_i2.down_port[1] <--> Link_1Gbps <--> Switch_0_2_1_i0.up_port[2];
     Switch_0_2_i2.down_port[2] <--> Link_1Gbps <--> Switch_0_2_2_i0.up_port[2];
     Switch_0_2_i2.down_port[3] <--> Link_1Gbps <--> Switch_0_2_3_i0.up_port[2];
     Switch_0_2_i3.down_port[0] <--> Link_1Gbps <--> Switch_0_2_0_i0.up_port[3];
     Switch_0_2_i3.down_port[1] <--> Link_1Gbps <--> Switch_0_2_1_i0.up_port[3];
     Switch_0_2_i3.down_port[2] <--> Link_1Gbps <--> Switch_0_2_2_i0.up_port[3];
     Switch_0_2_i3.down_port[3] <--> Link_1Gbps <--> Switch_0_2_3_i0.up_port[3];
     Switch_0_3_0_i0.down_port[0] <--> Link_1Gbps <--> Server_0_3_0_0.port;
     Switch_0_3_0_i0.down_port[1] <--> Link_1Gbps <--> Server_0_3_0_1.port;
     Switch_0_3_0_i0.down_port[2] <--> Link_1Gbps <--> Server_0_3_0_2.port;
     Switch_0_3_0_i0.down_port[3] <--> Link_1Gbps <--> Server_0_3_0_3.port;
     Switch_0_3_1_i0.down_port[0] <--> Link_1Gbps <--> Server_0_3_1_0.port;
     Switch_0_3_1_i0.down_port[1] <--> Link_1Gbps <--> Server_0_3_1_1.port;
     Switch_0_3_1_i0.down_port[2] <--> Link_1Gbps <--> Server_0_3_1_2.port;
     Switch_0_3_1_i0.down_port[3] <--> Link_1Gbps <--> Server_0_3_1_3.port;
     Switch_0_3_2_i0.down_port[0] <--> Link_1Gbps <--> Server_0_3_2_0.port;
     Switch_0_3_2_i0.down_port[1] <--> Link_1Gbps <--> Server_0_3_2_1.port;
     Switch_0_3_2_i0.down_port[2] <--> Link_1Gbps <--> Server_0_3_2_2.port;
     Switch_0_3_2_i0.down_port[3] <--> Link_1Gbps <--> Server_0_3_2_3.port;
     Switch_0_3_3_i0.down_port[0] <--> Link_1Gbps <--> Server_0_3_3_0.port;
     Switch_0_3_3_i0.down_port[1] <--> Link_1Gbps <--> Server_0_3_3_1.port;
     Switch_0_3_3_i0.down_port[2] <--> Link_1Gbps <--> Server_0_3_3_2.port;
     Switch_0_3_3_i0.down_port[3] <--> Link_1Gbps <--> Server_0_3_3_3.port;
     Switch_0_3_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_3_0_i0.up_port[0];
     Switch_0_3_i0.down_port[1] <--> Link_1Gbps <--> Switch_0_3_1_i0.up_port[0];
     Switch_0_3_i0.down_port[2] <--> Link_1Gbps <--> Switch_0_3_2_i0.up_port[0];
     Switch_0_3_i0.down_port[3] <--> Link_1Gbps <--> Switch_0_3_3_i0.up_port[0];
     Switch_0_3_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_3_0_i0.up_port[1];
     Switch_0_3_i1.down_port[1] <--> Link_1Gbps <--> Switch_0_3_1_i0.up_port[1];
     Switch_0_3_i1.down_port[2] <--> Link_1Gbps <--> Switch_0_3_2_i0.up_port[1];
     Switch_0_3_i1.down_port[3] <--> Link_1Gbps <--> Switch_0_3_3_i0.up_port[1];
     Switch_0_3_i2.down_port[0] <--> Link_1Gbps <--> Switch_0_3_0_i0.up_port[2];
     Switch_0_3_i2.down_port[1] <--> Link_1Gbps <--> Switch_0_3_1_i0.up_port[2];
     Switch_0_3_i2.down_port[2] <--> Link_1Gbps <--> Switch_0_3_2_i0.up_port[2];
     Switch_0_3_i2.down_port[3] <--> Link_1Gbps <--> Switch_0_3_3_i0.up_port[2];
     Switch_0_3_i3.down_port[0] <--> Link_1Gbps <--> Switch_0_3_0_i0.up_port[3];
     Switch_0_3_i3.down_port[1] <--> Link_1Gbps <--> Switch_0_3_1_i0.up_port[3];
     Switch_0_3_i3.down_port[2] <--> Link_1Gbps <--> Switch_0_3_2_i0.up_port[3];
     Switch_0_3_i3.down_port[3] <--> Link_1Gbps <--> Switch_0_3_3_i0.up_port[3];
     Switch_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i0.up_port[0];
     Switch_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i0.up_port[0];
     Switch_0_i0.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i0.up_port[0];
     Switch_0_i0.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i0.up_port[0];
     Switch_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i0.up_port[1];
     Switch_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i0.up_port[1];
     Switch_0_i1.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i0.up_port[1];
     Switch_0_i1.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i0.up_port[1];
     Switch_0_i2.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i0.up_port[2];
     Switch_0_i2.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i0.up_port[2];
     Switch_0_i2.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i0.up_port[2];
     Switch_0_i2.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i0.up_port[2];
     Switch_0_i3.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i0.up_port[3];
     Switch_0_i3.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i0.up_port[3];
     Switch_0_i3.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i0.up_port[3];
     Switch_0_i3.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i0.up_port[3];
     Switch_0_i4.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i1.up_port[0];
     Switch_0_i4.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i1.up_port[0];
     Switch_0_i4.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i1.up_port[0];
     Switch_0_i4.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i1.up_port[0];
     Switch_0_i5.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i1.up_port[1];
     Switch_0_i5.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i1.up_port[1];
     Switch_0_i5.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i1.up_port[1];
     Switch_0_i5.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i1.up_port[1];
     Switch_0_i6.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i1.up_port[2];
     Switch_0_i6.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i1.up_port[2];
     Switch_0_i6.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i1.up_port[2];
     Switch_0_i6.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i1.up_port[2];
     Switch_0_i7.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i1.up_port[3];
     Switch_0_i7.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i1.up_port[3];
     Switch_0_i7.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i1.up_port[3];
     Switch_0_i7.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i1.up_port[3];
     Switch_0_i8.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i2.up_port[0];
     Switch_0_i8.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i2.up_port[0];
     Switch_0_i8.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i2.up_port[0];
     Switch_0_i8.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i2.up_port[0];
     Switch_0_i9.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i2.up_port[1];
     Switch_0_i9.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i2.up_port[1];
     Switch_0_i9.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i2.up_port[1];
     Switch_0_i9.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i2.up_port[1];
     Switch_0_i10.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i2.up_port[2];
     Switch_0_i10.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i2.up_port[2];
     Switch_0_i10.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i2.up_port[2];
     Switch_0_i10.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i2.up_port[2];
     Switch_0_i11.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i2.up_port[3];
     Switch_0_i11.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i2.up_port[3];
     Switch_0_i11.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i2.up_port[3];
     Switch_0_i11.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i2.up_port[3];
     Switch_0_i12.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i3.up_port[0];
     Switch_0_i12.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i3.up_port[0];
     Switch_0_i12.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i3.up_port[0];
     Switch_0_i12.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i3.up_port[0];
     Switch_0_i13.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i3.up_port[1];
     Switch_0_i13.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i3.up_port[1];
     Switch_0_i13.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i3.up_port[1];
     Switch_0_i13.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i3.up_port[1];
     Switch_0_i14.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i3.up_port[2];
     Switch_0_i14.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i3.up_port[2];
     Switch_0_i14.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i3.up_port[2];
     Switch_0_i14.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i3.up_port[2];
     Switch_0_i15.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i3.up_port[3];
     Switch_0_i15.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i3.up_port[3];
     Switch_0_i15.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i3.up_port[3];
     Switch_0_i15.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i3.up_port[3];
     Switch_1_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_1_0_0_0.port;
     Switch_1_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_1_0_0_1.port;
     Switch_1_0_0_i0.down_port[2] <--> Link_1Gbps <--> Server_1_0_0_2.port;
     Switch_1_0_0_i0.down_port[3] <--> Link_1Gbps <--> Server_1_0_0_3.port;
     Switch_1_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_1_0_1_0.port;
     Switch_1_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_1_0_1_1.port;
     Switch_1_0_1_i0.down_port[2] <--> Link_1Gbps <--> Server_1_0_1_2.port;
     Switch_1_0_1_i0.down_port[3] <--> Link_1Gbps <--> Server_1_0_1_3.port;
     Switch_1_0_2_i0.down_port[0] <--> Link_1Gbps <--> Server_1_0_2_0.port;
     Switch_1_0_2_i0.down_port[1] <--> Link_1Gbps <--> Server_1_0_2_1.port;
     Switch_1_0_2_i0.down_port[2] <--> Link_1Gbps <--> Server_1_0_2_2.port;
     Switch_1_0_2_i0.down_port[3] <--> Link_1Gbps <--> Server_1_0_2_3.port;
     Switch_1_0_3_i0.down_port[0] <--> Link_1Gbps <--> Server_1_0_3_0.port;
     Switch_1_0_3_i0.down_port[1] <--> Link_1Gbps <--> Server_1_0_3_1.port;
     Switch_1_0_3_i0.down_port[2] <--> Link_1Gbps <--> Server_1_0_3_2.port;
     Switch_1_0_3_i0.down_port[3] <--> Link_1Gbps <--> Server_1_0_3_3.port;
     Switch_1_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_1_0_0_i0.up_port[0];
     Switch_1_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_0_1_i0.up_port[0];
     Switch_1_0_i0.down_port[2] <--> Link_1Gbps <--> Switch_1_0_2_i0.up_port[0];
     Switch_1_0_i0.down_port[3] <--> Link_1Gbps <--> Switch_1_0_3_i0.up_port[0];
     Switch_1_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_1_0_0_i0.up_port[1];
     Switch_1_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_0_1_i0.up_port[1];
     Switch_1_0_i1.down_port[2] <--> Link_1Gbps <--> Switch_1_0_2_i0.up_port[1];
     Switch_1_0_i1.down_port[3] <--> Link_1Gbps <--> Switch_1_0_3_i0.up_port[1];
     Switch_1_0_i2.down_port[0] <--> Link_1Gbps <--> Switch_1_0_0_i0.up_port[2];
     Switch_1_0_i2.down_port[1] <--> Link_1Gbps <--> Switch_1_0_1_i0.up_port[2];
     Switch_1_0_i2.down_port[2] <--> Link_1Gbps <--> Switch_1_0_2_i0.up_port[2];
     Switch_1_0_i2.down_port[3] <--> Link_1Gbps <--> Switch_1_0_3_i0.up_port[2];
     Switch_1_0_i3.down_port[0] <--> Link_1Gbps <--> Switch_1_0_0_i0.up_port[3];
     Switch_1_0_i3.down_port[1] <--> Link_1Gbps <--> Switch_1_0_1_i0.up_port[3];
     Switch_1_0_i3.down_port[2] <--> Link_1Gbps <--> Switch_1_0_2_i0.up_port[3];
     Switch_1_0_i3.down_port[3] <--> Link_1Gbps <--> Switch_1_0_3_i0.up_port[3];
     Switch_1_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_1_1_0_0.port;
     Switch_1_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_1_1_0_1.port;
     Switch_1_1_0_i0.down_port[2] <--> Link_1Gbps <--> Server_1_1_0_2.port;
     Switch_1_1_0_i0.down_port[3] <--> Link_1Gbps <--> Server_1_1_0_3.port;
     Switch_1_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_1_1_1_0.port;
     Switch_1_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_1_1_1_1.port;
     Switch_1_1_1_i0.down_port[2] <--> Link_1Gbps <--> Server_1_1_1_2.port;
     Switch_1_1_1_i0.down_port[3] <--> Link_1Gbps <--> Server_1_1_1_3.port;
     Switch_1_1_2_i0.down_port[0] <--> Link_1Gbps <--> Server_1_1_2_0.port;
     Switch_1_1_2_i0.down_port[1] <--> Link_1Gbps <--> Server_1_1_2_1.port;
     Switch_1_1_2_i0.down_port[2] <--> Link_1Gbps <--> Server_1_1_2_2.port;
     Switch_1_1_2_i0.down_port[3] <--> Link_1Gbps <--> Server_1_1_2_3.port;
     Switch_1_1_3_i0.down_port[0] <--> Link_1Gbps <--> Server_1_1_3_0.port;
     Switch_1_1_3_i0.down_port[1] <--> Link_1Gbps <--> Server_1_1_3_1.port;
     Switch_1_1_3_i0.down_port[2] <--> Link_1Gbps <--> Server_1_1_3_2.port;
     Switch_1_1_3_i0.down_port[3] <--> Link_1Gbps <--> Server_1_1_3_3.port;
     Switch_1_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_1_1_0_i0.up_port[0];
     Switch_1_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_1_1_i0.up_port[0];
     Switch_1_1_i0.down_port[2] <--> Link_1Gbps <--> Switch_1_1_2_i0.up_port[0];
     Switch_1_1_i0.down_port[3] <--> Link_1Gbps <--> Switch_1_1_3_i0.up_port[0];
     Switch_1_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_1_1_0_i0.up_port[1];
     Switch_1_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_1_1_i0.up_port[1];
     Switch_1_1_i1.down_port[2] <--> Link_1Gbps <--> Switch_1_1_2_i0.up_port[1];
     Switch_1_1_i1.down_port[3] <--> Link_1Gbps <--> Switch_1_1_3_i0.up_port[1];
     Switch_1_1_i2.down_port[0] <--> Link_1Gbps <--> Switch_1_1_0_i0.up_port[2];
     Switch_1_1_i2.down_port[1] <--> Link_1Gbps <--> Switch_1_1_1_i0.up_port[2];
     Switch_1_1_i2.down_port[2] <--> Link_1Gbps <--> Switch_1_1_2_i0.up_port[2];
     Switch_1_1_i2.down_port[3] <--> Link_1Gbps <--> Switch_1_1_3_i0.up_port[2];
     Switch_1_1_i3.down_port[0] <--> Link_1Gbps <--> Switch_1_1_0_i0.up_port[3];
     Switch_1_1_i3.down_port[1] <--> Link_1Gbps <--> Switch_1_1_1_i0.up_port[3];
     Switch_1_1_i3.down_port[2] <--> Link_1Gbps <--> Switch_1_1_2_i0.up_port[3];
     Switch_1_1_i3.down_port[3] <--> Link_1Gbps <--> Switch_1_1_3_i0.up_port[3];
     Switch_1_2_0_i0.down_port[0] <--> Link_1Gbps <--> Server_1_2_0_0.port;
     Switch_1_2_0_i0.down_port[1] <--> Link_1Gbps <--> Server_1_2_0_1.port;
     Switch_1_2_0_i0.down_port[2] <--> Link_1Gbps <--> Server_1_2_0_2.port;
     Switch_1_2_0_i0.down_port[3] <--> Link_1Gbps <--> Server_1_2_0_3.port;
     Switch_1_2_1_i0.down_port[0] <--> Link_1Gbps <--> Server_1_2_1_0.port;
     Switch_1_2_1_i0.down_port[1] <--> Link_1Gbps <--> Server_1_2_1_1.port;
     Switch_1_2_1_i0.down_port[2] <--> Link_1Gbps <--> Server_1_2_1_2.port;
     Switch_1_2_1_i0.down_port[3] <--> Link_1Gbps <--> Server_1_2_1_3.port;
     Switch_1_2_2_i0.down_port[0] <--> Link_1Gbps <--> Server_1_2_2_0.port;
     Switch_1_2_2_i0.down_port[1] <--> Link_1Gbps <--> Server_1_2_2_1.port;
     Switch_1_2_2_i0.down_port[2] <--> Link_1Gbps <--> Server_1_2_2_2.port;
     Switch_1_2_2_i0.down_port[3] <--> Link_1Gbps <--> Server_1_2_2_3.port;
     Switch_1_2_3_i0.down_port[0] <--> Link_1Gbps <--> Server_1_2_3_0.port;
     Switch_1_2_3_i0.down_port[1] <--> Link_1Gbps <--> Server_1_2_3_1.port;
     Switch_1_2_3_i0.down_port[2] <--> Link_1Gbps <--> Server_1_2_3_2.port;
     Switch_1_2_3_i0.down_port[3] <--> Link_1Gbps <--> Server_1_2_3_3.port;
     Switch_1_2_i0.down_port[0] <--> Link_1Gbps <--> Switch_1_2_0_i0.up_port[0];
     Switch_1_2_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_2_1_i0.up_port[0];
     Switch_1_2_i0.down_port[2] <--> Link_1Gbps <--> Switch_1_2_2_i0.up_port[0];
     Switch_1_2_i0.down_port[3] <--> Link_1Gbps <--> Switch_1_2_3_i0.up_port[0];
     Switch_1_2_i1.down_port[0] <--> Link_1Gbps <--> Switch_1_2_0_i0.up_port[1];
     Switch_1_2_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_2_1_i0.up_port[1];
     Switch_1_2_i1.down_port[2] <--> Link_1Gbps <--> Switch_1_2_2_i0.up_port[1];
     Switch_1_2_i1.down_port[3] <--> Link_1Gbps <--> Switch_1_2_3_i0.up_port[1];
     Switch_1_2_i2.down_port[0] <--> Link_1Gbps <--> Switch_1_2_0_i0.up_port[2];
     Switch_1_2_i2.down_port[1] <--> Link_1Gbps <--> Switch_1_2_1_i0.up_port[2];
     Switch_1_2_i2.down_port[2] <--> Link_1Gbps <--> Switch_1_2_2_i0.up_port[2];
     Switch_1_2_i2.down_port[3] <--> Link_1Gbps <--> Switch_1_2_3_i0.up_port[2];
     Switch_1_2_i3.down_port[0] <--> Link_1Gbps <--> Switch_1_2_0_i0.up_port[3];
     Switch_1_2_i3.down_port[1] <--> Link_1Gbps <--> Switch_1_2_1_i0.up_port[3];
     Switch_1_2_i3.down_port[2] <--> Link_1Gbps <--> Switch_1_2_2_i0.up_port[3];
     Switch_1_2_i3.down_port[3] <--> Link_1Gbps <--> Switch_1_2_3_i0.up_port[3];
     Switch_1_3_0_i0.down_port[0] <--> Link_1Gbps <--> Server_1_3_0_0.port;
     Switch_1_3_0_i0.down_port[1] <--> Link_1Gbps <--> Server_1_3_0_1.port;
     Switch_1_3_0_i0.down_port[2] <--> Link_1Gbps <--> Server_1_3_0_2.port;
     Switch_1_3_0_i0.down_port[3] <--> Link_1Gbps <--> Server_1_3_0_3.port;
     Switch_1_3_1_i0.down_port[0] <--> Link_1Gbps <--> Server_1_3_1_0.port;
     Switch_1_3_1_i0.down_port[1] <--> Link_1Gbps <--> Server_1_3_1_1.port;
     Switch_1_3_1_i0.down_port[2] <--> Link_1Gbps <--> Server_1_3_1_2.port;
     Switch_1_3_1_i0.down_port[3] <--> Link_1Gbps <--> Server_1_3_1_3.port;
     Switch_1_3_2_i0.down_port[0] <--> Link_1Gbps <--> Server_1_3_2_0.port;
     Switch_1_3_2_i0.down_port[1] <--> Link_1Gbps <--> Server_1_3_2_1.port;
     Switch_1_3_2_i0.down_port[2] <--> Link_1Gbps <--> Server_1_3_2_2.port;
     Switch_1_3_2_i0.down_port[3] <--> Link_1Gbps <--> Server_1_3_2_3.port;
     Switch_1_3_3_i0.down_port[0] <--> Link_1Gbps <--> Server_1_3_3_0.port;
     Switch_1_3_3_i0.down_port[1] <--> Link_1Gbps <--> Server_1_3_3_1.port;
     Switch_1_3_3_i0.down_port[2] <--> Link_1Gbps <--> Server_1_3_3_2.port;
     Switch_1_3_3_i0.down_port[3] <--> Link_1Gbps <--> Server_1_3_3_3.port;
     Switch_1_3_i0.down_port[0] <--> Link_1Gbps <--> Switch_1_3_0_i0.up_port[0];
     Switch_1_3_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_3_1_i0.up_port[0];
     Switch_1_3_i0.down_port[2] <--> Link_1Gbps <--> Switch_1_3_2_i0.up_port[0];
     Switch_1_3_i0.down_port[3] <--> Link_1Gbps <--> Switch_1_3_3_i0.up_port[0];
     Switch_1_3_i1.down_port[0] <--> Link_1Gbps <--> Switch_1_3_0_i0.up_port[1];
     Switch_1_3_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_3_1_i0.up_port[1];
     Switch_1_3_i1.down_port[2] <--> Link_1Gbps <--> Switch_1_3_2_i0.up_port[1];
     Switch_1_3_i1.down_port[3] <--> Link_1Gbps <--> Switch_1_3_3_i0.up_port[1];
     Switch_1_3_i2.down_port[0] <--> Link_1Gbps <--> Switch_1_3_0_i0.up_port[2];
     Switch_1_3_i2.down_port[1] <--> Link_1Gbps <--> Switch_1_3_1_i0.up_port[2];
     Switch_1_3_i2.down_port[2] <--> Link_1Gbps <--> Switch_1_3_2_i0.up_port[2];
     Switch_1_3_i2.down_port[3] <--> Link_1Gbps <--> Switch_1_3_3_i0.up_port[2];
     Switch_1_3_i3.down_port[0] <--> Link_1Gbps <--> Switch_1_3_0_i0.up_port[3];
     Switch_1_3_i3.down_port[1] <--> Link_1Gbps <--> Switch_1_3_1_i0.up_port[3];
     Switch_1_3_i3.down_port[2] <--> Link_1Gbps <--> Switch_1_3_2_i0.up_port[3];
     Switch_1_3_i3.down_port[3] <--> Link_1Gbps <--> Switch_1_3_3_i0.up_port[3];
     Switch_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i0.up_port[0];
     Switch_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i0.up_port[0];
     Switch_1_i0.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i0.up_port[0];
     Switch_1_i0.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i0.up_port[0];
     Switch_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i0.up_port[1];
     Switch_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i0.up_port[1];
     Switch_1_i1.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i0.up_port[1];
     Switch_1_i1.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i0.up_port[1];
     Switch_1_i2.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i0.up_port[2];
     Switch_1_i2.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i0.up_port[2];
     Switch_1_i2.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i0.up_port[2];
     Switch_1_i2.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i0.up_port[2];
     Switch_1_i3.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i0.up_port[3];
     Switch_1_i3.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i0.up_port[3];
     Switch_1_i3.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i0.up_port[3];
     Switch_1_i3.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i0.up_port[3];
     Switch_1_i4.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i1.up_port[0];
     Switch_1_i4.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i1.up_port[0];
     Switch_1_i4.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i1.up_port[0];
     Switch_1_i4.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i1.up_port[0];
     Switch_1_i5.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i1.up_port[1];
     Switch_1_i5.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i1.up_port[1];
     Switch_1_i5.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i1.up_port[1];
     Switch_1_i5.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i1.up_port[1];
     Switch_1_i6.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i1.up_port[2];
     Switch_1_i6.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i1.up_port[2];
     Switch_1_i6.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i1.up_port[2];
     Switch_1_i6.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i1.up_port[2];
     Switch_1_i7.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i1.up_port[3];
     Switch_1_i7.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i1.up_port[3];
     Switch_1_i7.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i1.up_port[3];
     Switch_1_i7.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i1.up_port[3];
     Switch_1_i8.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i2.up_port[0];
     Switch_1_i8.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i2.up_port[0];
     Switch_1_i8.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i2.up_port[0];
     Switch_1_i8.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i2.up_port[0];
     Switch_1_i9.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i2.up_port[1];
     Switch_1_i9.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i2.up_port[1];
     Switch_1_i9.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i2.up_port[1];
     Switch_1_i9.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i2.up_port[1];
     Switch_1_i10.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i2.up_port[2];
     Switch_1_i10.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i2.up_port[2];
     Switch_1_i10.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i2.up_port[2];
     Switch_1_i10.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i2.up_port[2];
     Switch_1_i11.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i2.up_port[3];
     Switch_1_i11.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i2.up_port[3];
     Switch_1_i11.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i2.up_port[3];
     Switch_1_i11.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i2.up_port[3];
     Switch_1_i12.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i3.up_port[0];
     Switch_1_i12.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i3.up_port[0];
     Switch_1_i12.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i3.up_port[0];
     Switch_1_i12.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i3.up_port[0];
     Switch_1_i13.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i3.up_port[1];
     Switch_1_i13.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i3.up_port[1];
     Switch_1_i13.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i3.up_port[1];
     Switch_1_i13.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i3.up_port[1];
     Switch_1_i14.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i3.up_port[2];
     Switch_1_i14.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i3.up_port[2];
     Switch_1_i14.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i3.up_port[2];
     Switch_1_i14.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i3.up_port[2];
     Switch_1_i15.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i3.up_port[3];
     Switch_1_i15.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i3.up_port[3];
     Switch_1_i15.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i3.up_port[3];
     Switch_1_i15.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i3.up_port[3];
     Switch_2_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_2_0_0_0.port;
     Switch_2_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_2_0_0_1.port;
     Switch_2_0_0_i0.down_port[2] <--> Link_1Gbps <--> Server_2_0_0_2.port;
     Switch_2_0_0_i0.down_port[3] <--> Link_1Gbps <--> Server_2_0_0_3.port;
     Switch_2_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_2_0_1_0.port;
     Switch_2_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_2_0_1_1.port;
     Switch_2_0_1_i0.down_port[2] <--> Link_1Gbps <--> Server_2_0_1_2.port;
     Switch_2_0_1_i0.down_port[3] <--> Link_1Gbps <--> Server_2_0_1_3.port;
     Switch_2_0_2_i0.down_port[0] <--> Link_1Gbps <--> Server_2_0_2_0.port;
     Switch_2_0_2_i0.down_port[1] <--> Link_1Gbps <--> Server_2_0_2_1.port;
     Switch_2_0_2_i0.down_port[2] <--> Link_1Gbps <--> Server_2_0_2_2.port;
     Switch_2_0_2_i0.down_port[3] <--> Link_1Gbps <--> Server_2_0_2_3.port;
     Switch_2_0_3_i0.down_port[0] <--> Link_1Gbps <--> Server_2_0_3_0.port;
     Switch_2_0_3_i0.down_port[1] <--> Link_1Gbps <--> Server_2_0_3_1.port;
     Switch_2_0_3_i0.down_port[2] <--> Link_1Gbps <--> Server_2_0_3_2.port;
     Switch_2_0_3_i0.down_port[3] <--> Link_1Gbps <--> Server_2_0_3_3.port;
     Switch_2_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_2_0_0_i0.up_port[0];
     Switch_2_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_2_0_1_i0.up_port[0];
     Switch_2_0_i0.down_port[2] <--> Link_1Gbps <--> Switch_2_0_2_i0.up_port[0];
     Switch_2_0_i0.down_port[3] <--> Link_1Gbps <--> Switch_2_0_3_i0.up_port[0];
     Switch_2_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_2_0_0_i0.up_port[1];
     Switch_2_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_2_0_1_i0.up_port[1];
     Switch_2_0_i1.down_port[2] <--> Link_1Gbps <--> Switch_2_0_2_i0.up_port[1];
     Switch_2_0_i1.down_port[3] <--> Link_1Gbps <--> Switch_2_0_3_i0.up_port[1];
     Switch_2_0_i2.down_port[0] <--> Link_1Gbps <--> Switch_2_0_0_i0.up_port[2];
     Switch_2_0_i2.down_port[1] <--> Link_1Gbps <--> Switch_2_0_1_i0.up_port[2];
     Switch_2_0_i2.down_port[2] <--> Link_1Gbps <--> Switch_2_0_2_i0.up_port[2];
     Switch_2_0_i2.down_port[3] <--> Link_1Gbps <--> Switch_2_0_3_i0.up_port[2];
     Switch_2_0_i3.down_port[0] <--> Link_1Gbps <--> Switch_2_0_0_i0.up_port[3];
     Switch_2_0_i3.down_port[1] <--> Link_1Gbps <--> Switch_2_0_1_i0.up_port[3];
     Switch_2_0_i3.down_port[2] <--> Link_1Gbps <--> Switch_2_0_2_i0.up_port[3];
     Switch_2_0_i3.down_port[3] <--> Link_1Gbps <--> Switch_2_0_3_i0.up_port[3];
     Switch_2_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_2_1_0_0.port;
     Switch_2_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_2_1_0_1.port;
     Switch_2_1_0_i0.down_port[2] <--> Link_1Gbps <--> Server_2_1_0_2.port;
     Switch_2_1_0_i0.down_port[3] <--> Link_1Gbps <--> Server_2_1_0_3.port;
     Switch_2_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_2_1_1_0.port;
     Switch_2_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_2_1_1_1.port;
     Switch_2_1_1_i0.down_port[2] <--> Link_1Gbps <--> Server_2_1_1_2.port;
     Switch_2_1_1_i0.down_port[3] <--> Link_1Gbps <--> Server_2_1_1_3.port;
     Switch_2_1_2_i0.down_port[0] <--> Link_1Gbps <--> Server_2_1_2_0.port;
     Switch_2_1_2_i0.down_port[1] <--> Link_1Gbps <--> Server_2_1_2_1.port;
     Switch_2_1_2_i0.down_port[2] <--> Link_1Gbps <--> Server_2_1_2_2.port;
     Switch_2_1_2_i0.down_port[3] <--> Link_1Gbps <--> Server_2_1_2_3.port;
     Switch_2_1_3_i0.down_port[0] <--> Link_1Gbps <--> Server_2_1_3_0.port;
     Switch_2_1_3_i0.down_port[1] <--> Link_1Gbps <--> Server_2_1_3_1.port;
     Switch_2_1_3_i0.down_port[2] <--> Link_1Gbps <--> Server_2_1_3_2.port;
     Switch_2_1_3_i0.down_port[3] <--> Link_1Gbps <--> Server_2_1_3_3.port;
     Switch_2_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_2_1_0_i0.up_port[0];
     Switch_2_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_2_1_1_i0.up_port[0];
     Switch_2_1_i0.down_port[2] <--> Link_1Gbps <--> Switch_2_1_2_i0.up_port[0];
     Switch_2_1_i0.down_port[3] <--> Link_1Gbps <--> Switch_2_1_3_i0.up_port[0];
     Switch_2_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_2_1_0_i0.up_port[1];
     Switch_2_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_2_1_1_i0.up_port[1];
     Switch_2_1_i1.down_port[2] <--> Link_1Gbps <--> Switch_2_1_2_i0.up_port[1];
     Switch_2_1_i1.down_port[3] <--> Link_1Gbps <--> Switch_2_1_3_i0.up_port[1];
     Switch_2_1_i2.down_port[0] <--> Link_1Gbps <--> Switch_2_1_0_i0.up_port[2];
     Switch_2_1_i2.down_port[1] <--> Link_1Gbps <--> Switch_2_1_1_i0.up_port[2];
     Switch_2_1_i2.down_port[2] <--> Link_1Gbps <--> Switch_2_1_2_i0.up_port[2];
     Switch_2_1_i2.down_port[3] <--> Link_1Gbps <--> Switch_2_1_3_i0.up_port[2];
     Switch_2_1_i3.down_port[0] <--> Link_1Gbps <--> Switch_2_1_0_i0.up_port[3];
     Switch_2_1_i3.down_port[1] <--> Link_1Gbps <--> Switch_2_1_1_i0.up_port[3];
     Switch_2_1_i3.down_port[2] <--> Link_1Gbps <--> Switch_2_1_2_i0.up_port[3];
     Switch_2_1_i3.down_port[3] <--> Link_1Gbps <--> Switch_2_1_3_i0.up_port[3];
     Switch_2_2_0_i0.down_port[0] <--> Link_1Gbps <--> Server_2_2_0_0.port;
     Switch_2_2_0_i0.down_port[1] <--> Link_1Gbps <--> Server_2_2_0_1.port;
     Switch_2_2_0_i0.down_port[2] <--> Link_1Gbps <--> Server_2_2_0_2.port;
     Switch_2_2_0_i0.down_port[3] <--> Link_1Gbps <--> Server_2_2_0_3.port;
     Switch_2_2_1_i0.down_port[0] <--> Link_1Gbps <--> Server_2_2_1_0.port;
     Switch_2_2_1_i0.down_port[1] <--> Link_1Gbps <--> Server_2_2_1_1.port;
     Switch_2_2_1_i0.down_port[2] <--> Link_1Gbps <--> Server_2_2_1_2.port;
     Switch_2_2_1_i0.down_port[3] <--> Link_1Gbps <--> Server_2_2_1_3.port;
     Switch_2_2_2_i0.down_port[0] <--> Link_1Gbps <--> Server_2_2_2_0.port;
     Switch_2_2_2_i0.down_port[1] <--> Link_1Gbps <--> Server_2_2_2_1.port;
     Switch_2_2_2_i0.down_port[2] <--> Link_1Gbps <--> Server_2_2_2_2.port;
     Switch_2_2_2_i0.down_port[3] <--> Link_1Gbps <--> Server_2_2_2_3.port;
     Switch_2_2_3_i0.down_port[0] <--> Link_1Gbps <--> Server_2_2_3_0.port;
     Switch_2_2_3_i0.down_port[1] <--> Link_1Gbps <--> Server_2_2_3_1.port;
     Switch_2_2_3_i0.down_port[2] <--> Link_1Gbps <--> Server_2_2_3_2.port;
     Switch_2_2_3_i0.down_port[3] <--> Link_1Gbps <--> Server_2_2_3_3.port;
     Switch_2_2_i0.down_port[0] <--> Link_1Gbps <--> Switch_2_2_0_i0.up_port[0];
     Switch_2_2_i0.down_port[1] <--> Link_1Gbps <--> Switch_2_2_1_i0.up_port[0];
     Switch_2_2_i0.down_port[2] <--> Link_1Gbps <--> Switch_2_2_2_i0.up_port[0];
     Switch_2_2_i0.down_port[3] <--> Link_1Gbps <--> Switch_2_2_3_i0.up_port[0];
     Switch_2_2_i1.down_port[0] <--> Link_1Gbps <--> Switch_2_2_0_i0.up_port[1];
     Switch_2_2_i1.down_port[1] <--> Link_1Gbps <--> Switch_2_2_1_i0.up_port[1];
     Switch_2_2_i1.down_port[2] <--> Link_1Gbps <--> Switch_2_2_2_i0.up_port[1];
     Switch_2_2_i1.down_port[3] <--> Link_1Gbps <--> Switch_2_2_3_i0.up_port[1];
     Switch_2_2_i2.down_port[0] <--> Link_1Gbps <--> Switch_2_2_0_i0.up_port[2];
     Switch_2_2_i2.down_port[1] <--> Link_1Gbps <--> Switch_2_2_1_i0.up_port[2];
     Switch_2_2_i2.down_port[2] <--> Link_1Gbps <--> Switch_2_2_2_i0.up_port[2];
     Switch_2_2_i2.down_port[3] <--> Link_1Gbps <--> Switch_2_2_3_i0.up_port[2];
     Switch_2_2_i3.down_port[0] <--> Link_1Gbps <--> Switch_2_2_0_i0.up_port[3];
     Switch_2_2_i3.down_port[1] <--> Link_1Gbps <--> Switch_2_2_1_i0.up_port[3];
     Switch_2_2_i3.down_port[2] <--> Link_1Gbps <--> Switch_2_2_2_i0.up_port[3];
     Switch_2_2_i3.down_port[3] <--> Link_1Gbps <--> Switch_2_2_3_i0.up_port[3];
     Switch_2_3_0_i0.down_port[0] <--> Link_1Gbps <--> Server_2_3_0_0.port;
     Switch_2_3_0_i0.down_port[1] <--> Link_1Gbps <--> Server_2_3_0_1.port;
     Switch_2_3_0_i0.down_port[2] <--> Link_1Gbps <--> Server_2_3_0_2.port;
     Switch_2_3_0_i0.down_port[3] <--> Link_1Gbps <--> Server_2_3_0_3.port;
     Switch_2_3_1_i0.down_port[0] <--> Link_1Gbps <--> Server_2_3_1_0.port;
     Switch_2_3_1_i0.down_port[1] <--> Link_1Gbps <--> Server_2_3_1_1.port;
     Switch_2_3_1_i0.down_port[2] <--> Link_1Gbps <--> Server_2_3_1_2.port;
     Switch_2_3_1_i0.down_port[3] <--> Link_1Gbps <--> Server_2_3_1_3.port;
     Switch_2_3_2_i0.down_port[0] <--> Link_1Gbps <--> Server_2_3_2_0.port;
     Switch_2_3_2_i0.down_port[1] <--> Link_1Gbps <--> Server_2_3_2_1.port;
     Switch_2_3_2_i0.down_port[2] <--> Link_1Gbps <--> Server_2_3_2_2.port;
     Switch_2_3_2_i0.down_port[3] <--> Link_1Gbps <--> Server_2_3_2_3.port;
     Switch_2_3_3_i0.down_port[0] <--> Link_1Gbps <--> Server_2_3_3_0.port;
     Switch_2_3_3_i0.down_port[1] <--> Link_1Gbps <--> Server_2_3_3_1.port;
     Switch_2_3_3_i0.down_port[2] <--> Link_1Gbps <--> Server_2_3_3_2.port;
     Switch_2_3_3_i0.down_port[3] <--> Link_1Gbps <--> Server_2_3_3_3.port;
     Switch_2_3_i0.down_port[0] <--> Link_1Gbps <--> Switch_2_3_0_i0.up_port[0];
     Switch_2_3_i0.down_port[1] <--> Link_1Gbps <--> Switch_2_3_1_i0.up_port[0];
     Switch_2_3_i0.down_port[2] <--> Link_1Gbps <--> Switch_2_3_2_i0.up_port[0];
     Switch_2_3_i0.down_port[3] <--> Link_1Gbps <--> Switch_2_3_3_i0.up_port[0];
     Switch_2_3_i1.down_port[0] <--> Link_1Gbps <--> Switch_2_3_0_i0.up_port[1];
     Switch_2_3_i1.down_port[1] <--> Link_1Gbps <--> Switch_2_3_1_i0.up_port[1];
     Switch_2_3_i1.down_port[2] <--> Link_1Gbps <--> Switch_2_3_2_i0.up_port[1];
     Switch_2_3_i1.down_port[3] <--> Link_1Gbps <--> Switch_2_3_3_i0.up_port[1];
     Switch_2_3_i2.down_port[0] <--> Link_1Gbps <--> Switch_2_3_0_i0.up_port[2];
     Switch_2_3_i2.down_port[1] <--> Link_1Gbps <--> Switch_2_3_1_i0.up_port[2];
     Switch_2_3_i2.down_port[2] <--> Link_1Gbps <--> Switch_2_3_2_i0.up_port[2];
     Switch_2_3_i2.down_port[3] <--> Link_1Gbps <--> Switch_2_3_3_i0.up_port[2];
     Switch_2_3_i3.down_port[0] <--> Link_1Gbps <--> Switch_2_3_0_i0.up_port[3];
     Switch_2_3_i3.down_port[1] <--> Link_1Gbps <--> Switch_2_3_1_i0.up_port[3];
     Switch_2_3_i3.down_port[2] <--> Link_1Gbps <--> Switch_2_3_2_i0.up_port[3];
     Switch_2_3_i3.down_port[3] <--> Link_1Gbps <--> Switch_2_3_3_i0.up_port[3];
     Switch_2_i0.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i0.up_port[0];
     Switch_2_i0.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i0.up_port[0];
     Switch_2_i0.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i0.up_port[0];
     Switch_2_i0.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i0.up_port[0];
     Switch_2_i1.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i0.up_port[1];
     Switch_2_i1.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i0.up_port[1];
     Switch_2_i1.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i0.up_port[1];
     Switch_2_i1.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i0.up_port[1];
     Switch_2_i2.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i0.up_port[2];
     Switch_2_i2.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i0.up_port[2];
     Switch_2_i2.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i0.up_port[2];
     Switch_2_i2.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i0.up_port[2];
     Switch_2_i3.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i0.up_port[3];
     Switch_2_i3.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i0.up_port[3];
     Switch_2_i3.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i0.up_port[3];
     Switch_2_i3.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i0.up_port[3];
     Switch_2_i4.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i1.up_port[0];
     Switch_2_i4.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i1.up_port[0];
     Switch_2_i4.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i1.up_port[0];
     Switch_2_i4.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i1.up_port[0];
     Switch_2_i5.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i1.up_port[1];
     Switch_2_i5.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i1.up_port[1];
     Switch_2_i5.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i1.up_port[1];
     Switch_2_i5.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i1.up_port[1];
     Switch_2_i6.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i1.up_port[2];
     Switch_2_i6.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i1.up_port[2];
     Switch_2_i6.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i1.up_port[2];
     Switch_2_i6.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i1.up_port[2];
     Switch_2_i7.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i1.up_port[3];
     Switch_2_i7.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i1.up_port[3];
     Switch_2_i7.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i1.up_port[3];
     Switch_2_i7.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i1.up_port[3];
     Switch_2_i8.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i2.up_port[0];
     Switch_2_i8.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i2.up_port[0];
     Switch_2_i8.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i2.up_port[0];
     Switch_2_i8.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i2.up_port[0];
     Switch_2_i9.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i2.up_port[1];
     Switch_2_i9.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i2.up_port[1];
     Switch_2_i9.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i2.up_port[1];
     Switch_2_i9.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i2.up_port[1];
     Switch_2_i10.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i2.up_port[2];
     Switch_2_i10.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i2.up_port[2];
     Switch_2_i10.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i2.up_port[2];
     Switch_2_i10.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i2.up_port[2];
     Switch_2_i11.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i2.up_port[3];
     Switch_2_i11.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i2.up_port[3];
     Switch_2_i11.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i2.up_port[3];
     Switch_2_i11.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i2.up_port[3];
     Switch_2_i12.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i3.up_port[0];
     Switch_2_i12.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i3.up_port[0];
     Switch_2_i12.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i3.up_port[0];
     Switch_2_i12.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i3.up_port[0];
     Switch_2_i13.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i3.up_port[1];
     Switch_2_i13.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i3.up_port[1];
     Switch_2_i13.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i3.up_port[1];
     Switch_2_i13.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i3.up_port[1];
     Switch_2_i14.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i3.up_port[2];
     Switch_2_i14.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i3.up_port[2];
     Switch_2_i14.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i3.up_port[2];
     Switch_2_i14.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i3.up_port[2];
     Switch_2_i15.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i3.up_port[3];
     Switch_2_i15.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i3.up_port[3];
     Switch_2_i15.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i3.up_port[3];
     Switch_2_i15.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i3.up_port[3];
     Switch_3_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_3_0_0_0.port;
     Switch_3_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_3_0_0_1.port;
     Switch_3_0_0_i0.down_port[2] <--> Link_1Gbps <--> Server_3_0_0_2.port;
     Switch_3_0_0_i0.down_port[3] <--> Link_1Gbps <--> Server_3_0_0_3.port;
     Switch_3_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_3_0_1_0.port;
     Switch_3_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_3_0_1_1.port;
     Switch_3_0_1_i0.down_port[2] <--> Link_1Gbps <--> Server_3_0_1_2.port;
     Switch_3_0_1_i0.down_port[3] <--> Link_1Gbps <--> Server_3_0_1_3.port;
     Switch_3_0_2_i0.down_port[0] <--> Link_1Gbps <--> Server_3_0_2_0.port;
     Switch_3_0_2_i0.down_port[1] <--> Link_1Gbps <--> Server_3_0_2_1.port;
     Switch_3_0_2_i0.down_port[2] <--> Link_1Gbps <--> Server_3_0_2_2.port;
     Switch_3_0_2_i0.down_port[3] <--> Link_1Gbps <--> Server_3_0_2_3.port;
     Switch_3_0_3_i0.down_port[0] <--> Link_1Gbps <--> Server_3_0_3_0.port;
     Switch_3_0_3_i0.down_port[1] <--> Link_1Gbps <--> Server_3_0_3_1.port;
     Switch_3_0_3_i0.down_port[2] <--> Link_1Gbps <--> Server_3_0_3_2.port;
     Switch_3_0_3_i0.down_port[3] <--> Link_1Gbps <--> Server_3_0_3_3.port;
     Switch_3_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_3_0_0_i0.up_port[0];
     Switch_3_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_3_0_1_i0.up_port[0];
     Switch_3_0_i0.down_port[2] <--> Link_1Gbps <--> Switch_3_0_2_i0.up_port[0];
     Switch_3_0_i0.down_port[3] <--> Link_1Gbps <--> Switch_3_0_3_i0.up_port[0];
     Switch_3_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_3_0_0_i0.up_port[1];
     Switch_3_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_3_0_1_i0.up_port[1];
     Switch_3_0_i1.down_port[2] <--> Link_1Gbps <--> Switch_3_0_2_i0.up_port[1];
     Switch_3_0_i1.down_port[3] <--> Link_1Gbps <--> Switch_3_0_3_i0.up_port[1];
     Switch_3_0_i2.down_port[0] <--> Link_1Gbps <--> Switch_3_0_0_i0.up_port[2];
     Switch_3_0_i2.down_port[1] <--> Link_1Gbps <--> Switch_3_0_1_i0.up_port[2];
     Switch_3_0_i2.down_port[2] <--> Link_1Gbps <--> Switch_3_0_2_i0.up_port[2];
     Switch_3_0_i2.down_port[3] <--> Link_1Gbps <--> Switch_3_0_3_i0.up_port[2];
     Switch_3_0_i3.down_port[0] <--> Link_1Gbps <--> Switch_3_0_0_i0.up_port[3];
     Switch_3_0_i3.down_port[1] <--> Link_1Gbps <--> Switch_3_0_1_i0.up_port[3];
     Switch_3_0_i3.down_port[2] <--> Link_1Gbps <--> Switch_3_0_2_i0.up_port[3];
     Switch_3_0_i3.down_port[3] <--> Link_1Gbps <--> Switch_3_0_3_i0.up_port[3];
     Switch_3_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_3_1_0_0.port;
     Switch_3_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_3_1_0_1.port;
     Switch_3_1_0_i0.down_port[2] <--> Link_1Gbps <--> Server_3_1_0_2.port;
     Switch_3_1_0_i0.down_port[3] <--> Link_1Gbps <--> Server_3_1_0_3.port;
     Switch_3_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_3_1_1_0.port;
     Switch_3_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_3_1_1_1.port;
     Switch_3_1_1_i0.down_port[2] <--> Link_1Gbps <--> Server_3_1_1_2.port;
     Switch_3_1_1_i0.down_port[3] <--> Link_1Gbps <--> Server_3_1_1_3.port;
     Switch_3_1_2_i0.down_port[0] <--> Link_1Gbps <--> Server_3_1_2_0.port;
     Switch_3_1_2_i0.down_port[1] <--> Link_1Gbps <--> Server_3_1_2_1.port;
     Switch_3_1_2_i0.down_port[2] <--> Link_1Gbps <--> Server_3_1_2_2.port;
     Switch_3_1_2_i0.down_port[3] <--> Link_1Gbps <--> Server_3_1_2_3.port;
     Switch_3_1_3_i0.down_port[0] <--> Link_1Gbps <--> Server_3_1_3_0.port;
     Switch_3_1_3_i0.down_port[1] <--> Link_1Gbps <--> Server_3_1_3_1.port;
     Switch_3_1_3_i0.down_port[2] <--> Link_1Gbps <--> Server_3_1_3_2.port;
     Switch_3_1_3_i0.down_port[3] <--> Link_1Gbps <--> Server_3_1_3_3.port;
     Switch_3_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_3_1_0_i0.up_port[0];
     Switch_3_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_3_1_1_i0.up_port[0];
     Switch_3_1_i0.down_port[2] <--> Link_1Gbps <--> Switch_3_1_2_i0.up_port[0];
     Switch_3_1_i0.down_port[3] <--> Link_1Gbps <--> Switch_3_1_3_i0.up_port[0];
     Switch_3_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_3_1_0_i0.up_port[1];
     Switch_3_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_3_1_1_i0.up_port[1];
     Switch_3_1_i1.down_port[2] <--> Link_1Gbps <--> Switch_3_1_2_i0.up_port[1];
     Switch_3_1_i1.down_port[3] <--> Link_1Gbps <--> Switch_3_1_3_i0.up_port[1];
     Switch_3_1_i2.down_port[0] <--> Link_1Gbps <--> Switch_3_1_0_i0.up_port[2];
     Switch_3_1_i2.down_port[1] <--> Link_1Gbps <--> Switch_3_1_1_i0.up_port[2];
     Switch_3_1_i2.down_port[2] <--> Link_1Gbps <--> Switch_3_1_2_i0.up_port[2];
     Switch_3_1_i2.down_port[3] <--> Link_1Gbps <--> Switch_3_1_3_i0.up_port[2];
     Switch_3_1_i3.down_port[0] <--> Link_1Gbps <--> Switch_3_1_0_i0.up_port[3];
     Switch_3_1_i3.down_port[1] <--> Link_1Gbps <--> Switch_3_1_1_i0.up_port[3];
     Switch_3_1_i3.down_port[2] <--> Link_1Gbps <--> Switch_3_1_2_i0.up_port[3];
     Switch_3_1_i3.down_port[3] <--> Link_1Gbps <--> Switch_3_1_3_i0.up_port[3];
     Switch_3_2_0_i0.down_port[0] <--> Link_1Gbps <--> Server_3_2_0_0.port;
     Switch_3_2_0_i0.down_port[1] <--> Link_1Gbps <--> Server_3_2_0_1.port;
     Switch_3_2_0_i0.down_port[2] <--> Link_1Gbps <--> Server_3_2_0_2.port;
     Switch_3_2_0_i0.down_port[3] <--> Link_1Gbps <--> Server_3_2_0_3.port;
     Switch_3_2_1_i0.down_port[0] <--> Link_1Gbps <--> Server_3_2_1_0.port;
     Switch_3_2_1_i0.down_port[1] <--> Link_1Gbps <--> Server_3_2_1_1.port;
     Switch_3_2_1_i0.down_port[2] <--> Link_1Gbps <--> Server_3_2_1_2.port;
     Switch_3_2_1_i0.down_port[3] <--> Link_1Gbps <--> Server_3_2_1_3.port;
     Switch_3_2_2_i0.down_port[0] <--> Link_1Gbps <--> Server_3_2_2_0.port;
     Switch_3_2_2_i0.down_port[1] <--> Link_1Gbps <--> Server_3_2_2_1.port;
     Switch_3_2_2_i0.down_port[2] <--> Link_1Gbps <--> Server_3_2_2_2.port;
     Switch_3_2_2_i0.down_port[3] <--> Link_1Gbps <--> Server_3_2_2_3.port;
     Switch_3_2_3_i0.down_port[0] <--> Link_1Gbps <--> Server_3_2_3_0.port;
     Switch_3_2_3_i0.down_port[1] <--> Link_1Gbps <--> Server_3_2_3_1.port;
     Switch_3_2_3_i0.down_port[2] <--> Link_1Gbps <--> Server_3_2_3_2.port;
     Switch_3_2_3_i0.down_port[3] <--> Link_1Gbps <--> Server_3_2_3_3.port;
     Switch_3_2_i0.down_port[0] <--> Link_1Gbps <--> Switch_3_2_0_i0.up_port[0];
     Switch_3_2_i0.down_port[1] <--> Link_1Gbps <--> Switch_3_2_1_i0.up_port[0];
     Switch_3_2_i0.down_port[2] <--> Link_1Gbps <--> Switch_3_2_2_i0.up_port[0];
     Switch_3_2_i0.down_port[3] <--> Link_1Gbps <--> Switch_3_2_3_i0.up_port[0];
     Switch_3_2_i1.down_port[0] <--> Link_1Gbps <--> Switch_3_2_0_i0.up_port[1];
     Switch_3_2_i1.down_port[1] <--> Link_1Gbps <--> Switch_3_2_1_i0.up_port[1];
     Switch_3_2_i1.down_port[2] <--> Link_1Gbps <--> Switch_3_2_2_i0.up_port[1];
     Switch_3_2_i1.down_port[3] <--> Link_1Gbps <--> Switch_3_2_3_i0.up_port[1];
     Switch_3_2_i2.down_port[0] <--> Link_1Gbps <--> Switch_3_2_0_i0.up_port[2];
     Switch_3_2_i2.down_port[1] <--> Link_1Gbps <--> Switch_3_2_1_i0.up_port[2];
     Switch_3_2_i2.down_port[2] <--> Link_1Gbps <--> Switch_3_2_2_i0.up_port[2];
     Switch_3_2_i2.down_port[3] <--> Link_1Gbps <--> Switch_3_2_3_i0.up_port[2];
     Switch_3_2_i3.down_port[0] <--> Link_1Gbps <--> Switch_3_2_0_i0.up_port[3];
     Switch_3_2_i3.down_port[1] <--> Link_1Gbps <--> Switch_3_2_1_i0.up_port[3];
     Switch_3_2_i3.down_port[2] <--> Link_1Gbps <--> Switch_3_2_2_i0.up_port[3];
     Switch_3_2_i3.down_port[3] <--> Link_1Gbps <--> Switch_3_2_3_i0.up_port[3];
     Switch_3_3_0_i0.down_port[0] <--> Link_1Gbps <--> Server_3_3_0_0.port;
     Switch_3_3_0_i0.down_port[1] <--> Link_1Gbps <--> Server_3_3_0_1.port;
     Switch_3_3_0_i0.down_port[2] <--> Link_1Gbps <--> Server_3_3_0_2.port;
     Switch_3_3_0_i0.down_port[3] <--> Link_1Gbps <--> Server_3_3_0_3.port;
     Switch_3_3_1_i0.down_port[0] <--> Link_1Gbps <--> Server_3_3_1_0.port;
     Switch_3_3_1_i0.down_port[1] <--> Link_1Gbps <--> Server_3_3_1_1.port;
     Switch_3_3_1_i0.down_port[2] <--> Link_1Gbps <--> Server_3_3_1_2.port;
     Switch_3_3_1_i0.down_port[3] <--> Link_1Gbps <--> Server_3_3_1_3.port;
     Switch_3_3_2_i0.down_port[0] <--> Link_1Gbps <--> Server_3_3_2_0.port;
     Switch_3_3_2_i0.down_port[1] <--> Link_1Gbps <--> Server_3_3_2_1.port;
     Switch_3_3_2_i0.down_port[2] <--> Link_1Gbps <--> Server_3_3_2_2.port;
     Switch_3_3_2_i0.down_port[3] <--> Link_1Gbps <--> Server_3_3_2_3.port;
     Switch_3_3_3_i0.down_port[0] <--> Link_1Gbps <--> Server_3_3_3_0.port;
     Switch_3_3_3_i0.down_port[1] <--> Link_1Gbps <--> Server_3_3_3_1.port;
     Switch_3_3_3_i0.down_port[2] <--> Link_1Gbps <--> Server_3_3_3_2.port;
     Switch_3_3_3_i0.down_port[3] <--> Link_1Gbps <--> Server_3_3_3_3.port;
     Switch_3_3_i0.down_port[0] <--> Link_1Gbps <--> Switch_3_3_0_i0.up_port[0];
     Switch_3_3_i0.down_port[1] <--> Link_1Gbps <--> Switch_3_3_1_i0.up_port[0];
     Switch_3_3_i0.down_port[2] <--> Link_1Gbps <--> Switch_3_3_2_i0.up_port[0];
     Switch_3_3_i0.down_port[3] <--> Link_1Gbps <--> Switch_3_3_3_i0.up_port[0];
     Switch_3_3_i1.down_port[0] <--> Link_1Gbps <--> Switch_3_3_0_i0.up_port[1];
     Switch_3_3_i1.down_port[1] <--> Link_1Gbps <--> Switch_3_3_1_i0.up_port[1];
     Switch_3_3_i1.down_port[2] <--> Link_1Gbps <--> Switch_3_3_2_i0.up_port[1];
     Switch_3_3_i1.down_port[3] <--> Link_1Gbps <--> Switch_3_3_3_i0.up_port[1];
     Switch_3_3_i2.down_port[0] <--> Link_1Gbps <--> Switch_3_3_0_i0.up_port[2];
     Switch_3_3_i2.down_port[1] <--> Link_1Gbps <--> Switch_3_3_1_i0.up_port[2];
     Switch_3_3_i2.down_port[2] <--> Link_1Gbps <--> Switch_3_3_2_i0.up_port[2];
     Switch_3_3_i2.down_port[3] <--> Link_1Gbps <--> Switch_3_3_3_i0.up_port[2];
     Switch_3_3_i3.down_port[0] <--> Link_1Gbps <--> Switch_3_3_0_i0.up_port[3];
     Switch_3_3_i3.down_port[1] <--> Link_1Gbps <--> Switch_3_3_1_i0.up_port[3];
     Switch_3_3_i3.down_port[2] <--> Link_1Gbps <--> Switch_3_3_2_i0.up_port[3];
     Switch_3_3_i3.down_port[3] <--> Link_1Gbps <--> Switch_3_3_3_i0.up_port[3];
     Switch_3_i0.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i0.up_port[0];
     Switch_3_i0.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i0.up_port[0];
     Switch_3_i0.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i0.up_port[0];
     Switch_3_i0.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i0.up_port[0];
     Switch_3_i1.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i0.up_port[1];
     Switch_3_i1.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i0.up_port[1];
     Switch_3_i1.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i0.up_port[1];
     Switch_3_i1.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i0.up_port[1];
     Switch_3_i2.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i0.up_port[2];
     Switch_3_i2.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i0.up_port[2];
     Switch_3_i2.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i0.up_port[2];
     Switch_3_i2.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i0.up_port[2];
     Switch_3_i3.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i0.up_port[3];
     Switch_3_i3.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i0.up_port[3];
     Switch_3_i3.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i0.up_port[3];
     Switch_3_i3.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i0.up_port[3];
     Switch_3_i4.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i1.up_port[0];
     Switch_3_i4.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i1.up_port[0];
     Switch_3_i4.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i1.up_port[0];
     Switch_3_i4.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i1.up_port[0];
     Switch_3_i5.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i1.up_port[1];
     Switch_3_i5.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i1.up_port[1];
     Switch_3_i5.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i1.up_port[1];
     Switch_3_i5.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i1.up_port[1];
     Switch_3_i6.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i1.up_port[2];
     Switch_3_i6.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i1.up_port[2];
     Switch_3_i6.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i1.up_port[2];
     Switch_3_i6.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i1.up_port[2];
     Switch_3_i7.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i1.up_port[3];
     Switch_3_i7.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i1.up_port[3];
     Switch_3_i7.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i1.up_port[3];
     Switch_3_i7.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i1.up_port[3];
     Switch_3_i8.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i2.up_port[0];
     Switch_3_i8.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i2.up_port[0];
     Switch_3_i8.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i2.up_port[0];
     Switch_3_i8.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i2.up_port[0];
     Switch_3_i9.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i2.up_port[1];
     Switch_3_i9.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i2.up_port[1];
     Switch_3_i9.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i2.up_port[1];
     Switch_3_i9.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i2.up_port[1];
     Switch_3_i10.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i2.up_port[2];
     Switch_3_i10.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i2.up_port[2];
     Switch_3_i10.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i2.up_port[2];
     Switch_3_i10.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i2.up_port[2];
     Switch_3_i11.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i2.up_port[3];
     Switch_3_i11.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i2.up_port[3];
     Switch_3_i11.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i2.up_port[3];
     Switch_3_i11.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i2.up_port[3];
     Switch_3_i12.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i3.up_port[0];
     Switch_3_i12.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i3.up_port[0];
     Switch_3_i12.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i3.up_port[0];
     Switch_3_i12.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i3.up_port[0];
     Switch_3_i13.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i3.up_port[1];
     Switch_3_i13.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i3.up_port[1];
     Switch_3_i13.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i3.up_port[1];
     Switch_3_i13.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i3.up_port[1];
     Switch_3_i14.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i3.up_port[2];
     Switch_3_i14.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i3.up_port[2];
     Switch_3_i14.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i3.up_port[2];
     Switch_3_i14.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i3.up_port[2];
     Switch_3_i15.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i3.up_port[3];
     Switch_3_i15.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i3.up_port[3];
     Switch_3_i15.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i3.up_port[3];
     Switch_3_i15.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i3.up_port[3];
     Switch_4_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_4_0_0_0.port;
     Switch_4_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_4_0_0_1.port;
     Switch_4_0_0_i0.down_port[2] <--> Link_1Gbps <--> Server_4_0_0_2.port;
     Switch_4_0_0_i0.down_port[3] <--> Link_1Gbps <--> Server_4_0_0_3.port;
     Switch_4_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_4_0_1_0.port;
     Switch_4_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_4_0_1_1.port;
     Switch_4_0_1_i0.down_port[2] <--> Link_1Gbps <--> Server_4_0_1_2.port;
     Switch_4_0_1_i0.down_port[3] <--> Link_1Gbps <--> Server_4_0_1_3.port;
     Switch_4_0_2_i0.down_port[0] <--> Link_1Gbps <--> Server_4_0_2_0.port;
     Switch_4_0_2_i0.down_port[1] <--> Link_1Gbps <--> Server_4_0_2_1.port;
     Switch_4_0_2_i0.down_port[2] <--> Link_1Gbps <--> Server_4_0_2_2.port;
     Switch_4_0_2_i0.down_port[3] <--> Link_1Gbps <--> Server_4_0_2_3.port;
     Switch_4_0_3_i0.down_port[0] <--> Link_1Gbps <--> Server_4_0_3_0.port;
     Switch_4_0_3_i0.down_port[1] <--> Link_1Gbps <--> Server_4_0_3_1.port;
     Switch_4_0_3_i0.down_port[2] <--> Link_1Gbps <--> Server_4_0_3_2.port;
     Switch_4_0_3_i0.down_port[3] <--> Link_1Gbps <--> Server_4_0_3_3.port;
     Switch_4_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_4_0_0_i0.up_port[0];
     Switch_4_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_4_0_1_i0.up_port[0];
     Switch_4_0_i0.down_port[2] <--> Link_1Gbps <--> Switch_4_0_2_i0.up_port[0];
     Switch_4_0_i0.down_port[3] <--> Link_1Gbps <--> Switch_4_0_3_i0.up_port[0];
     Switch_4_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_4_0_0_i0.up_port[1];
     Switch_4_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_4_0_1_i0.up_port[1];
     Switch_4_0_i1.down_port[2] <--> Link_1Gbps <--> Switch_4_0_2_i0.up_port[1];
     Switch_4_0_i1.down_port[3] <--> Link_1Gbps <--> Switch_4_0_3_i0.up_port[1];
     Switch_4_0_i2.down_port[0] <--> Link_1Gbps <--> Switch_4_0_0_i0.up_port[2];
     Switch_4_0_i2.down_port[1] <--> Link_1Gbps <--> Switch_4_0_1_i0.up_port[2];
     Switch_4_0_i2.down_port[2] <--> Link_1Gbps <--> Switch_4_0_2_i0.up_port[2];
     Switch_4_0_i2.down_port[3] <--> Link_1Gbps <--> Switch_4_0_3_i0.up_port[2];
     Switch_4_0_i3.down_port[0] <--> Link_1Gbps <--> Switch_4_0_0_i0.up_port[3];
     Switch_4_0_i3.down_port[1] <--> Link_1Gbps <--> Switch_4_0_1_i0.up_port[3];
     Switch_4_0_i3.down_port[2] <--> Link_1Gbps <--> Switch_4_0_2_i0.up_port[3];
     Switch_4_0_i3.down_port[3] <--> Link_1Gbps <--> Switch_4_0_3_i0.up_port[3];
     Switch_4_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_4_1_0_0.port;
     Switch_4_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_4_1_0_1.port;
     Switch_4_1_0_i0.down_port[2] <--> Link_1Gbps <--> Server_4_1_0_2.port;
     Switch_4_1_0_i0.down_port[3] <--> Link_1Gbps <--> Server_4_1_0_3.port;
     Switch_4_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_4_1_1_0.port;
     Switch_4_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_4_1_1_1.port;
     Switch_4_1_1_i0.down_port[2] <--> Link_1Gbps <--> Server_4_1_1_2.port;
     Switch_4_1_1_i0.down_port[3] <--> Link_1Gbps <--> Server_4_1_1_3.port;
     Switch_4_1_2_i0.down_port[0] <--> Link_1Gbps <--> Server_4_1_2_0.port;
     Switch_4_1_2_i0.down_port[1] <--> Link_1Gbps <--> Server_4_1_2_1.port;
     Switch_4_1_2_i0.down_port[2] <--> Link_1Gbps <--> Server_4_1_2_2.port;
     Switch_4_1_2_i0.down_port[3] <--> Link_1Gbps <--> Server_4_1_2_3.port;
     Switch_4_1_3_i0.down_port[0] <--> Link_1Gbps <--> Server_4_1_3_0.port;
     Switch_4_1_3_i0.down_port[1] <--> Link_1Gbps <--> Server_4_1_3_1.port;
     Switch_4_1_3_i0.down_port[2] <--> Link_1Gbps <--> Server_4_1_3_2.port;
     Switch_4_1_3_i0.down_port[3] <--> Link_1Gbps <--> Server_4_1_3_3.port;
     Switch_4_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_4_1_0_i0.up_port[0];
     Switch_4_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_4_1_1_i0.up_port[0];
     Switch_4_1_i0.down_port[2] <--> Link_1Gbps <--> Switch_4_1_2_i0.up_port[0];
     Switch_4_1_i0.down_port[3] <--> Link_1Gbps <--> Switch_4_1_3_i0.up_port[0];
     Switch_4_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_4_1_0_i0.up_port[1];
     Switch_4_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_4_1_1_i0.up_port[1];
     Switch_4_1_i1.down_port[2] <--> Link_1Gbps <--> Switch_4_1_2_i0.up_port[1];
     Switch_4_1_i1.down_port[3] <--> Link_1Gbps <--> Switch_4_1_3_i0.up_port[1];
     Switch_4_1_i2.down_port[0] <--> Link_1Gbps <--> Switch_4_1_0_i0.up_port[2];
     Switch_4_1_i2.down_port[1] <--> Link_1Gbps <--> Switch_4_1_1_i0.up_port[2];
     Switch_4_1_i2.down_port[2] <--> Link_1Gbps <--> Switch_4_1_2_i0.up_port[2];
     Switch_4_1_i2.down_port[3] <--> Link_1Gbps <--> Switch_4_1_3_i0.up_port[2];
     Switch_4_1_i3.down_port[0] <--> Link_1Gbps <--> Switch_4_1_0_i0.up_port[3];
     Switch_4_1_i3.down_port[1] <--> Link_1Gbps <--> Switch_4_1_1_i0.up_port[3];
     Switch_4_1_i3.down_port[2] <--> Link_1Gbps <--> Switch_4_1_2_i0.up_port[3];
     Switch_4_1_i3.down_port[3] <--> Link_1Gbps <--> Switch_4_1_3_i0.up_port[3];
     Switch_4_2_0_i0.down_port[0] <--> Link_1Gbps <--> Server_4_2_0_0.port;
     Switch_4_2_0_i0.down_port[1] <--> Link_1Gbps <--> Server_4_2_0_1.port;
     Switch_4_2_0_i0.down_port[2] <--> Link_1Gbps <--> Server_4_2_0_2.port;
     Switch_4_2_0_i0.down_port[3] <--> Link_1Gbps <--> Server_4_2_0_3.port;
     Switch_4_2_1_i0.down_port[0] <--> Link_1Gbps <--> Server_4_2_1_0.port;
     Switch_4_2_1_i0.down_port[1] <--> Link_1Gbps <--> Server_4_2_1_1.port;
     Switch_4_2_1_i0.down_port[2] <--> Link_1Gbps <--> Server_4_2_1_2.port;
     Switch_4_2_1_i0.down_port[3] <--> Link_1Gbps <--> Server_4_2_1_3.port;
     Switch_4_2_2_i0.down_port[0] <--> Link_1Gbps <--> Server_4_2_2_0.port;
     Switch_4_2_2_i0.down_port[1] <--> Link_1Gbps <--> Server_4_2_2_1.port;
     Switch_4_2_2_i0.down_port[2] <--> Link_1Gbps <--> Server_4_2_2_2.port;
     Switch_4_2_2_i0.down_port[3] <--> Link_1Gbps <--> Server_4_2_2_3.port;
     Switch_4_2_3_i0.down_port[0] <--> Link_1Gbps <--> Server_4_2_3_0.port;
     Switch_4_2_3_i0.down_port[1] <--> Link_1Gbps <--> Server_4_2_3_1.port;
     Switch_4_2_3_i0.down_port[2] <--> Link_1Gbps <--> Server_4_2_3_2.port;
     Switch_4_2_3_i0.down_port[3] <--> Link_1Gbps <--> Server_4_2_3_3.port;
     Switch_4_2_i0.down_port[0] <--> Link_1Gbps <--> Switch_4_2_0_i0.up_port[0];
     Switch_4_2_i0.down_port[1] <--> Link_1Gbps <--> Switch_4_2_1_i0.up_port[0];
     Switch_4_2_i0.down_port[2] <--> Link_1Gbps <--> Switch_4_2_2_i0.up_port[0];
     Switch_4_2_i0.down_port[3] <--> Link_1Gbps <--> Switch_4_2_3_i0.up_port[0];
     Switch_4_2_i1.down_port[0] <--> Link_1Gbps <--> Switch_4_2_0_i0.up_port[1];
     Switch_4_2_i1.down_port[1] <--> Link_1Gbps <--> Switch_4_2_1_i0.up_port[1];
     Switch_4_2_i1.down_port[2] <--> Link_1Gbps <--> Switch_4_2_2_i0.up_port[1];
     Switch_4_2_i1.down_port[3] <--> Link_1Gbps <--> Switch_4_2_3_i0.up_port[1];
     Switch_4_2_i2.down_port[0] <--> Link_1Gbps <--> Switch_4_2_0_i0.up_port[2];
     Switch_4_2_i2.down_port[1] <--> Link_1Gbps <--> Switch_4_2_1_i0.up_port[2];
     Switch_4_2_i2.down_port[2] <--> Link_1Gbps <--> Switch_4_2_2_i0.up_port[2];
     Switch_4_2_i2.down_port[3] <--> Link_1Gbps <--> Switch_4_2_3_i0.up_port[2];
     Switch_4_2_i3.down_port[0] <--> Link_1Gbps <--> Switch_4_2_0_i0.up_port[3];
     Switch_4_2_i3.down_port[1] <--> Link_1Gbps <--> Switch_4_2_1_i0.up_port[3];
     Switch_4_2_i3.down_port[2] <--> Link_1Gbps <--> Switch_4_2_2_i0.up_port[3];
     Switch_4_2_i3.down_port[3] <--> Link_1Gbps <--> Switch_4_2_3_i0.up_port[3];
     Switch_4_3_0_i0.down_port[0] <--> Link_1Gbps <--> Server_4_3_0_0.port;
     Switch_4_3_0_i0.down_port[1] <--> Link_1Gbps <--> Server_4_3_0_1.port;
     Switch_4_3_0_i0.down_port[2] <--> Link_1Gbps <--> Server_4_3_0_2.port;
     Switch_4_3_0_i0.down_port[3] <--> Link_1Gbps <--> Server_4_3_0_3.port;
     Switch_4_3_1_i0.down_port[0] <--> Link_1Gbps <--> Server_4_3_1_0.port;
     Switch_4_3_1_i0.down_port[1] <--> Link_1Gbps <--> Server_4_3_1_1.port;
     Switch_4_3_1_i0.down_port[2] <--> Link_1Gbps <--> Server_4_3_1_2.port;
     Switch_4_3_1_i0.down_port[3] <--> Link_1Gbps <--> Server_4_3_1_3.port;
     Switch_4_3_2_i0.down_port[0] <--> Link_1Gbps <--> Server_4_3_2_0.port;
     Switch_4_3_2_i0.down_port[1] <--> Link_1Gbps <--> Server_4_3_2_1.port;
     Switch_4_3_2_i0.down_port[2] <--> Link_1Gbps <--> Server_4_3_2_2.port;
     Switch_4_3_2_i0.down_port[3] <--> Link_1Gbps <--> Server_4_3_2_3.port;
     Switch_4_3_3_i0.down_port[0] <--> Link_1Gbps <--> Server_4_3_3_0.port;
     Switch_4_3_3_i0.down_port[1] <--> Link_1Gbps <--> Server_4_3_3_1.port;
     Switch_4_3_3_i0.down_port[2] <--> Link_1Gbps <--> Server_4_3_3_2.port;
     Switch_4_3_3_i0.down_port[3] <--> Link_1Gbps <--> Server_4_3_3_3.port;
     Switch_4_3_i0.down_port[0] <--> Link_1Gbps <--> Switch_4_3_0_i0.up_port[0];
     Switch_4_3_i0.down_port[1] <--> Link_1Gbps <--> Switch_4_3_1_i0.up_port[0];
     Switch_4_3_i0.down_port[2] <--> Link_1Gbps <--> Switch_4_3_2_i0.up_port[0];
     Switch_4_3_i0.down_port[3] <--> Link_1Gbps <--> Switch_4_3_3_i0.up_port[0];
     Switch_4_3_i1.down_port[0] <--> Link_1Gbps <--> Switch_4_3_0_i0.up_port[1];
     Switch_4_3_i1.down_port[1] <--> Link_1Gbps <--> Switch_4_3_1_i0.up_port[1];
     Switch_4_3_i1.down_port[2] <--> Link_1Gbps <--> Switch_4_3_2_i0.up_port[1];
     Switch_4_3_i1.down_port[3] <--> Link_1Gbps <--> Switch_4_3_3_i0.up_port[1];
     Switch_4_3_i2.down_port[0] <--> Link_1Gbps <--> Switch_4_3_0_i0.up_port[2];
     Switch_4_3_i2.down_port[1] <--> Link_1Gbps <--> Switch_4_3_1_i0.up_port[2];
     Switch_4_3_i2.down_port[2] <--> Link_1Gbps <--> Switch_4_3_2_i0.up_port[2];
     Switch_4_3_i2.down_port[3] <--> Link_1Gbps <--> Switch_4_3_3_i0.up_port[2];
     Switch_4_3_i3.down_port[0] <--> Link_1Gbps <--> Switch_4_3_0_i0.up_port[3];
     Switch_4_3_i3.down_port[1] <--> Link_1Gbps <--> Switch_4_3_1_i0.up_port[3];
     Switch_4_3_i3.down_port[2] <--> Link_1Gbps <--> Switch_4_3_2_i0.up_port[3];
     Switch_4_3_i3.down_port[3] <--> Link_1Gbps <--> Switch_4_3_3_i0.up_port[3];
     Switch_4_i0.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i0.up_port[0];
     Switch_4_i0.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i0.up_port[0];
     Switch_4_i0.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i0.up_port[0];
     Switch_4_i0.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i0.up_port[0];
     Switch_4_i1.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i0.up_port[1];
     Switch_4_i1.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i0.up_port[1];
     Switch_4_i1.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i0.up_port[1];
     Switch_4_i1.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i0.up_port[1];
     Switch_4_i2.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i0.up_port[2];
     Switch_4_i2.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i0.up_port[2];
     Switch_4_i2.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i0.up_port[2];
     Switch_4_i2.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i0.up_port[2];
     Switch_4_i3.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i0.up_port[3];
     Switch_4_i3.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i0.up_port[3];
     Switch_4_i3.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i0.up_port[3];
     Switch_4_i3.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i0.up_port[3];
     Switch_4_i4.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i1.up_port[0];
     Switch_4_i4.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i1.up_port[0];
     Switch_4_i4.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i1.up_port[0];
     Switch_4_i4.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i1.up_port[0];
     Switch_4_i5.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i1.up_port[1];
     Switch_4_i5.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i1.up_port[1];
     Switch_4_i5.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i1.up_port[1];
     Switch_4_i5.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i1.up_port[1];
     Switch_4_i6.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i1.up_port[2];
     Switch_4_i6.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i1.up_port[2];
     Switch_4_i6.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i1.up_port[2];
     Switch_4_i6.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i1.up_port[2];
     Switch_4_i7.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i1.up_port[3];
     Switch_4_i7.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i1.up_port[3];
     Switch_4_i7.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i1.up_port[3];
     Switch_4_i7.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i1.up_port[3];
     Switch_4_i8.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i2.up_port[0];
     Switch_4_i8.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i2.up_port[0];
     Switch_4_i8.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i2.up_port[0];
     Switch_4_i8.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i2.up_port[0];
     Switch_4_i9.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i2.up_port[1];
     Switch_4_i9.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i2.up_port[1];
     Switch_4_i9.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i2.up_port[1];
     Switch_4_i9.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i2.up_port[1];
     Switch_4_i10.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i2.up_port[2];
     Switch_4_i10.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i2.up_port[2];
     Switch_4_i10.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i2.up_port[2];
     Switch_4_i10.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i2.up_port[2];
     Switch_4_i11.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i2.up_port[3];
     Switch_4_i11.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i2.up_port[3];
     Switch_4_i11.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i2.up_port[3];
     Switch_4_i11.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i2.up_port[3];
     Switch_4_i12.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i3.up_port[0];
     Switch_4_i12.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i3.up_port[0];
     Switch_4_i12.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i3.up_port[0];
     Switch_4_i12.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i3.up_port[0];
     Switch_4_i13.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i3.up_port[1];
     Switch_4_i13.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i3.up_port[1];
     Switch_4_i13.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i3.up_port[1];
     Switch_4_i13.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i3.up_port[1];
     Switch_4_i14.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i3.up_port[2];
     Switch_4_i14.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i3.up_port[2];
     Switch_4_i14.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i3.up_port[2];
     Switch_4_i14.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i3.up_port[2];
     Switch_4_i15.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i3.up_port[3];
     Switch_4_i15.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i3.up_port[3];
     Switch_4_i15.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i3.up_port[3];
     Switch_4_i15.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i3.up_port[3];
     Switch_5_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_5_0_0_0.port;
     Switch_5_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_5_0_0_1.port;
     Switch_5_0_0_i0.down_port[2] <--> Link_1Gbps <--> Server_5_0_0_2.port;
     Switch_5_0_0_i0.down_port[3] <--> Link_1Gbps <--> Server_5_0_0_3.port;
     Switch_5_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_5_0_1_0.port;
     Switch_5_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_5_0_1_1.port;
     Switch_5_0_1_i0.down_port[2] <--> Link_1Gbps <--> Server_5_0_1_2.port;
     Switch_5_0_1_i0.down_port[3] <--> Link_1Gbps <--> Server_5_0_1_3.port;
     Switch_5_0_2_i0.down_port[0] <--> Link_1Gbps <--> Server_5_0_2_0.port;
     Switch_5_0_2_i0.down_port[1] <--> Link_1Gbps <--> Server_5_0_2_1.port;
     Switch_5_0_2_i0.down_port[2] <--> Link_1Gbps <--> Server_5_0_2_2.port;
     Switch_5_0_2_i0.down_port[3] <--> Link_1Gbps <--> Server_5_0_2_3.port;
     Switch_5_0_3_i0.down_port[0] <--> Link_1Gbps <--> Server_5_0_3_0.port;
     Switch_5_0_3_i0.down_port[1] <--> Link_1Gbps <--> Server_5_0_3_1.port;
     Switch_5_0_3_i0.down_port[2] <--> Link_1Gbps <--> Server_5_0_3_2.port;
     Switch_5_0_3_i0.down_port[3] <--> Link_1Gbps <--> Server_5_0_3_3.port;
     Switch_5_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_5_0_0_i0.up_port[0];
     Switch_5_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_5_0_1_i0.up_port[0];
     Switch_5_0_i0.down_port[2] <--> Link_1Gbps <--> Switch_5_0_2_i0.up_port[0];
     Switch_5_0_i0.down_port[3] <--> Link_1Gbps <--> Switch_5_0_3_i0.up_port[0];
     Switch_5_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_5_0_0_i0.up_port[1];
     Switch_5_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_5_0_1_i0.up_port[1];
     Switch_5_0_i1.down_port[2] <--> Link_1Gbps <--> Switch_5_0_2_i0.up_port[1];
     Switch_5_0_i1.down_port[3] <--> Link_1Gbps <--> Switch_5_0_3_i0.up_port[1];
     Switch_5_0_i2.down_port[0] <--> Link_1Gbps <--> Switch_5_0_0_i0.up_port[2];
     Switch_5_0_i2.down_port[1] <--> Link_1Gbps <--> Switch_5_0_1_i0.up_port[2];
     Switch_5_0_i2.down_port[2] <--> Link_1Gbps <--> Switch_5_0_2_i0.up_port[2];
     Switch_5_0_i2.down_port[3] <--> Link_1Gbps <--> Switch_5_0_3_i0.up_port[2];
     Switch_5_0_i3.down_port[0] <--> Link_1Gbps <--> Switch_5_0_0_i0.up_port[3];
     Switch_5_0_i3.down_port[1] <--> Link_1Gbps <--> Switch_5_0_1_i0.up_port[3];
     Switch_5_0_i3.down_port[2] <--> Link_1Gbps <--> Switch_5_0_2_i0.up_port[3];
     Switch_5_0_i3.down_port[3] <--> Link_1Gbps <--> Switch_5_0_3_i0.up_port[3];
     Switch_5_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_5_1_0_0.port;
     Switch_5_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_5_1_0_1.port;
     Switch_5_1_0_i0.down_port[2] <--> Link_1Gbps <--> Server_5_1_0_2.port;
     Switch_5_1_0_i0.down_port[3] <--> Link_1Gbps <--> Server_5_1_0_3.port;
     Switch_5_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_5_1_1_0.port;
     Switch_5_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_5_1_1_1.port;
     Switch_5_1_1_i0.down_port[2] <--> Link_1Gbps <--> Server_5_1_1_2.port;
     Switch_5_1_1_i0.down_port[3] <--> Link_1Gbps <--> Server_5_1_1_3.port;
     Switch_5_1_2_i0.down_port[0] <--> Link_1Gbps <--> Server_5_1_2_0.port;
     Switch_5_1_2_i0.down_port[1] <--> Link_1Gbps <--> Server_5_1_2_1.port;
     Switch_5_1_2_i0.down_port[2] <--> Link_1Gbps <--> Server_5_1_2_2.port;
     Switch_5_1_2_i0.down_port[3] <--> Link_1Gbps <--> Server_5_1_2_3.port;
     Switch_5_1_3_i0.down_port[0] <--> Link_1Gbps <--> Server_5_1_3_0.port;
     Switch_5_1_3_i0.down_port[1] <--> Link_1Gbps <--> Server_5_1_3_1.port;
     Switch_5_1_3_i0.down_port[2] <--> Link_1Gbps <--> Server_5_1_3_2.port;
     Switch_5_1_3_i0.down_port[3] <--> Link_1Gbps <--> Server_5_1_3_3.port;
     Switch_5_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_5_1_0_i0.up_port[0];
     Switch_5_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_5_1_1_i0.up_port[0];
     Switch_5_1_i0.down_port[2] <--> Link_1Gbps <--> Switch_5_1_2_i0.up_port[0];
     Switch_5_1_i0.down_port[3] <--> Link_1Gbps <--> Switch_5_1_3_i0.up_port[0];
     Switch_5_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_5_1_0_i0.up_port[1];
     Switch_5_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_5_1_1_i0.up_port[1];
     Switch_5_1_i1.down_port[2] <--> Link_1Gbps <--> Switch_5_1_2_i0.up_port[1];
     Switch_5_1_i1.down_port[3] <--> Link_1Gbps <--> Switch_5_1_3_i0.up_port[1];
     Switch_5_1_i2.down_port[0] <--> Link_1Gbps <--> Switch_5_1_0_i0.up_port[2];
     Switch_5_1_i2.down_port[1] <--> Link_1Gbps <--> Switch_5_1_1_i0.up_port[2];
     Switch_5_1_i2.down_port[2] <--> Link_1Gbps <--> Switch_5_1_2_i0.up_port[2];
     Switch_5_1_i2.down_port[3] <--> Link_1Gbps <--> Switch_5_1_3_i0.up_port[2];
     Switch_5_1_i3.down_port[0] <--> Link_1Gbps <--> Switch_5_1_0_i0.up_port[3];
     Switch_5_1_i3.down_port[1] <--> Link_1Gbps <--> Switch_5_1_1_i0.up_port[3];
     Switch_5_1_i3.down_port[2] <--> Link_1Gbps <--> Switch_5_1_2_i0.up_port[3];
     Switch_5_1_i3.down_port[3] <--> Link_1Gbps <--> Switch_5_1_3_i0.up_port[3];
     Switch_5_2_0_i0.down_port[0] <--> Link_1Gbps <--> Server_5_2_0_0.port;
     Switch_5_2_0_i0.down_port[1] <--> Link_1Gbps <--> Server_5_2_0_1.port;
     Switch_5_2_0_i0.down_port[2] <--> Link_1Gbps <--> Server_5_2_0_2.port;
     Switch_5_2_0_i0.down_port[3] <--> Link_1Gbps <--> Server_5_2_0_3.port;
     Switch_5_2_1_i0.down_port[0] <--> Link_1Gbps <--> Server_5_2_1_0.port;
     Switch_5_2_1_i0.down_port[1] <--> Link_1Gbps <--> Server_5_2_1_1.port;
     Switch_5_2_1_i0.down_port[2] <--> Link_1Gbps <--> Server_5_2_1_2.port;
     Switch_5_2_1_i0.down_port[3] <--> Link_1Gbps <--> Server_5_2_1_3.port;
     Switch_5_2_2_i0.down_port[0] <--> Link_1Gbps <--> Server_5_2_2_0.port;
     Switch_5_2_2_i0.down_port[1] <--> Link_1Gbps <--> Server_5_2_2_1.port;
     Switch_5_2_2_i0.down_port[2] <--> Link_1Gbps <--> Server_5_2_2_2.port;
     Switch_5_2_2_i0.down_port[3] <--> Link_1Gbps <--> Server_5_2_2_3.port;
     Switch_5_2_3_i0.down_port[0] <--> Link_1Gbps <--> Server_5_2_3_0.port;
     Switch_5_2_3_i0.down_port[1] <--> Link_1Gbps <--> Server_5_2_3_1.port;
     Switch_5_2_3_i0.down_port[2] <--> Link_1Gbps <--> Server_5_2_3_2.port;
     Switch_5_2_3_i0.down_port[3] <--> Link_1Gbps <--> Server_5_2_3_3.port;
     Switch_5_2_i0.down_port[0] <--> Link_1Gbps <--> Switch_5_2_0_i0.up_port[0];
     Switch_5_2_i0.down_port[1] <--> Link_1Gbps <--> Switch_5_2_1_i0.up_port[0];
     Switch_5_2_i0.down_port[2] <--> Link_1Gbps <--> Switch_5_2_2_i0.up_port[0];
     Switch_5_2_i0.down_port[3] <--> Link_1Gbps <--> Switch_5_2_3_i0.up_port[0];
     Switch_5_2_i1.down_port[0] <--> Link_1Gbps <--> Switch_5_2_0_i0.up_port[1];
     Switch_5_2_i1.down_port[1] <--> Link_1Gbps <--> Switch_5_2_1_i0.up_port[1];
     Switch_5_2_i1.down_port[2] <--> Link_1Gbps <--> Switch_5_2_2_i0.up_port[1];
     Switch_5_2_i1.down_port[3] <--> Link_1Gbps <--> Switch_5_2_3_i0.up_port[1];
     Switch_5_2_i2.down_port[0] <--> Link_1Gbps <--> Switch_5_2_0_i0.up_port[2];
     Switch_5_2_i2.down_port[1] <--> Link_1Gbps <--> Switch_5_2_1_i0.up_port[2];
     Switch_5_2_i2.down_port[2] <--> Link_1Gbps <--> Switch_5_2_2_i0.up_port[2];
     Switch_5_2_i2.down_port[3] <--> Link_1Gbps <--> Switch_5_2_3_i0.up_port[2];
     Switch_5_2_i3.down_port[0] <--> Link_1Gbps <--> Switch_5_2_0_i0.up_port[3];
     Switch_5_2_i3.down_port[1] <--> Link_1Gbps <--> Switch_5_2_1_i0.up_port[3];
     Switch_5_2_i3.down_port[2] <--> Link_1Gbps <--> Switch_5_2_2_i0.up_port[3];
     Switch_5_2_i3.down_port[3] <--> Link_1Gbps <--> Switch_5_2_3_i0.up_port[3];
     Switch_5_3_0_i0.down_port[0] <--> Link_1Gbps <--> Server_5_3_0_0.port;
     Switch_5_3_0_i0.down_port[1] <--> Link_1Gbps <--> Server_5_3_0_1.port;
     Switch_5_3_0_i0.down_port[2] <--> Link_1Gbps <--> Server_5_3_0_2.port;
     Switch_5_3_0_i0.down_port[3] <--> Link_1Gbps <--> Server_5_3_0_3.port;
     Switch_5_3_1_i0.down_port[0] <--> Link_1Gbps <--> Server_5_3_1_0.port;
     Switch_5_3_1_i0.down_port[1] <--> Link_1Gbps <--> Server_5_3_1_1.port;
     Switch_5_3_1_i0.down_port[2] <--> Link_1Gbps <--> Server_5_3_1_2.port;
     Switch_5_3_1_i0.down_port[3] <--> Link_1Gbps <--> Server_5_3_1_3.port;
     Switch_5_3_2_i0.down_port[0] <--> Link_1Gbps <--> Server_5_3_2_0.port;
     Switch_5_3_2_i0.down_port[1] <--> Link_1Gbps <--> Server_5_3_2_1.port;
     Switch_5_3_2_i0.down_port[2] <--> Link_1Gbps <--> Server_5_3_2_2.port;
     Switch_5_3_2_i0.down_port[3] <--> Link_1Gbps <--> Server_5_3_2_3.port;
     Switch_5_3_3_i0.down_port[0] <--> Link_1Gbps <--> Server_5_3_3_0.port;
     Switch_5_3_3_i0.down_port[1] <--> Link_1Gbps <--> Server_5_3_3_1.port;
     Switch_5_3_3_i0.down_port[2] <--> Link_1Gbps <--> Server_5_3_3_2.port;
     Switch_5_3_3_i0.down_port[3] <--> Link_1Gbps <--> Server_5_3_3_3.port;
     Switch_5_3_i0.down_port[0] <--> Link_1Gbps <--> Switch_5_3_0_i0.up_port[0];
     Switch_5_3_i0.down_port[1] <--> Link_1Gbps <--> Switch_5_3_1_i0.up_port[0];
     Switch_5_3_i0.down_port[2] <--> Link_1Gbps <--> Switch_5_3_2_i0.up_port[0];
     Switch_5_3_i0.down_port[3] <--> Link_1Gbps <--> Switch_5_3_3_i0.up_port[0];
     Switch_5_3_i1.down_port[0] <--> Link_1Gbps <--> Switch_5_3_0_i0.up_port[1];
     Switch_5_3_i1.down_port[1] <--> Link_1Gbps <--> Switch_5_3_1_i0.up_port[1];
     Switch_5_3_i1.down_port[2] <--> Link_1Gbps <--> Switch_5_3_2_i0.up_port[1];
     Switch_5_3_i1.down_port[3] <--> Link_1Gbps <--> Switch_5_3_3_i0.up_port[1];
     Switch_5_3_i2.down_port[0] <--> Link_1Gbps <--> Switch_5_3_0_i0.up_port[2];
     Switch_5_3_i2.down_port[1] <--> Link_1Gbps <--> Switch_5_3_1_i0.up_port[2];
     Switch_5_3_i2.down_port[2] <--> Link_1Gbps <--> Switch_5_3_2_i0.up_port[2];
     Switch_5_3_i2.down_port[3] <--> Link_1Gbps <--> Switch_5_3_3_i0.up_port[2];
     Switch_5_3_i3.down_port[0] <--> Link_1Gbps <--> Switch_5_3_0_i0.up_port[3];
     Switch_5_3_i3.down_port[1] <--> Link_1Gbps <--> Switch_5_3_1_i0.up_port[3];
     Switch_5_3_i3.down_port[2] <--> Link_1Gbps <--> Switch_5_3_2_i0.up_port[3];
     Switch_5_3_i3.down_port[3] <--> Link_1Gbps <--> Switch_5_3_3_i0.up_port[3];
     Switch_5_i0.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i0.up_port[0];
     Switch_5_i0.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i0.up_port[0];
     Switch_5_i0.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i0.up_port[0];
     Switch_5_i0.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i0.up_port[0];
     Switch_5_i1.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i0.up_port[1];
     Switch_5_i1.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i0.up_port[1];
     Switch_5_i1.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i0.up_port[1];
     Switch_5_i1.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i0.up_port[1];
     Switch_5_i2.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i0.up_port[2];
     Switch_5_i2.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i0.up_port[2];
     Switch_5_i2.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i0.up_port[2];
     Switch_5_i2.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i0.up_port[2];
     Switch_5_i3.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i0.up_port[3];
     Switch_5_i3.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i0.up_port[3];
     Switch_5_i3.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i0.up_port[3];
     Switch_5_i3.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i0.up_port[3];
     Switch_5_i4.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i1.up_port[0];
     Switch_5_i4.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i1.up_port[0];
     Switch_5_i4.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i1.up_port[0];
     Switch_5_i4.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i1.up_port[0];
     Switch_5_i5.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i1.up_port[1];
     Switch_5_i5.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i1.up_port[1];
     Switch_5_i5.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i1.up_port[1];
     Switch_5_i5.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i1.up_port[1];
     Switch_5_i6.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i1.up_port[2];
     Switch_5_i6.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i1.up_port[2];
     Switch_5_i6.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i1.up_port[2];
     Switch_5_i6.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i1.up_port[2];
     Switch_5_i7.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i1.up_port[3];
     Switch_5_i7.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i1.up_port[3];
     Switch_5_i7.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i1.up_port[3];
     Switch_5_i7.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i1.up_port[3];
     Switch_5_i8.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i2.up_port[0];
     Switch_5_i8.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i2.up_port[0];
     Switch_5_i8.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i2.up_port[0];
     Switch_5_i8.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i2.up_port[0];
     Switch_5_i9.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i2.up_port[1];
     Switch_5_i9.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i2.up_port[1];
     Switch_5_i9.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i2.up_port[1];
     Switch_5_i9.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i2.up_port[1];
     Switch_5_i10.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i2.up_port[2];
     Switch_5_i10.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i2.up_port[2];
     Switch_5_i10.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i2.up_port[2];
     Switch_5_i10.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i2.up_port[2];
     Switch_5_i11.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i2.up_port[3];
     Switch_5_i11.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i2.up_port[3];
     Switch_5_i11.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i2.up_port[3];
     Switch_5_i11.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i2.up_port[3];
     Switch_5_i12.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i3.up_port[0];
     Switch_5_i12.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i3.up_port[0];
     Switch_5_i12.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i3.up_port[0];
     Switch_5_i12.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i3.up_port[0];
     Switch_5_i13.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i3.up_port[1];
     Switch_5_i13.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i3.up_port[1];
     Switch_5_i13.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i3.up_port[1];
     Switch_5_i13.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i3.up_port[1];
     Switch_5_i14.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i3.up_port[2];
     Switch_5_i14.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i3.up_port[2];
     Switch_5_i14.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i3.up_port[2];
     Switch_5_i14.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i3.up_port[2];
     Switch_5_i15.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i3.up_port[3];
     Switch_5_i15.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i3.up_port[3];
     Switch_5_i15.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i3.up_port[3];
     Switch_5_i15.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i3.up_port[3];
     Switch_6_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_6_0_0_0.port;
     Switch_6_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_6_0_0_1.port;
     Switch_6_0_0_i0.down_port[2] <--> Link_1Gbps <--> Server_6_0_0_2.port;
     Switch_6_0_0_i0.down_port[3] <--> Link_1Gbps <--> Server_6_0_0_3.port;
     Switch_6_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_6_0_1_0.port;
     Switch_6_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_6_0_1_1.port;
     Switch_6_0_1_i0.down_port[2] <--> Link_1Gbps <--> Server_6_0_1_2.port;
     Switch_6_0_1_i0.down_port[3] <--> Link_1Gbps <--> Server_6_0_1_3.port;
     Switch_6_0_2_i0.down_port[0] <--> Link_1Gbps <--> Server_6_0_2_0.port;
     Switch_6_0_2_i0.down_port[1] <--> Link_1Gbps <--> Server_6_0_2_1.port;
     Switch_6_0_2_i0.down_port[2] <--> Link_1Gbps <--> Server_6_0_2_2.port;
     Switch_6_0_2_i0.down_port[3] <--> Link_1Gbps <--> Server_6_0_2_3.port;
     Switch_6_0_3_i0.down_port[0] <--> Link_1Gbps <--> Server_6_0_3_0.port;
     Switch_6_0_3_i0.down_port[1] <--> Link_1Gbps <--> Server_6_0_3_1.port;
     Switch_6_0_3_i0.down_port[2] <--> Link_1Gbps <--> Server_6_0_3_2.port;
     Switch_6_0_3_i0.down_port[3] <--> Link_1Gbps <--> Server_6_0_3_3.port;
     Switch_6_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_6_0_0_i0.up_port[0];
     Switch_6_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_6_0_1_i0.up_port[0];
     Switch_6_0_i0.down_port[2] <--> Link_1Gbps <--> Switch_6_0_2_i0.up_port[0];
     Switch_6_0_i0.down_port[3] <--> Link_1Gbps <--> Switch_6_0_3_i0.up_port[0];
     Switch_6_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_6_0_0_i0.up_port[1];
     Switch_6_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_6_0_1_i0.up_port[1];
     Switch_6_0_i1.down_port[2] <--> Link_1Gbps <--> Switch_6_0_2_i0.up_port[1];
     Switch_6_0_i1.down_port[3] <--> Link_1Gbps <--> Switch_6_0_3_i0.up_port[1];
     Switch_6_0_i2.down_port[0] <--> Link_1Gbps <--> Switch_6_0_0_i0.up_port[2];
     Switch_6_0_i2.down_port[1] <--> Link_1Gbps <--> Switch_6_0_1_i0.up_port[2];
     Switch_6_0_i2.down_port[2] <--> Link_1Gbps <--> Switch_6_0_2_i0.up_port[2];
     Switch_6_0_i2.down_port[3] <--> Link_1Gbps <--> Switch_6_0_3_i0.up_port[2];
     Switch_6_0_i3.down_port[0] <--> Link_1Gbps <--> Switch_6_0_0_i0.up_port[3];
     Switch_6_0_i3.down_port[1] <--> Link_1Gbps <--> Switch_6_0_1_i0.up_port[3];
     Switch_6_0_i3.down_port[2] <--> Link_1Gbps <--> Switch_6_0_2_i0.up_port[3];
     Switch_6_0_i3.down_port[3] <--> Link_1Gbps <--> Switch_6_0_3_i0.up_port[3];
     Switch_6_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_6_1_0_0.port;
     Switch_6_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_6_1_0_1.port;
     Switch_6_1_0_i0.down_port[2] <--> Link_1Gbps <--> Server_6_1_0_2.port;
     Switch_6_1_0_i0.down_port[3] <--> Link_1Gbps <--> Server_6_1_0_3.port;
     Switch_6_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_6_1_1_0.port;
     Switch_6_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_6_1_1_1.port;
     Switch_6_1_1_i0.down_port[2] <--> Link_1Gbps <--> Server_6_1_1_2.port;
     Switch_6_1_1_i0.down_port[3] <--> Link_1Gbps <--> Server_6_1_1_3.port;
     Switch_6_1_2_i0.down_port[0] <--> Link_1Gbps <--> Server_6_1_2_0.port;
     Switch_6_1_2_i0.down_port[1] <--> Link_1Gbps <--> Server_6_1_2_1.port;
     Switch_6_1_2_i0.down_port[2] <--> Link_1Gbps <--> Server_6_1_2_2.port;
     Switch_6_1_2_i0.down_port[3] <--> Link_1Gbps <--> Server_6_1_2_3.port;
     Switch_6_1_3_i0.down_port[0] <--> Link_1Gbps <--> Server_6_1_3_0.port;
     Switch_6_1_3_i0.down_port[1] <--> Link_1Gbps <--> Server_6_1_3_1.port;
     Switch_6_1_3_i0.down_port[2] <--> Link_1Gbps <--> Server_6_1_3_2.port;
     Switch_6_1_3_i0.down_port[3] <--> Link_1Gbps <--> Server_6_1_3_3.port;
     Switch_6_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_6_1_0_i0.up_port[0];
     Switch_6_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_6_1_1_i0.up_port[0];
     Switch_6_1_i0.down_port[2] <--> Link_1Gbps <--> Switch_6_1_2_i0.up_port[0];
     Switch_6_1_i0.down_port[3] <--> Link_1Gbps <--> Switch_6_1_3_i0.up_port[0];
     Switch_6_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_6_1_0_i0.up_port[1];
     Switch_6_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_6_1_1_i0.up_port[1];
     Switch_6_1_i1.down_port[2] <--> Link_1Gbps <--> Switch_6_1_2_i0.up_port[1];
     Switch_6_1_i1.down_port[3] <--> Link_1Gbps <--> Switch_6_1_3_i0.up_port[1];
     Switch_6_1_i2.down_port[0] <--> Link_1Gbps <--> Switch_6_1_0_i0.up_port[2];
     Switch_6_1_i2.down_port[1] <--> Link_1Gbps <--> Switch_6_1_1_i0.up_port[2];
     Switch_6_1_i2.down_port[2] <--> Link_1Gbps <--> Switch_6_1_2_i0.up_port[2];
     Switch_6_1_i2.down_port[3] <--> Link_1Gbps <--> Switch_6_1_3_i0.up_port[2];
     Switch_6_1_i3.down_port[0] <--> Link_1Gbps <--> Switch_6_1_0_i0.up_port[3];
     Switch_6_1_i3.down_port[1] <--> Link_1Gbps <--> Switch_6_1_1_i0.up_port[3];
     Switch_6_1_i3.down_port[2] <--> Link_1Gbps <--> Switch_6_1_2_i0.up_port[3];
     Switch_6_1_i3.down_port[3] <--> Link_1Gbps <--> Switch_6_1_3_i0.up_port[3];
     Switch_6_2_0_i0.down_port[0] <--> Link_1Gbps <--> Server_6_2_0_0.port;
     Switch_6_2_0_i0.down_port[1] <--> Link_1Gbps <--> Server_6_2_0_1.port;
     Switch_6_2_0_i0.down_port[2] <--> Link_1Gbps <--> Server_6_2_0_2.port;
     Switch_6_2_0_i0.down_port[3] <--> Link_1Gbps <--> Server_6_2_0_3.port;
     Switch_6_2_1_i0.down_port[0] <--> Link_1Gbps <--> Server_6_2_1_0.port;
     Switch_6_2_1_i0.down_port[1] <--> Link_1Gbps <--> Server_6_2_1_1.port;
     Switch_6_2_1_i0.down_port[2] <--> Link_1Gbps <--> Server_6_2_1_2.port;
     Switch_6_2_1_i0.down_port[3] <--> Link_1Gbps <--> Server_6_2_1_3.port;
     Switch_6_2_2_i0.down_port[0] <--> Link_1Gbps <--> Server_6_2_2_0.port;
     Switch_6_2_2_i0.down_port[1] <--> Link_1Gbps <--> Server_6_2_2_1.port;
     Switch_6_2_2_i0.down_port[2] <--> Link_1Gbps <--> Server_6_2_2_2.port;
     Switch_6_2_2_i0.down_port[3] <--> Link_1Gbps <--> Server_6_2_2_3.port;
     Switch_6_2_3_i0.down_port[0] <--> Link_1Gbps <--> Server_6_2_3_0.port;
     Switch_6_2_3_i0.down_port[1] <--> Link_1Gbps <--> Server_6_2_3_1.port;
     Switch_6_2_3_i0.down_port[2] <--> Link_1Gbps <--> Server_6_2_3_2.port;
     Switch_6_2_3_i0.down_port[3] <--> Link_1Gbps <--> Server_6_2_3_3.port;
     Switch_6_2_i0.down_port[0] <--> Link_1Gbps <--> Switch_6_2_0_i0.up_port[0];
     Switch_6_2_i0.down_port[1] <--> Link_1Gbps <--> Switch_6_2_1_i0.up_port[0];
     Switch_6_2_i0.down_port[2] <--> Link_1Gbps <--> Switch_6_2_2_i0.up_port[0];
     Switch_6_2_i0.down_port[3] <--> Link_1Gbps <--> Switch_6_2_3_i0.up_port[0];
     Switch_6_2_i1.down_port[0] <--> Link_1Gbps <--> Switch_6_2_0_i0.up_port[1];
     Switch_6_2_i1.down_port[1] <--> Link_1Gbps <--> Switch_6_2_1_i0.up_port[1];
     Switch_6_2_i1.down_port[2] <--> Link_1Gbps <--> Switch_6_2_2_i0.up_port[1];
     Switch_6_2_i1.down_port[3] <--> Link_1Gbps <--> Switch_6_2_3_i0.up_port[1];
     Switch_6_2_i2.down_port[0] <--> Link_1Gbps <--> Switch_6_2_0_i0.up_port[2];
     Switch_6_2_i2.down_port[1] <--> Link_1Gbps <--> Switch_6_2_1_i0.up_port[2];
     Switch_6_2_i2.down_port[2] <--> Link_1Gbps <--> Switch_6_2_2_i0.up_port[2];
     Switch_6_2_i2.down_port[3] <--> Link_1Gbps <--> Switch_6_2_3_i0.up_port[2];
     Switch_6_2_i3.down_port[0] <--> Link_1Gbps <--> Switch_6_2_0_i0.up_port[3];
     Switch_6_2_i3.down_port[1] <--> Link_1Gbps <--> Switch_6_2_1_i0.up_port[3];
     Switch_6_2_i3.down_port[2] <--> Link_1Gbps <--> Switch_6_2_2_i0.up_port[3];
     Switch_6_2_i3.down_port[3] <--> Link_1Gbps <--> Switch_6_2_3_i0.up_port[3];
     Switch_6_3_0_i0.down_port[0] <--> Link_1Gbps <--> Server_6_3_0_0.port;
     Switch_6_3_0_i0.down_port[1] <--> Link_1Gbps <--> Server_6_3_0_1.port;
     Switch_6_3_0_i0.down_port[2] <--> Link_1Gbps <--> Server_6_3_0_2.port;
     Switch_6_3_0_i0.down_port[3] <--> Link_1Gbps <--> Server_6_3_0_3.port;
     Switch_6_3_1_i0.down_port[0] <--> Link_1Gbps <--> Server_6_3_1_0.port;
     Switch_6_3_1_i0.down_port[1] <--> Link_1Gbps <--> Server_6_3_1_1.port;
     Switch_6_3_1_i0.down_port[2] <--> Link_1Gbps <--> Server_6_3_1_2.port;
     Switch_6_3_1_i0.down_port[3] <--> Link_1Gbps <--> Server_6_3_1_3.port;
     Switch_6_3_2_i0.down_port[0] <--> Link_1Gbps <--> Server_6_3_2_0.port;
     Switch_6_3_2_i0.down_port[1] <--> Link_1Gbps <--> Server_6_3_2_1.port;
     Switch_6_3_2_i0.down_port[2] <--> Link_1Gbps <--> Server_6_3_2_2.port;
     Switch_6_3_2_i0.down_port[3] <--> Link_1Gbps <--> Server_6_3_2_3.port;
     Switch_6_3_3_i0.down_port[0] <--> Link_1Gbps <--> Server_6_3_3_0.port;
     Switch_6_3_3_i0.down_port[1] <--> Link_1Gbps <--> Server_6_3_3_1.port;
     Switch_6_3_3_i0.down_port[2] <--> Link_1Gbps <--> Server_6_3_3_2.port;
     Switch_6_3_3_i0.down_port[3] <--> Link_1Gbps <--> Server_6_3_3_3.port;
     Switch_6_3_i0.down_port[0] <--> Link_1Gbps <--> Switch_6_3_0_i0.up_port[0];
     Switch_6_3_i0.down_port[1] <--> Link_1Gbps <--> Switch_6_3_1_i0.up_port[0];
     Switch_6_3_i0.down_port[2] <--> Link_1Gbps <--> Switch_6_3_2_i0.up_port[0];
     Switch_6_3_i0.down_port[3] <--> Link_1Gbps <--> Switch_6_3_3_i0.up_port[0];
     Switch_6_3_i1.down_port[0] <--> Link_1Gbps <--> Switch_6_3_0_i0.up_port[1];
     Switch_6_3_i1.down_port[1] <--> Link_1Gbps <--> Switch_6_3_1_i0.up_port[1];
     Switch_6_3_i1.down_port[2] <--> Link_1Gbps <--> Switch_6_3_2_i0.up_port[1];
     Switch_6_3_i1.down_port[3] <--> Link_1Gbps <--> Switch_6_3_3_i0.up_port[1];
     Switch_6_3_i2.down_port[0] <--> Link_1Gbps <--> Switch_6_3_0_i0.up_port[2];
     Switch_6_3_i2.down_port[1] <--> Link_1Gbps <--> Switch_6_3_1_i0.up_port[2];
     Switch_6_3_i2.down_port[2] <--> Link_1Gbps <--> Switch_6_3_2_i0.up_port[2];
     Switch_6_3_i2.down_port[3] <--> Link_1Gbps <--> Switch_6_3_3_i0.up_port[2];
     Switch_6_3_i3.down_port[0] <--> Link_1Gbps <--> Switch_6_3_0_i0.up_port[3];
     Switch_6_3_i3.down_port[1] <--> Link_1Gbps <--> Switch_6_3_1_i0.up_port[3];
     Switch_6_3_i3.down_port[2] <--> Link_1Gbps <--> Switch_6_3_2_i0.up_port[3];
     Switch_6_3_i3.down_port[3] <--> Link_1Gbps <--> Switch_6_3_3_i0.up_port[3];
     Switch_6_i0.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i0.up_port[0];
     Switch_6_i0.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i0.up_port[0];
     Switch_6_i0.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i0.up_port[0];
     Switch_6_i0.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i0.up_port[0];
     Switch_6_i1.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i0.up_port[1];
     Switch_6_i1.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i0.up_port[1];
     Switch_6_i1.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i0.up_port[1];
     Switch_6_i1.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i0.up_port[1];
     Switch_6_i2.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i0.up_port[2];
     Switch_6_i2.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i0.up_port[2];
     Switch_6_i2.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i0.up_port[2];
     Switch_6_i2.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i0.up_port[2];
     Switch_6_i3.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i0.up_port[3];
     Switch_6_i3.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i0.up_port[3];
     Switch_6_i3.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i0.up_port[3];
     Switch_6_i3.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i0.up_port[3];
     Switch_6_i4.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i1.up_port[0];
     Switch_6_i4.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i1.up_port[0];
     Switch_6_i4.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i1.up_port[0];
     Switch_6_i4.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i1.up_port[0];
     Switch_6_i5.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i1.up_port[1];
     Switch_6_i5.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i1.up_port[1];
     Switch_6_i5.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i1.up_port[1];
     Switch_6_i5.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i1.up_port[1];
     Switch_6_i6.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i1.up_port[2];
     Switch_6_i6.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i1.up_port[2];
     Switch_6_i6.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i1.up_port[2];
     Switch_6_i6.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i1.up_port[2];
     Switch_6_i7.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i1.up_port[3];
     Switch_6_i7.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i1.up_port[3];
     Switch_6_i7.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i1.up_port[3];
     Switch_6_i7.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i1.up_port[3];
     Switch_6_i8.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i2.up_port[0];
     Switch_6_i8.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i2.up_port[0];
     Switch_6_i8.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i2.up_port[0];
     Switch_6_i8.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i2.up_port[0];
     Switch_6_i9.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i2.up_port[1];
     Switch_6_i9.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i2.up_port[1];
     Switch_6_i9.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i2.up_port[1];
     Switch_6_i9.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i2.up_port[1];
     Switch_6_i10.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i2.up_port[2];
     Switch_6_i10.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i2.up_port[2];
     Switch_6_i10.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i2.up_port[2];
     Switch_6_i10.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i2.up_port[2];
     Switch_6_i11.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i2.up_port[3];
     Switch_6_i11.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i2.up_port[3];
     Switch_6_i11.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i2.up_port[3];
     Switch_6_i11.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i2.up_port[3];
     Switch_6_i12.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i3.up_port[0];
     Switch_6_i12.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i3.up_port[0];
     Switch_6_i12.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i3.up_port[0];
     Switch_6_i12.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i3.up_port[0];
     Switch_6_i13.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i3.up_port[1];
     Switch_6_i13.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i3.up_port[1];
     Switch_6_i13.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i3.up_port[1];
     Switch_6_i13.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i3.up_port[1];
     Switch_6_i14.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i3.up_port[2];
     Switch_6_i14.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i3.up_port[2];
     Switch_6_i14.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i3.up_port[2];
     Switch_6_i14.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i3.up_port[2];
     Switch_6_i15.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i3.up_port[3];
     Switch_6_i15.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i3.up_port[3];
     Switch_6_i15.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i3.up_port[3];
     Switch_6_i15.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i3.up_port[3];
     Switch_7_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_7_0_0_0.port;
     Switch_7_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_7_0_0_1.port;
     Switch_7_0_0_i0.down_port[2] <--> Link_1Gbps <--> Server_7_0_0_2.port;
     Switch_7_0_0_i0.down_port[3] <--> Link_1Gbps <--> Server_7_0_0_3.port;
     Switch_7_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_7_0_1_0.port;
     Switch_7_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_7_0_1_1.port;
     Switch_7_0_1_i0.down_port[2] <--> Link_1Gbps <--> Server_7_0_1_2.port;
     Switch_7_0_1_i0.down_port[3] <--> Link_1Gbps <--> Server_7_0_1_3.port;
     Switch_7_0_2_i0.down_port[0] <--> Link_1Gbps <--> Server_7_0_2_0.port;
     Switch_7_0_2_i0.down_port[1] <--> Link_1Gbps <--> Server_7_0_2_1.port;
     Switch_7_0_2_i0.down_port[2] <--> Link_1Gbps <--> Server_7_0_2_2.port;
     Switch_7_0_2_i0.down_port[3] <--> Link_1Gbps <--> Server_7_0_2_3.port;
     Switch_7_0_3_i0.down_port[0] <--> Link_1Gbps <--> Server_7_0_3_0.port;
     Switch_7_0_3_i0.down_port[1] <--> Link_1Gbps <--> Server_7_0_3_1.port;
     Switch_7_0_3_i0.down_port[2] <--> Link_1Gbps <--> Server_7_0_3_2.port;
     Switch_7_0_3_i0.down_port[3] <--> Link_1Gbps <--> Server_7_0_3_3.port;
     Switch_7_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_7_0_0_i0.up_port[0];
     Switch_7_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_7_0_1_i0.up_port[0];
     Switch_7_0_i0.down_port[2] <--> Link_1Gbps <--> Switch_7_0_2_i0.up_port[0];
     Switch_7_0_i0.down_port[3] <--> Link_1Gbps <--> Switch_7_0_3_i0.up_port[0];
     Switch_7_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_7_0_0_i0.up_port[1];
     Switch_7_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_7_0_1_i0.up_port[1];
     Switch_7_0_i1.down_port[2] <--> Link_1Gbps <--> Switch_7_0_2_i0.up_port[1];
     Switch_7_0_i1.down_port[3] <--> Link_1Gbps <--> Switch_7_0_3_i0.up_port[1];
     Switch_7_0_i2.down_port[0] <--> Link_1Gbps <--> Switch_7_0_0_i0.up_port[2];
     Switch_7_0_i2.down_port[1] <--> Link_1Gbps <--> Switch_7_0_1_i0.up_port[2];
     Switch_7_0_i2.down_port[2] <--> Link_1Gbps <--> Switch_7_0_2_i0.up_port[2];
     Switch_7_0_i2.down_port[3] <--> Link_1Gbps <--> Switch_7_0_3_i0.up_port[2];
     Switch_7_0_i3.down_port[0] <--> Link_1Gbps <--> Switch_7_0_0_i0.up_port[3];
     Switch_7_0_i3.down_port[1] <--> Link_1Gbps <--> Switch_7_0_1_i0.up_port[3];
     Switch_7_0_i3.down_port[2] <--> Link_1Gbps <--> Switch_7_0_2_i0.up_port[3];
     Switch_7_0_i3.down_port[3] <--> Link_1Gbps <--> Switch_7_0_3_i0.up_port[3];
     Switch_7_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_7_1_0_0.port;
     Switch_7_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_7_1_0_1.port;
     Switch_7_1_0_i0.down_port[2] <--> Link_1Gbps <--> Server_7_1_0_2.port;
     Switch_7_1_0_i0.down_port[3] <--> Link_1Gbps <--> Server_7_1_0_3.port;
     Switch_7_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_7_1_1_0.port;
     Switch_7_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_7_1_1_1.port;
     Switch_7_1_1_i0.down_port[2] <--> Link_1Gbps <--> Server_7_1_1_2.port;
     Switch_7_1_1_i0.down_port[3] <--> Link_1Gbps <--> Server_7_1_1_3.port;
     Switch_7_1_2_i0.down_port[0] <--> Link_1Gbps <--> Server_7_1_2_0.port;
     Switch_7_1_2_i0.down_port[1] <--> Link_1Gbps <--> Server_7_1_2_1.port;
     Switch_7_1_2_i0.down_port[2] <--> Link_1Gbps <--> Server_7_1_2_2.port;
     Switch_7_1_2_i0.down_port[3] <--> Link_1Gbps <--> Server_7_1_2_3.port;
     Switch_7_1_3_i0.down_port[0] <--> Link_1Gbps <--> Server_7_1_3_0.port;
     Switch_7_1_3_i0.down_port[1] <--> Link_1Gbps <--> Server_7_1_3_1.port;
     Switch_7_1_3_i0.down_port[2] <--> Link_1Gbps <--> Server_7_1_3_2.port;
     Switch_7_1_3_i0.down_port[3] <--> Link_1Gbps <--> Server_7_1_3_3.port;
     Switch_7_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_7_1_0_i0.up_port[0];
     Switch_7_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_7_1_1_i0.up_port[0];
     Switch_7_1_i0.down_port[2] <--> Link_1Gbps <--> Switch_7_1_2_i0.up_port[0];
     Switch_7_1_i0.down_port[3] <--> Link_1Gbps <--> Switch_7_1_3_i0.up_port[0];
     Switch_7_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_7_1_0_i0.up_port[1];
     Switch_7_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_7_1_1_i0.up_port[1];
     Switch_7_1_i1.down_port[2] <--> Link_1Gbps <--> Switch_7_1_2_i0.up_port[1];
     Switch_7_1_i1.down_port[3] <--> Link_1Gbps <--> Switch_7_1_3_i0.up_port[1];
     Switch_7_1_i2.down_port[0] <--> Link_1Gbps <--> Switch_7_1_0_i0.up_port[2];
     Switch_7_1_i2.down_port[1] <--> Link_1Gbps <--> Switch_7_1_1_i0.up_port[2];
     Switch_7_1_i2.down_port[2] <--> Link_1Gbps <--> Switch_7_1_2_i0.up_port[2];
     Switch_7_1_i2.down_port[3] <--> Link_1Gbps <--> Switch_7_1_3_i0.up_port[2];
     Switch_7_1_i3.down_port[0] <--> Link_1Gbps <--> Switch_7_1_0_i0.up_port[3];
     Switch_7_1_i3.down_port[1] <--> Link_1Gbps <--> Switch_7_1_1_i0.up_port[3];
     Switch_7_1_i3.down_port[2] <--> Link_1Gbps <--> Switch_7_1_2_i0.up_port[3];
     Switch_7_1_i3.down_port[3] <--> Link_1Gbps <--> Switch_7_1_3_i0.up_port[3];
     Switch_7_2_0_i0.down_port[0] <--> Link_1Gbps <--> Server_7_2_0_0.port;
     Switch_7_2_0_i0.down_port[1] <--> Link_1Gbps <--> Server_7_2_0_1.port;
     Switch_7_2_0_i0.down_port[2] <--> Link_1Gbps <--> Server_7_2_0_2.port;
     Switch_7_2_0_i0.down_port[3] <--> Link_1Gbps <--> Server_7_2_0_3.port;
     Switch_7_2_1_i0.down_port[0] <--> Link_1Gbps <--> Server_7_2_1_0.port;
     Switch_7_2_1_i0.down_port[1] <--> Link_1Gbps <--> Server_7_2_1_1.port;
     Switch_7_2_1_i0.down_port[2] <--> Link_1Gbps <--> Server_7_2_1_2.port;
     Switch_7_2_1_i0.down_port[3] <--> Link_1Gbps <--> Server_7_2_1_3.port;
     Switch_7_2_2_i0.down_port[0] <--> Link_1Gbps <--> Server_7_2_2_0.port;
     Switch_7_2_2_i0.down_port[1] <--> Link_1Gbps <--> Server_7_2_2_1.port;
     Switch_7_2_2_i0.down_port[2] <--> Link_1Gbps <--> Server_7_2_2_2.port;
     Switch_7_2_2_i0.down_port[3] <--> Link_1Gbps <--> Server_7_2_2_3.port;
     Switch_7_2_3_i0.down_port[0] <--> Link_1Gbps <--> Server_7_2_3_0.port;
     Switch_7_2_3_i0.down_port[1] <--> Link_1Gbps <--> Server_7_2_3_1.port;
     Switch_7_2_3_i0.down_port[2] <--> Link_1Gbps <--> Server_7_2_3_2.port;
     Switch_7_2_3_i0.down_port[3] <--> Link_1Gbps <--> Server_7_2_3_3.port;
     Switch_7_2_i0.down_port[0] <--> Link_1Gbps <--> Switch_7_2_0_i0.up_port[0];
     Switch_7_2_i0.down_port[1] <--> Link_1Gbps <--> Switch_7_2_1_i0.up_port[0];
     Switch_7_2_i0.down_port[2] <--> Link_1Gbps <--> Switch_7_2_2_i0.up_port[0];
     Switch_7_2_i0.down_port[3] <--> Link_1Gbps <--> Switch_7_2_3_i0.up_port[0];
     Switch_7_2_i1.down_port[0] <--> Link_1Gbps <--> Switch_7_2_0_i0.up_port[1];
     Switch_7_2_i1.down_port[1] <--> Link_1Gbps <--> Switch_7_2_1_i0.up_port[1];
     Switch_7_2_i1.down_port[2] <--> Link_1Gbps <--> Switch_7_2_2_i0.up_port[1];
     Switch_7_2_i1.down_port[3] <--> Link_1Gbps <--> Switch_7_2_3_i0.up_port[1];
     Switch_7_2_i2.down_port[0] <--> Link_1Gbps <--> Switch_7_2_0_i0.up_port[2];
     Switch_7_2_i2.down_port[1] <--> Link_1Gbps <--> Switch_7_2_1_i0.up_port[2];
     Switch_7_2_i2.down_port[2] <--> Link_1Gbps <--> Switch_7_2_2_i0.up_port[2];
     Switch_7_2_i2.down_port[3] <--> Link_1Gbps <--> Switch_7_2_3_i0.up_port[2];
     Switch_7_2_i3.down_port[0] <--> Link_1Gbps <--> Switch_7_2_0_i0.up_port[3];
     Switch_7_2_i3.down_port[1] <--> Link_1Gbps <--> Switch_7_2_1_i0.up_port[3];
     Switch_7_2_i3.down_port[2] <--> Link_1Gbps <--> Switch_7_2_2_i0.up_port[3];
     Switch_7_2_i3.down_port[3] <--> Link_1Gbps <--> Switch_7_2_3_i0.up_port[3];
     Switch_7_3_0_i0.down_port[0] <--> Link_1Gbps <--> Server_7_3_0_0.port;
     Switch_7_3_0_i0.down_port[1] <--> Link_1Gbps <--> Server_7_3_0_1.port;
     Switch_7_3_0_i0.down_port[2] <--> Link_1Gbps <--> Server_7_3_0_2.port;
     Switch_7_3_0_i0.down_port[3] <--> Link_1Gbps <--> Server_7_3_0_3.port;
     Switch_7_3_1_i0.down_port[0] <--> Link_1Gbps <--> Server_7_3_1_0.port;
     Switch_7_3_1_i0.down_port[1] <--> Link_1Gbps <--> Server_7_3_1_1.port;
     Switch_7_3_1_i0.down_port[2] <--> Link_1Gbps <--> Server_7_3_1_2.port;
     Switch_7_3_1_i0.down_port[3] <--> Link_1Gbps <--> Server_7_3_1_3.port;
     Switch_7_3_2_i0.down_port[0] <--> Link_1Gbps <--> Server_7_3_2_0.port;
     Switch_7_3_2_i0.down_port[1] <--> Link_1Gbps <--> Server_7_3_2_1.port;
     Switch_7_3_2_i0.down_port[2] <--> Link_1Gbps <--> Server_7_3_2_2.port;
     Switch_7_3_2_i0.down_port[3] <--> Link_1Gbps <--> Server_7_3_2_3.port;
     Switch_7_3_3_i0.down_port[0] <--> Link_1Gbps <--> Server_7_3_3_0.port;
     Switch_7_3_3_i0.down_port[1] <--> Link_1Gbps <--> Server_7_3_3_1.port;
     Switch_7_3_3_i0.down_port[2] <--> Link_1Gbps <--> Server_7_3_3_2.port;
     Switch_7_3_3_i0.down_port[3] <--> Link_1Gbps <--> Server_7_3_3_3.port;
     Switch_7_3_i0.down_port[0] <--> Link_1Gbps <--> Switch_7_3_0_i0.up_port[0];
     Switch_7_3_i0.down_port[1] <--> Link_1Gbps <--> Switch_7_3_1_i0.up_port[0];
     Switch_7_3_i0.down_port[2] <--> Link_1Gbps <--> Switch_7_3_2_i0.up_port[0];
     Switch_7_3_i0.down_port[3] <--> Link_1Gbps <--> Switch_7_3_3_i0.up_port[0];
     Switch_7_3_i1.down_port[0] <--> Link_1Gbps <--> Switch_7_3_0_i0.up_port[1];
     Switch_7_3_i1.down_port[1] <--> Link_1Gbps <--> Switch_7_3_1_i0.up_port[1];
     Switch_7_3_i1.down_port[2] <--> Link_1Gbps <--> Switch_7_3_2_i0.up_port[1];
     Switch_7_3_i1.down_port[3] <--> Link_1Gbps <--> Switch_7_3_3_i0.up_port[1];
     Switch_7_3_i2.down_port[0] <--> Link_1Gbps <--> Switch_7_3_0_i0.up_port[2];
     Switch_7_3_i2.down_port[1] <--> Link_1Gbps <--> Switch_7_3_1_i0.up_port[2];
     Switch_7_3_i2.down_port[2] <--> Link_1Gbps <--> Switch_7_3_2_i0.up_port[2];
     Switch_7_3_i2.down_port[3] <--> Link_1Gbps <--> Switch_7_3_3_i0.up_port[2];
     Switch_7_3_i3.down_port[0] <--> Link_1Gbps <--> Switch_7_3_0_i0.up_port[3];
     Switch_7_3_i3.down_port[1] <--> Link_1Gbps <--> Switch_7_3_1_i0.up_port[3];
     Switch_7_3_i3.down_port[2] <--> Link_1Gbps <--> Switch_7_3_2_i0.up_port[3];
     Switch_7_3_i3.down_port[3] <--> Link_1Gbps <--> Switch_7_3_3_i0.up_port[3];
     Switch_7_i0.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i0.up_port[0];
     Switch_7_i0.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i0.up_port[0];
     Switch_7_i0.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i0.up_port[0];
     Switch_7_i0.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i0.up_port[0];
     Switch_7_i1.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i0.up_port[1];
     Switch_7_i1.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i0.up_port[1];
     Switch_7_i1.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i0.up_port[1];
     Switch_7_i1.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i0.up_port[1];
     Switch_7_i2.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i0.up_port[2];
     Switch_7_i2.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i0.up_port[2];
     Switch_7_i2.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i0.up_port[2];
     Switch_7_i2.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i0.up_port[2];
     Switch_7_i3.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i0.up_port[3];
     Switch_7_i3.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i0.up_port[3];
     Switch_7_i3.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i0.up_port[3];
     Switch_7_i3.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i0.up_port[3];
     Switch_7_i4.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i1.up_port[0];
     Switch_7_i4.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i1.up_port[0];
     Switch_7_i4.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i1.up_port[0];
     Switch_7_i4.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i1.up_port[0];
     Switch_7_i5.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i1.up_port[1];
     Switch_7_i5.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i1.up_port[1];
     Switch_7_i5.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i1.up_port[1];
     Switch_7_i5.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i1.up_port[1];
     Switch_7_i6.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i1.up_port[2];
     Switch_7_i6.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i1.up_port[2];
     Switch_7_i6.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i1.up_port[2];
     Switch_7_i6.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i1.up_port[2];
     Switch_7_i7.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i1.up_port[3];
     Switch_7_i7.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i1.up_port[3];
     Switch_7_i7.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i1.up_port[3];
     Switch_7_i7.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i1.up_port[3];
     Switch_7_i8.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i2.up_port[0];
     Switch_7_i8.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i2.up_port[0];
     Switch_7_i8.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i2.up_port[0];
     Switch_7_i8.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i2.up_port[0];
     Switch_7_i9.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i2.up_port[1];
     Switch_7_i9.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i2.up_port[1];
     Switch_7_i9.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i2.up_port[1];
     Switch_7_i9.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i2.up_port[1];
     Switch_7_i10.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i2.up_port[2];
     Switch_7_i10.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i2.up_port[2];
     Switch_7_i10.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i2.up_port[2];
     Switch_7_i10.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i2.up_port[2];
     Switch_7_i11.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i2.up_port[3];
     Switch_7_i11.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i2.up_port[3];
     Switch_7_i11.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i2.up_port[3];
     Switch_7_i11.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i2.up_port[3];
     Switch_7_i12.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i3.up_port[0];
     Switch_7_i12.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i3.up_port[0];
     Switch_7_i12.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i3.up_port[0];
     Switch_7_i12.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i3.up_port[0];
     Switch_7_i13.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i3.up_port[1];
     Switch_7_i13.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i3.up_port[1];
     Switch_7_i13.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i3.up_port[1];
     Switch_7_i13.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i3.up_port[1];
     Switch_7_i14.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i3.up_port[2];
     Switch_7_i14.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i3.up_port[2];
     Switch_7_i14.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i3.up_port[2];
     Switch_7_i14.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i3.up_port[2];
     Switch_7_i15.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i3.up_port[3];
     Switch_7_i15.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i3.up_port[3];
     Switch_7_i15.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i3.up_port[3];
     Switch_7_i15.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i3.up_port[3];
     Switch_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_i0.up_port[0];
     Switch_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_i0.up_port[0];
     Switch_i0.down_port[2] <--> Link_1Gbps <--> Switch_2_i0.up_port[0];
     Switch_i0.down_port[3] <--> Link_1Gbps <--> Switch_3_i0.up_port[0];
     Switch_i0.down_port[4] <--> Link_1Gbps <--> Switch_4_i0.up_port[0];
     Switch_i0.down_port[5] <--> Link_1Gbps <--> Switch_5_i0.up_port[0];
     Switch_i0.down_port[6] <--> Link_1Gbps <--> Switch_6_i0.up_port[0];
     Switch_i0.down_port[7] <--> Link_1Gbps <--> Switch_7_i0.up_port[0];
     Switch_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_i0.up_port[1];
     Switch_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_i0.up_port[1];
     Switch_i1.down_port[2] <--> Link_1Gbps <--> Switch_2_i0.up_port[1];
     Switch_i1.down_port[3] <--> Link_1Gbps <--> Switch_3_i0.up_port[1];
     Switch_i1.down_port[4] <--> Link_1Gbps <--> Switch_4_i0.up_port[1];
     Switch_i1.down_port[5] <--> Link_1Gbps <--> Switch_5_i0.up_port[1];
     Switch_i1.down_port[6] <--> Link_1Gbps <--> Switch_6_i0.up_port[1];
     Switch_i1.down_port[7] <--> Link_1Gbps <--> Switch_7_i0.up_port[1];
     Switch_i2.down_port[0] <--> Link_1Gbps <--> Switch_0_i0.up_port[2];
     Switch_i2.down_port[1] <--> Link_1Gbps <--> Switch_1_i0.up_port[2];
     Switch_i2.down_port[2] <--> Link_1Gbps <--> Switch_2_i0.up_port[2];
     Switch_i2.down_port[3] <--> Link_1Gbps <--> Switch_3_i0.up_port[2];
     Switch_i2.down_port[4] <--> Link_1Gbps <--> Switch_4_i0.up_port[2];
     Switch_i2.down_port[5] <--> Link_1Gbps <--> Switch_5_i0.up_port[2];
     Switch_i2.down_port[6] <--> Link_1Gbps <--> Switch_6_i0.up_port[2];
     Switch_i2.down_port[7] <--> Link_1Gbps <--> Switch_7_i0.up_port[2];
     Switch_i3.down_port[0] <--> Link_1Gbps <--> Switch_0_i0.up_port[3];
     Switch_i3.down_port[1] <--> Link_1Gbps <--> Switch_1_i0.up_port[3];
     Switch_i3.down_port[2] <--> Link_1Gbps <--> Switch_2_i0.up_port[3];
     Switch_i3.down_port[3] <--> Link_1Gbps <--> Switch_3_i0.up_port[3];
     Switch_i3.down_port[4] <--> Link_1Gbps <--> Switch_4_i0.up_port[3];
     Switch_i3.down_port[5] <--> Link_1Gbps <--> Switch_5_i0.up_port[3];
     Switch_i3.down_port[6] <--> Link_1Gbps <--> Switch_6_i0.up_port[3];
     Switch_i3.down_port[7] <--> Link_1Gbps <--> Switch_7_i0.up_port[3];
     Switch_i4.down_port[0] <--> Link_1Gbps <--> Switch_0_i1.up_port[0];
     Switch_i4.down_port[1] <--> Link_1Gbps <--> Switch_1_i1.up_port[0];
     Switch_i4.down_port[2] <--> Link_1Gbps <--> Switch_2_i1.up_port[0];
     Switch_i4.down_port[3] <--> Link_1Gbps <--> Switch_3_i1.up_port[0];
     Switch_i4.down_port[4] <--> Link_1Gbps <--> Switch_4_i1.up_port[0];
     Switch_i4.down_port[5] <--> Link_1Gbps <--> Switch_5_i1.up_port[0];
     Switch_i4.down_port[6] <--> Link_1Gbps <--> Switch_6_i1.up_port[0];
     Switch_i4.down_port[7] <--> Link_1Gbps <--> Switch_7_i1.up_port[0];
     Switch_i5.down_port[0] <--> Link_1Gbps <--> Switch_0_i1.up_port[1];
     Switch_i5.down_port[1] <--> Link_1Gbps <--> Switch_1_i1.up_port[1];
     Switch_i5.down_port[2] <--> Link_1Gbps <--> Switch_2_i1.up_port[1];
     Switch_i5.down_port[3] <--> Link_1Gbps <--> Switch_3_i1.up_port[1];
     Switch_i5.down_port[4] <--> Link_1Gbps <--> Switch_4_i1.up_port[1];
     Switch_i5.down_port[5] <--> Link_1Gbps <--> Switch_5_i1.up_port[1];
     Switch_i5.down_port[6] <--> Link_1Gbps <--> Switch_6_i1.up_port[1];
     Switch_i5.down_port[7] <--> Link_1Gbps <--> Switch_7_i1.up_port[1];
     Switch_i6.down_port[0] <--> Link_1Gbps <--> Switch_0_i1.up_port[2];
     Switch_i6.down_port[1] <--> Link_1Gbps <--> Switch_1_i1.up_port[2];
     Switch_i6.down_port[2] <--> Link_1Gbps <--> Switch_2_i1.up_port[2];
     Switch_i6.down_port[3] <--> Link_1Gbps <--> Switch_3_i1.up_port[2];
     Switch_i6.down_port[4] <--> Link_1Gbps <--> Switch_4_i1.up_port[2];
     Switch_i6.down_port[5] <--> Link_1Gbps <--> Switch_5_i1.up_port[2];
     Switch_i6.down_port[6] <--> Link_1Gbps <--> Switch_6_i1.up_port[2];
     Switch_i6.down_port[7] <--> Link_1Gbps <--> Switch_7_i1.up_port[2];
     Switch_i7.down_port[0] <--> Link_1Gbps <--> Switch_0_i1.up_port[3];
     Switch_i7.down_port[1] <--> Link_1Gbps <--> Switch_1_i1.up_port[3];
     Switch_i7.down_port[2] <--> Link_1Gbps <--> Switch_2_i1.up_port[3];
     Switch_i7.down_port[3] <--> Link_1Gbps <--> Switch_3_i1.up_port[3];
     Switch_i7.down_port[4] <--> Link_1Gbps <--> Switch_4_i1.up_port[3];
     Switch_i7.down_port[5] <--> Link_1Gbps <--> Switch_5_i1.up_port[3];
     Switch_i7.down_port[6] <--> Link_1Gbps <--> Switch_6_i1.up_port[3];
     Switch_i7.down_port[7] <--> Link_1Gbps <--> Switch_7_i1.up_port[3];
     Switch_i8.down_port[0] <--> Link_1Gbps <--> Switch_0_i2.up_port[0];
     Switch_i8.down_port[1] <--> Link_1Gbps <--> Switch_1_i2.up_port[0];
     Switch_i8.down_port[2] <--> Link_1Gbps <--> Switch_2_i2.up_port[0];
     Switch_i8.down_port[3] <--> Link_1Gbps <--> Switch_3_i2.up_port[0];
     Switch_i8.down_port[4] <--> Link_1Gbps <--> Switch_4_i2.up_port[0];
     Switch_i8.down_port[5] <--> Link_1Gbps <--> Switch_5_i2.up_port[0];
     Switch_i8.down_port[6] <--> Link_1Gbps <--> Switch_6_i2.up_port[0];
     Switch_i8.down_port[7] <--> Link_1Gbps <--> Switch_7_i2.up_port[0];
     Switch_i9.down_port[0] <--> Link_1Gbps <--> Switch_0_i2.up_port[1];
     Switch_i9.down_port[1] <--> Link_1Gbps <--> Switch_1_i2.up_port[1];
     Switch_i9.down_port[2] <--> Link_1Gbps <--> Switch_2_i2.up_port[1];
     Switch_i9.down_port[3] <--> Link_1Gbps <--> Switch_3_i2.up_port[1];
     Switch_i9.down_port[4] <--> Link_1Gbps <--> Switch_4_i2.up_port[1];
     Switch_i9.down_port[5] <--> Link_1Gbps <--> Switch_5_i2.up_port[1];
     Switch_i9.down_port[6] <--> Link_1Gbps <--> Switch_6_i2.up_port[1];
     Switch_i9.down_port[7] <--> Link_1Gbps <--> Switch_7_i2.up_port[1];
     Switch_i10.down_port[0] <--> Link_1Gbps <--> Switch_0_i2.up_port[2];
     Switch_i10.down_port[1] <--> Link_1Gbps <--> Switch_1_i2.up_port[2];
     Switch_i10.down_port[2] <--> Link_1Gbps <--> Switch_2_i2.up_port[2];
     Switch_i10.down_port[3] <--> Link_1Gbps <--> Switch_3_i2.up_port[2];
     Switch_i10.down_port[4] <--> Link_1Gbps <--> Switch_4_i2.up_port[2];
     Switch_i10.down_port[5] <--> Link_1Gbps <--> Switch_5_i2.up_port[2];
     Switch_i10.down_port[6] <--> Link_1Gbps <--> Switch_6_i2.up_port[2];
     Switch_i10.down_port[7] <--> Link_1Gbps <--> Switch_7_i2.up_port[2];
     Switch_i11.down_port[0] <--> Link_1Gbps <--> Switch_0_i2.up_port[3];
     Switch_i11.down_port[1] <--> Link_1Gbps <--> Switch_1_i2.up_port[3];
     Switch_i11.down_port[2] <--> Link_1Gbps <--> Switch_2_i2.up_port[3];
     Switch_i11.down_port[3] <--> Link_1Gbps <--> Switch_3_i2.up_port[3];
     Switch_i11.down_port[4] <--> Link_1Gbps <--> Switch_4_i2.up_port[3];
     Switch_i11.down_port[5] <--> Link_1Gbps <--> Switch_5_i2.up_port[3];
     Switch_i11.down_port[6] <--> Link_1Gbps <--> Switch_6_i2.up_port[3];
     Switch_i11.down_port[7] <--> Link_1Gbps <--> Switch_7_i2.up_port[3];
     Switch_i12.down_port[0] <--> Link_1Gbps <--> Switch_0_i3.up_port[0];
     Switch_i12.down_port[1] <--> Link_1Gbps <--> Switch_1_i3.up_port[0];
     Switch_i12.down_port[2] <--> Link_1Gbps <--> Switch_2_i3.up_port[0];
     Switch_i12.down_port[3] <--> Link_1Gbps <--> Switch_3_i3.up_port[0];
     Switch_i12.down_port[4] <--> Link_1Gbps <--> Switch_4_i3.up_port[0];
     Switch_i12.down_port[5] <--> Link_1Gbps <--> Switch_5_i3.up_port[0];
     Switch_i12.down_port[6] <--> Link_1Gbps <--> Switch_6_i3.up_port[0];
     Switch_i12.down_port[7] <--> Link_1Gbps <--> Switch_7_i3.up_port[0];
     Switch_i13.down_port[0] <--> Link_1Gbps <--> Switch_0_i3.up_port[1];
     Switch_i13.down_port[1] <--> Link_1Gbps <--> Switch_1_i3.up_port[1];
     Switch_i13.down_port[2] <--> Link_1Gbps <--> Switch_2_i3.up_port[1];
     Switch_i13.down_port[3] <--> Link_1Gbps <--> Switch_3_i3.up_port[1];
     Switch_i13.down_port[4] <--> Link_1Gbps <--> Switch_4_i3.up_port[1];
     Switch_i13.down_port[5] <--> Link_1Gbps <--> Switch_5_i3.up_port[1];
     Switch_i13.down_port[6] <--> Link_1Gbps <--> Switch_6_i3.up_port[1];
     Switch_i13.down_port[7] <--> Link_1Gbps <--> Switch_7_i3.up_port[1];
     Switch_i14.down_port[0] <--> Link_1Gbps <--> Switch_0_i3.up_port[2];
     Switch_i14.down_port[1] <--> Link_1Gbps <--> Switch_1_i3.up_port[2];
     Switch_i14.down_port[2] <--> Link_1Gbps <--> Switch_2_i3.up_port[2];
     Switch_i14.down_port[3] <--> Link_1Gbps <--> Switch_3_i3.up_port[2];
     Switch_i14.down_port[4] <--> Link_1Gbps <--> Switch_4_i3.up_port[2];
     Switch_i14.down_port[5] <--> Link_1Gbps <--> Switch_5_i3.up_port[2];
     Switch_i14.down_port[6] <--> Link_1Gbps <--> Switch_6_i3.up_port[2];
     Switch_i14.down_port[7] <--> Link_1Gbps <--> Switch_7_i3.up_port[2];
     Switch_i15.down_port[0] <--> Link_1Gbps <--> Switch_0_i3.up_port[3];
     Switch_i15.down_port[1] <--> Link_1Gbps <--> Switch_1_i3.up_port[3];
     Switch_i15.down_port[2] <--> Link_1Gbps <--> Switch_2_i3.up_port[3];
     Switch_i15.down_port[3] <--> Link_1Gbps <--> Switch_3_i3.up_port[3];
     Switch_i15.down_port[4] <--> Link_1Gbps <--> Switch_4_i3.up_port[3];
     Switch_i15.down_port[5] <--> Link_1Gbps <--> Switch_5_i3.up_port[3];
     Switch_i15.down_port[6] <--> Link_1Gbps <--> Switch_6_i3.up_port[3];
     Switch_i15.down_port[7] <--> Link_1Gbps <--> Switch_7_i3.up_port[3];
     Switch_i16.down_port[0] <--> Link_1Gbps <--> Switch_0_i4.up_port[0];
     Switch_i16.down_port[1] <--> Link_1Gbps <--> Switch_1_i4.up_port[0];
     Switch_i16.down_port[2] <--> Link_1Gbps <--> Switch_2_i4.up_port[0];
     Switch_i16.down_port[3] <--> Link_1Gbps <--> Switch_3_i4.up_port[0];
     Switch_i16.down_port[4] <--> Link_1Gbps <--> Switch_4_i4.up_port[0];
     Switch_i16.down_port[5] <--> Link_1Gbps <--> Switch_5_i4.up_port[0];
     Switch_i16.down_port[6] <--> Link_1Gbps <--> Switch_6_i4.up_port[0];
     Switch_i16.down_port[7] <--> Link_1Gbps <--> Switch_7_i4.up_port[0];
     Switch_i17.down_port[0] <--> Link_1Gbps <--> Switch_0_i4.up_port[1];
     Switch_i17.down_port[1] <--> Link_1Gbps <--> Switch_1_i4.up_port[1];
     Switch_i17.down_port[2] <--> Link_1Gbps <--> Switch_2_i4.up_port[1];
     Switch_i17.down_port[3] <--> Link_1Gbps <--> Switch_3_i4.up_port[1];
     Switch_i17.down_port[4] <--> Link_1Gbps <--> Switch_4_i4.up_port[1];
     Switch_i17.down_port[5] <--> Link_1Gbps <--> Switch_5_i4.up_port[1];
     Switch_i17.down_port[6] <--> Link_1Gbps <--> Switch_6_i4.up_port[1];
     Switch_i17.down_port[7] <--> Link_1Gbps <--> Switch_7_i4.up_port[1];
     Switch_i18.down_port[0] <--> Link_1Gbps <--> Switch_0_i4.up_port[2];
     Switch_i18.down_port[1] <--> Link_1Gbps <--> Switch_1_i4.up_port[2];
     Switch_i18.down_port[2] <--> Link_1Gbps <--> Switch_2_i4.up_port[2];
     Switch_i18.down_port[3] <--> Link_1Gbps <--> Switch_3_i4.up_port[2];
     Switch_i18.down_port[4] <--> Link_1Gbps <--> Switch_4_i4.up_port[2];
     Switch_i18.down_port[5] <--> Link_1Gbps <--> Switch_5_i4.up_port[2];
     Switch_i18.down_port[6] <--> Link_1Gbps <--> Switch_6_i4.up_port[2];
     Switch_i18.down_port[7] <--> Link_1Gbps <--> Switch_7_i4.up_port[2];
     Switch_i19.down_port[0] <--> Link_1Gbps <--> Switch_0_i4.up_port[3];
     Switch_i19.down_port[1] <--> Link_1Gbps <--> Switch_1_i4.up_port[3];
     Switch_i19.down_port[2] <--> Link_1Gbps <--> Switch_2_i4.up_port[3];
     Switch_i19.down_port[3] <--> Link_1Gbps <--> Switch_3_i4.up_port[3];
     Switch_i19.down_port[4] <--> Link_1Gbps <--> Switch_4_i4.up_port[3];
     Switch_i19.down_port[5] <--> Link_1Gbps <--> Switch_5_i4.up_port[3];
     Switch_i19.down_port[6] <--> Link_1Gbps <--> Switch_6_i4.up_port[3];
     Switch_i19.down_port[7] <--> Link_1Gbps <--> Switch_7_i4.up_port[3];
     Switch_i20.down_port[0] <--> Link_1Gbps <--> Switch_0_i5.up_port[0];
     Switch_i20.down_port[1] <--> Link_1Gbps <--> Switch_1_i5.up_port[0];
     Switch_i20.down_port[2] <--> Link_1Gbps <--> Switch_2_i5.up_port[0];
     Switch_i20.down_port[3] <--> Link_1Gbps <--> Switch_3_i5.up_port[0];
     Switch_i20.down_port[4] <--> Link_1Gbps <--> Switch_4_i5.up_port[0];
     Switch_i20.down_port[5] <--> Link_1Gbps <--> Switch_5_i5.up_port[0];
     Switch_i20.down_port[6] <--> Link_1Gbps <--> Switch_6_i5.up_port[0];
     Switch_i20.down_port[7] <--> Link_1Gbps <--> Switch_7_i5.up_port[0];
     Switch_i21.down_port[0] <--> Link_1Gbps <--> Switch_0_i5.up_port[1];
     Switch_i21.down_port[1] <--> Link_1Gbps <--> Switch_1_i5.up_port[1];
     Switch_i21.down_port[2] <--> Link_1Gbps <--> Switch_2_i5.up_port[1];
     Switch_i21.down_port[3] <--> Link_1Gbps <--> Switch_3_i5.up_port[1];
     Switch_i21.down_port[4] <--> Link_1Gbps <--> Switch_4_i5.up_port[1];
     Switch_i21.down_port[5] <--> Link_1Gbps <--> Switch_5_i5.up_port[1];
     Switch_i21.down_port[6] <--> Link_1Gbps <--> Switch_6_i5.up_port[1];
     Switch_i21.down_port[7] <--> Link_1Gbps <--> Switch_7_i5.up_port[1];
     Switch_i22.down_port[0] <--> Link_1Gbps <--> Switch_0_i5.up_port[2];
     Switch_i22.down_port[1] <--> Link_1Gbps <--> Switch_1_i5.up_port[2];
     Switch_i22.down_port[2] <--> Link_1Gbps <--> Switch_2_i5.up_port[2];
     Switch_i22.down_port[3] <--> Link_1Gbps <--> Switch_3_i5.up_port[2];
     Switch_i22.down_port[4] <--> Link_1Gbps <--> Switch_4_i5.up_port[2];
     Switch_i22.down_port[5] <--> Link_1Gbps <--> Switch_5_i5.up_port[2];
     Switch_i22.down_port[6] <--> Link_1Gbps <--> Switch_6_i5.up_port[2];
     Switch_i22.down_port[7] <--> Link_1Gbps <--> Switch_7_i5.up_port[2];
     Switch_i23.down_port[0] <--> Link_1Gbps <--> Switch_0_i5.up_port[3];
     Switch_i23.down_port[1] <--> Link_1Gbps <--> Switch_1_i5.up_port[3];
     Switch_i23.down_port[2] <--> Link_1Gbps <--> Switch_2_i5.up_port[3];
     Switch_i23.down_port[3] <--> Link_1Gbps <--> Switch_3_i5.up_port[3];
     Switch_i23.down_port[4] <--> Link_1Gbps <--> Switch_4_i5.up_port[3];
     Switch_i23.down_port[5] <--> Link_1Gbps <--> Switch_5_i5.up_port[3];
     Switch_i23.down_port[6] <--> Link_1Gbps <--> Switch_6_i5.up_port[3];
     Switch_i23.down_port[7] <--> Link_1Gbps <--> Switch_7_i5.up_port[3];
     Switch_i24.down_port[0] <--> Link_1Gbps <--> Switch_0_i6.up_port[0];
     Switch_i24.down_port[1] <--> Link_1Gbps <--> Switch_1_i6.up_port[0];
     Switch_i24.down_port[2] <--> Link_1Gbps <--> Switch_2_i6.up_port[0];
     Switch_i24.down_port[3] <--> Link_1Gbps <--> Switch_3_i6.up_port[0];
     Switch_i24.down_port[4] <--> Link_1Gbps <--> Switch_4_i6.up_port[0];
     Switch_i24.down_port[5] <--> Link_1Gbps <--> Switch_5_i6.up_port[0];
     Switch_i24.down_port[6] <--> Link_1Gbps <--> Switch_6_i6.up_port[0];
     Switch_i24.down_port[7] <--> Link_1Gbps <--> Switch_7_i6.up_port[0];
     Switch_i25.down_port[0] <--> Link_1Gbps <--> Switch_0_i6.up_port[1];
     Switch_i25.down_port[1] <--> Link_1Gbps <--> Switch_1_i6.up_port[1];
     Switch_i25.down_port[2] <--> Link_1Gbps <--> Switch_2_i6.up_port[1];
     Switch_i25.down_port[3] <--> Link_1Gbps <--> Switch_3_i6.up_port[1];
     Switch_i25.down_port[4] <--> Link_1Gbps <--> Switch_4_i6.up_port[1];
     Switch_i25.down_port[5] <--> Link_1Gbps <--> Switch_5_i6.up_port[1];
     Switch_i25.down_port[6] <--> Link_1Gbps <--> Switch_6_i6.up_port[1];
     Switch_i25.down_port[7] <--> Link_1Gbps <--> Switch_7_i6.up_port[1];
     Switch_i26.down_port[0] <--> Link_1Gbps <--> Switch_0_i6.up_port[2];
     Switch_i26.down_port[1] <--> Link_1Gbps <--> Switch_1_i6.up_port[2];
     Switch_i26.down_port[2] <--> Link_1Gbps <--> Switch_2_i6.up_port[2];
     Switch_i26.down_port[3] <--> Link_1Gbps <--> Switch_3_i6.up_port[2];
     Switch_i26.down_port[4] <--> Link_1Gbps <--> Switch_4_i6.up_port[2];
     Switch_i26.down_port[5] <--> Link_1Gbps <--> Switch_5_i6.up_port[2];
     Switch_i26.down_port[6] <--> Link_1Gbps <--> Switch_6_i6.up_port[2];
     Switch_i26.down_port[7] <--> Link_1Gbps <--> Switch_7_i6.up_port[2];
     Switch_i27.down_port[0] <--> Link_1Gbps <--> Switch_0_i6.up_port[3];
     Switch_i27.down_port[1] <--> Link_1Gbps <--> Switch_1_i6.up_port[3];
     Switch_i27.down_port[2] <--> Link_1Gbps <--> Switch_2_i6.up_port[3];
     Switch_i27.down_port[3] <--> Link_1Gbps <--> Switch_3_i6.up_port[3];
     Switch_i27.down_port[4] <--> Link_1Gbps <--> Switch_4_i6.up_port[3];
     Switch_i27.down_port[5] <--> Link_1Gbps <--> Switch_5_i6.up_port[3];
     Switch_i27.down_port[6] <--> Link_1Gbps <--> Switch_6_i6.up_port[3];
     Switch_i27.down_port[7] <--> Link_1Gbps <--> Switch_7_i6.up_port[3];
     Switch_i28.down_port[0] <--> Link_1Gbps <--> Switch_0_i7.up_port[0];
     Switch_i28.down_port[1] <--> Link_1Gbps <--> Switch_1_i7.up_port[0];
     Switch_i28.down_port[2] <--> Link_1Gbps <--> Switch_2_i7.up_port[0];
     Switch_i28.down_port[3] <--> Link_1Gbps <--> Switch_3_i7.up_port[0];
     Switch_i28.down_port[4] <--> Link_1Gbps <--> Switch_4_i7.up_port[0];
     Switch_i28.down_port[5] <--> Link_1Gbps <--> Switch_5_i7.up_port[0];
     Switch_i28.down_port[6] <--> Link_1Gbps <--> Switch_6_i7.up_port[0];
     Switch_i28.down_port[7] <--> Link_1Gbps <--> Switch_7_i7.up_port[0];
     Switch_i29.down_port[0] <--> Link_1Gbps <--> Switch_0_i7.up_port[1];
     Switch_i29.down_port[1] <--> Link_1Gbps <--> Switch_1_i7.up_port[1];
     Switch_i29.down_port[2] <--> Link_1Gbps <--> Switch_2_i7.up_port[1];
     Switch_i29.down_port[3] <--> Link_1Gbps <--> Switch_3_i7.up_port[1];
     Switch_i29.down_port[4] <--> Link_1Gbps <--> Switch_4_i7.up_port[1];
     Switch_i29.down_port[5] <--> Link_1Gbps <--> Switch_5_i7.up_port[1];
     Switch_i29.down_port[6] <--> Link_1Gbps <--> Switch_6_i7.up_port[1];
     Switch_i29.down_port[7] <--> Link_1Gbps <--> Switch_7_i7.up_port[1];
     Switch_i30.down_port[0] <--> Link_1Gbps <--> Switch_0_i7.up_port[2];
     Switch_i30.down_port[1] <--> Link_1Gbps <--> Switch_1_i7.up_port[2];
     Switch_i30.down_port[2] <--> Link_1Gbps <--> Switch_2_i7.up_port[2];
     Switch_i30.down_port[3] <--> Link_1Gbps <--> Switch_3_i7.up_port[2];
     Switch_i30.down_port[4] <--> Link_1Gbps <--> Switch_4_i7.up_port[2];
     Switch_i30.down_port[5] <--> Link_1Gbps <--> Switch_5_i7.up_port[2];
     Switch_i30.down_port[6] <--> Link_1Gbps <--> Switch_6_i7.up_port[2];
     Switch_i30.down_port[7] <--> Link_1Gbps <--> Switch_7_i7.up_port[2];
     Switch_i31.down_port[0] <--> Link_1Gbps <--> Switch_0_i7.up_port[3];
     Switch_i31.down_port[1] <--> Link_1Gbps <--> Switch_1_i7.up_port[3];
     Switch_i31.down_port[2] <--> Link_1Gbps <--> Switch_2_i7.up_port[3];
     Switch_i31.down_port[3] <--> Link_1Gbps <--> Switch_3_i7.up_port[3];
     Switch_i31.down_port[4] <--> Link_1Gbps <--> Switch_4_i7.up_port[3];
     Switch_i31.down_port[5] <--> Link_1Gbps <--> Switch_5_i7.up_port[3];
     Switch_i31.down_port[6] <--> Link_1Gbps <--> Switch_6_i7.up_port[3];
     Switch_i31.down_port[7] <--> Link_1Gbps <--> Switch_7_i7.up_port[3];
     Switch_i32.down_port[0] <--> Link_1Gbps <--> Switch_0_i8.up_port[0];
     Switch_i32.down_port[1] <--> Link_1Gbps <--> Switch_1_i8.up_port[0];
     Switch_i32.down_port[2] <--> Link_1Gbps <--> Switch_2_i8.up_port[0];
     Switch_i32.down_port[3] <--> Link_1Gbps <--> Switch_3_i8.up_port[0];
     Switch_i32.down_port[4] <--> Link_1Gbps <--> Switch_4_i8.up_port[0];
     Switch_i32.down_port[5] <--> Link_1Gbps <--> Switch_5_i8.up_port[0];
     Switch_i32.down_port[6] <--> Link_1Gbps <--> Switch_6_i8.up_port[0];
     Switch_i32.down_port[7] <--> Link_1Gbps <--> Switch_7_i8.up_port[0];
     Switch_i33.down_port[0] <--> Link_1Gbps <--> Switch_0_i8.up_port[1];
     Switch_i33.down_port[1] <--> Link_1Gbps <--> Switch_1_i8.up_port[1];
     Switch_i33.down_port[2] <--> Link_1Gbps <--> Switch_2_i8.up_port[1];
     Switch_i33.down_port[3] <--> Link_1Gbps <--> Switch_3_i8.up_port[1];
     Switch_i33.down_port[4] <--> Link_1Gbps <--> Switch_4_i8.up_port[1];
     Switch_i33.down_port[5] <--> Link_1Gbps <--> Switch_5_i8.up_port[1];
     Switch_i33.down_port[6] <--> Link_1Gbps <--> Switch_6_i8.up_port[1];
     Switch_i33.down_port[7] <--> Link_1Gbps <--> Switch_7_i8.up_port[1];
     Switch_i34.down_port[0] <--> Link_1Gbps <--> Switch_0_i8.up_port[2];
     Switch_i34.down_port[1] <--> Link_1Gbps <--> Switch_1_i8.up_port[2];
     Switch_i34.down_port[2] <--> Link_1Gbps <--> Switch_2_i8.up_port[2];
     Switch_i34.down_port[3] <--> Link_1Gbps <--> Switch_3_i8.up_port[2];
     Switch_i34.down_port[4] <--> Link_1Gbps <--> Switch_4_i8.up_port[2];
     Switch_i34.down_port[5] <--> Link_1Gbps <--> Switch_5_i8.up_port[2];
     Switch_i34.down_port[6] <--> Link_1Gbps <--> Switch_6_i8.up_port[2];
     Switch_i34.down_port[7] <--> Link_1Gbps <--> Switch_7_i8.up_port[2];
     Switch_i35.down_port[0] <--> Link_1Gbps <--> Switch_0_i8.up_port[3];
     Switch_i35.down_port[1] <--> Link_1Gbps <--> Switch_1_i8.up_port[3];
     Switch_i35.down_port[2] <--> Link_1Gbps <--> Switch_2_i8.up_port[3];
     Switch_i35.down_port[3] <--> Link_1Gbps <--> Switch_3_i8.up_port[3];
     Switch_i35.down_port[4] <--> Link_1Gbps <--> Switch_4_i8.up_port[3];
     Switch_i35.down_port[5] <--> Link_1Gbps <--> Switch_5_i8.up_port[3];
     Switch_i35.down_port[6] <--> Link_1Gbps <--> Switch_6_i8.up_port[3];
     Switch_i35.down_port[7] <--> Link_1Gbps <--> Switch_7_i8.up_port[3];
     Switch_i36.down_port[0] <--> Link_1Gbps <--> Switch_0_i9.up_port[0];
     Switch_i36.down_port[1] <--> Link_1Gbps <--> Switch_1_i9.up_port[0];
     Switch_i36.down_port[2] <--> Link_1Gbps <--> Switch_2_i9.up_port[0];
     Switch_i36.down_port[3] <--> Link_1Gbps <--> Switch_3_i9.up_port[0];
     Switch_i36.down_port[4] <--> Link_1Gbps <--> Switch_4_i9.up_port[0];
     Switch_i36.down_port[5] <--> Link_1Gbps <--> Switch_5_i9.up_port[0];
     Switch_i36.down_port[6] <--> Link_1Gbps <--> Switch_6_i9.up_port[0];
     Switch_i36.down_port[7] <--> Link_1Gbps <--> Switch_7_i9.up_port[0];
     Switch_i37.down_port[0] <--> Link_1Gbps <--> Switch_0_i9.up_port[1];
     Switch_i37.down_port[1] <--> Link_1Gbps <--> Switch_1_i9.up_port[1];
     Switch_i37.down_port[2] <--> Link_1Gbps <--> Switch_2_i9.up_port[1];
     Switch_i37.down_port[3] <--> Link_1Gbps <--> Switch_3_i9.up_port[1];
     Switch_i37.down_port[4] <--> Link_1Gbps <--> Switch_4_i9.up_port[1];
     Switch_i37.down_port[5] <--> Link_1Gbps <--> Switch_5_i9.up_port[1];
     Switch_i37.down_port[6] <--> Link_1Gbps <--> Switch_6_i9.up_port[1];
     Switch_i37.down_port[7] <--> Link_1Gbps <--> Switch_7_i9.up_port[1];
     Switch_i38.down_port[0] <--> Link_1Gbps <--> Switch_0_i9.up_port[2];
     Switch_i38.down_port[1] <--> Link_1Gbps <--> Switch_1_i9.up_port[2];
     Switch_i38.down_port[2] <--> Link_1Gbps <--> Switch_2_i9.up_port[2];
     Switch_i38.down_port[3] <--> Link_1Gbps <--> Switch_3_i9.up_port[2];
     Switch_i38.down_port[4] <--> Link_1Gbps <--> Switch_4_i9.up_port[2];
     Switch_i38.down_port[5] <--> Link_1Gbps <--> Switch_5_i9.up_port[2];
     Switch_i38.down_port[6] <--> Link_1Gbps <--> Switch_6_i9.up_port[2];
     Switch_i38.down_port[7] <--> Link_1Gbps <--> Switch_7_i9.up_port[2];
     Switch_i39.down_port[0] <--> Link_1Gbps <--> Switch_0_i9.up_port[3];
     Switch_i39.down_port[1] <--> Link_1Gbps <--> Switch_1_i9.up_port[3];
     Switch_i39.down_port[2] <--> Link_1Gbps <--> Switch_2_i9.up_port[3];
     Switch_i39.down_port[3] <--> Link_1Gbps <--> Switch_3_i9.up_port[3];
     Switch_i39.down_port[4] <--> Link_1Gbps <--> Switch_4_i9.up_port[3];
     Switch_i39.down_port[5] <--> Link_1Gbps <--> Switch_5_i9.up_port[3];
     Switch_i39.down_port[6] <--> Link_1Gbps <--> Switch_6_i9.up_port[3];
     Switch_i39.down_port[7] <--> Link_1Gbps <--> Switch_7_i9.up_port[3];
     Switch_i40.down_port[0] <--> Link_1Gbps <--> Switch_0_i10.up_port[0];
     Switch_i40.down_port[1] <--> Link_1Gbps <--> Switch_1_i10.up_port[0];
     Switch_i40.down_port[2] <--> Link_1Gbps <--> Switch_2_i10.up_port[0];
     Switch_i40.down_port[3] <--> Link_1Gbps <--> Switch_3_i10.up_port[0];
     Switch_i40.down_port[4] <--> Link_1Gbps <--> Switch_4_i10.up_port[0];
     Switch_i40.down_port[5] <--> Link_1Gbps <--> Switch_5_i10.up_port[0];
     Switch_i40.down_port[6] <--> Link_1Gbps <--> Switch_6_i10.up_port[0];
     Switch_i40.down_port[7] <--> Link_1Gbps <--> Switch_7_i10.up_port[0];
     Switch_i41.down_port[0] <--> Link_1Gbps <--> Switch_0_i10.up_port[1];
     Switch_i41.down_port[1] <--> Link_1Gbps <--> Switch_1_i10.up_port[1];
     Switch_i41.down_port[2] <--> Link_1Gbps <--> Switch_2_i10.up_port[1];
     Switch_i41.down_port[3] <--> Link_1Gbps <--> Switch_3_i10.up_port[1];
     Switch_i41.down_port[4] <--> Link_1Gbps <--> Switch_4_i10.up_port[1];
     Switch_i41.down_port[5] <--> Link_1Gbps <--> Switch_5_i10.up_port[1];
     Switch_i41.down_port[6] <--> Link_1Gbps <--> Switch_6_i10.up_port[1];
     Switch_i41.down_port[7] <--> Link_1Gbps <--> Switch_7_i10.up_port[1];
     Switch_i42.down_port[0] <--> Link_1Gbps <--> Switch_0_i10.up_port[2];
     Switch_i42.down_port[1] <--> Link_1Gbps <--> Switch_1_i10.up_port[2];
     Switch_i42.down_port[2] <--> Link_1Gbps <--> Switch_2_i10.up_port[2];
     Switch_i42.down_port[3] <--> Link_1Gbps <--> Switch_3_i10.up_port[2];
     Switch_i42.down_port[4] <--> Link_1Gbps <--> Switch_4_i10.up_port[2];
     Switch_i42.down_port[5] <--> Link_1Gbps <--> Switch_5_i10.up_port[2];
     Switch_i42.down_port[6] <--> Link_1Gbps <--> Switch_6_i10.up_port[2];
     Switch_i42.down_port[7] <--> Link_1Gbps <--> Switch_7_i10.up_port[2];
     Switch_i43.down_port[0] <--> Link_1Gbps <--> Switch_0_i10.up_port[3];
     Switch_i43.down_port[1] <--> Link_1Gbps <--> Switch_1_i10.up_port[3];
     Switch_i43.down_port[2] <--> Link_1Gbps <--> Switch_2_i10.up_port[3];
     Switch_i43.down_port[3] <--> Link_1Gbps <--> Switch_3_i10.up_port[3];
     Switch_i43.down_port[4] <--> Link_1Gbps <--> Switch_4_i10.up_port[3];
     Switch_i43.down_port[5] <--> Link_1Gbps <--> Switch_5_i10.up_port[3];
     Switch_i43.down_port[6] <--> Link_1Gbps <--> Switch_6_i10.up_port[3];
     Switch_i43.down_port[7] <--> Link_1Gbps <--> Switch_7_i10.up_port[3];
     Switch_i44.down_port[0] <--> Link_1Gbps <--> Switch_0_i11.up_port[0];
     Switch_i44.down_port[1] <--> Link_1Gbps <--> Switch_1_i11.up_port[0];
     Switch_i44.down_port[2] <--> Link_1Gbps <--> Switch_2_i11.up_port[0];
     Switch_i44.down_port[3] <--> Link_1Gbps <--> Switch_3_i11.up_port[0];
     Switch_i44.down_port[4] <--> Link_1Gbps <--> Switch_4_i11.up_port[0];
     Switch_i44.down_port[5] <--> Link_1Gbps <--> Switch_5_i11.up_port[0];
     Switch_i44.down_port[6] <--> Link_1Gbps <--> Switch_6_i11.up_port[0];
     Switch_i44.down_port[7] <--> Link_1Gbps <--> Switch_7_i11.up_port[0];
     Switch_i45.down_port[0] <--> Link_1Gbps <--> Switch_0_i11.up_port[1];
     Switch_i45.down_port[1] <--> Link_1Gbps <--> Switch_1_i11.up_port[1];
     Switch_i45.down_port[2] <--> Link_1Gbps <--> Switch_2_i11.up_port[1];
     Switch_i45.down_port[3] <--> Link_1Gbps <--> Switch_3_i11.up_port[1];
     Switch_i45.down_port[4] <--> Link_1Gbps <--> Switch_4_i11.up_port[1];
     Switch_i45.down_port[5] <--> Link_1Gbps <--> Switch_5_i11.up_port[1];
     Switch_i45.down_port[6] <--> Link_1Gbps <--> Switch_6_i11.up_port[1];
     Switch_i45.down_port[7] <--> Link_1Gbps <--> Switch_7_i11.up_port[1];
     Switch_i46.down_port[0] <--> Link_1Gbps <--> Switch_0_i11.up_port[2];
     Switch_i46.down_port[1] <--> Link_1Gbps <--> Switch_1_i11.up_port[2];
     Switch_i46.down_port[2] <--> Link_1Gbps <--> Switch_2_i11.up_port[2];
     Switch_i46.down_port[3] <--> Link_1Gbps <--> Switch_3_i11.up_port[2];
     Switch_i46.down_port[4] <--> Link_1Gbps <--> Switch_4_i11.up_port[2];
     Switch_i46.down_port[5] <--> Link_1Gbps <--> Switch_5_i11.up_port[2];
     Switch_i46.down_port[6] <--> Link_1Gbps <--> Switch_6_i11.up_port[2];
     Switch_i46.down_port[7] <--> Link_1Gbps <--> Switch_7_i11.up_port[2];
     Switch_i47.down_port[0] <--> Link_1Gbps <--> Switch_0_i11.up_port[3];
     Switch_i47.down_port[1] <--> Link_1Gbps <--> Switch_1_i11.up_port[3];
     Switch_i47.down_port[2] <--> Link_1Gbps <--> Switch_2_i11.up_port[3];
     Switch_i47.down_port[3] <--> Link_1Gbps <--> Switch_3_i11.up_port[3];
     Switch_i47.down_port[4] <--> Link_1Gbps <--> Switch_4_i11.up_port[3];
     Switch_i47.down_port[5] <--> Link_1Gbps <--> Switch_5_i11.up_port[3];
     Switch_i47.down_port[6] <--> Link_1Gbps <--> Switch_6_i11.up_port[3];
     Switch_i47.down_port[7] <--> Link_1Gbps <--> Switch_7_i11.up_port[3];
     Switch_i48.down_port[0] <--> Link_1Gbps <--> Switch_0_i12.up_port[0];
     Switch_i48.down_port[1] <--> Link_1Gbps <--> Switch_1_i12.up_port[0];
     Switch_i48.down_port[2] <--> Link_1Gbps <--> Switch_2_i12.up_port[0];
     Switch_i48.down_port[3] <--> Link_1Gbps <--> Switch_3_i12.up_port[0];
     Switch_i48.down_port[4] <--> Link_1Gbps <--> Switch_4_i12.up_port[0];
     Switch_i48.down_port[5] <--> Link_1Gbps <--> Switch_5_i12.up_port[0];
     Switch_i48.down_port[6] <--> Link_1Gbps <--> Switch_6_i12.up_port[0];
     Switch_i48.down_port[7] <--> Link_1Gbps <--> Switch_7_i12.up_port[0];
     Switch_i49.down_port[0] <--> Link_1Gbps <--> Switch_0_i12.up_port[1];
     Switch_i49.down_port[1] <--> Link_1Gbps <--> Switch_1_i12.up_port[1];
     Switch_i49.down_port[2] <--> Link_1Gbps <--> Switch_2_i12.up_port[1];
     Switch_i49.down_port[3] <--> Link_1Gbps <--> Switch_3_i12.up_port[1];
     Switch_i49.down_port[4] <--> Link_1Gbps <--> Switch_4_i12.up_port[1];
     Switch_i49.down_port[5] <--> Link_1Gbps <--> Switch_5_i12.up_port[1];
     Switch_i49.down_port[6] <--> Link_1Gbps <--> Switch_6_i12.up_port[1];
     Switch_i49.down_port[7] <--> Link_1Gbps <--> Switch_7_i12.up_port[1];
     Switch_i50.down_port[0] <--> Link_1Gbps <--> Switch_0_i12.up_port[2];
     Switch_i50.down_port[1] <--> Link_1Gbps <--> Switch_1_i12.up_port[2];
     Switch_i50.down_port[2] <--> Link_1Gbps <--> Switch_2_i12.up_port[2];
     Switch_i50.down_port[3] <--> Link_1Gbps <--> Switch_3_i12.up_port[2];
     Switch_i50.down_port[4] <--> Link_1Gbps <--> Switch_4_i12.up_port[2];
     Switch_i50.down_port[5] <--> Link_1Gbps <--> Switch_5_i12.up_port[2];
     Switch_i50.down_port[6] <--> Link_1Gbps <--> Switch_6_i12.up_port[2];
     Switch_i50.down_port[7] <--> Link_1Gbps <--> Switch_7_i12.up_port[2];
     Switch_i51.down_port[0] <--> Link_1Gbps <--> Switch_0_i12.up_port[3];
     Switch_i51.down_port[1] <--> Link_1Gbps <--> Switch_1_i12.up_port[3];
     Switch_i51.down_port[2] <--> Link_1Gbps <--> Switch_2_i12.up_port[3];
     Switch_i51.down_port[3] <--> Link_1Gbps <--> Switch_3_i12.up_port[3];
     Switch_i51.down_port[4] <--> Link_1Gbps <--> Switch_4_i12.up_port[3];
     Switch_i51.down_port[5] <--> Link_1Gbps <--> Switch_5_i12.up_port[3];
     Switch_i51.down_port[6] <--> Link_1Gbps <--> Switch_6_i12.up_port[3];
     Switch_i51.down_port[7] <--> Link_1Gbps <--> Switch_7_i12.up_port[3];
     Switch_i52.down_port[0] <--> Link_1Gbps <--> Switch_0_i13.up_port[0];
     Switch_i52.down_port[1] <--> Link_1Gbps <--> Switch_1_i13.up_port[0];
     Switch_i52.down_port[2] <--> Link_1Gbps <--> Switch_2_i13.up_port[0];
     Switch_i52.down_port[3] <--> Link_1Gbps <--> Switch_3_i13.up_port[0];
     Switch_i52.down_port[4] <--> Link_1Gbps <--> Switch_4_i13.up_port[0];
     Switch_i52.down_port[5] <--> Link_1Gbps <--> Switch_5_i13.up_port[0];
     Switch_i52.down_port[6] <--> Link_1Gbps <--> Switch_6_i13.up_port[0];
     Switch_i52.down_port[7] <--> Link_1Gbps <--> Switch_7_i13.up_port[0];
     Switch_i53.down_port[0] <--> Link_1Gbps <--> Switch_0_i13.up_port[1];
     Switch_i53.down_port[1] <--> Link_1Gbps <--> Switch_1_i13.up_port[1];
     Switch_i53.down_port[2] <--> Link_1Gbps <--> Switch_2_i13.up_port[1];
     Switch_i53.down_port[3] <--> Link_1Gbps <--> Switch_3_i13.up_port[1];
     Switch_i53.down_port[4] <--> Link_1Gbps <--> Switch_4_i13.up_port[1];
     Switch_i53.down_port[5] <--> Link_1Gbps <--> Switch_5_i13.up_port[1];
     Switch_i53.down_port[6] <--> Link_1Gbps <--> Switch_6_i13.up_port[1];
     Switch_i53.down_port[7] <--> Link_1Gbps <--> Switch_7_i13.up_port[1];
     Switch_i54.down_port[0] <--> Link_1Gbps <--> Switch_0_i13.up_port[2];
     Switch_i54.down_port[1] <--> Link_1Gbps <--> Switch_1_i13.up_port[2];
     Switch_i54.down_port[2] <--> Link_1Gbps <--> Switch_2_i13.up_port[2];
     Switch_i54.down_port[3] <--> Link_1Gbps <--> Switch_3_i13.up_port[2];
     Switch_i54.down_port[4] <--> Link_1Gbps <--> Switch_4_i13.up_port[2];
     Switch_i54.down_port[5] <--> Link_1Gbps <--> Switch_5_i13.up_port[2];
     Switch_i54.down_port[6] <--> Link_1Gbps <--> Switch_6_i13.up_port[2];
     Switch_i54.down_port[7] <--> Link_1Gbps <--> Switch_7_i13.up_port[2];
     Switch_i55.down_port[0] <--> Link_1Gbps <--> Switch_0_i13.up_port[3];
     Switch_i55.down_port[1] <--> Link_1Gbps <--> Switch_1_i13.up_port[3];
     Switch_i55.down_port[2] <--> Link_1Gbps <--> Switch_2_i13.up_port[3];
     Switch_i55.down_port[3] <--> Link_1Gbps <--> Switch_3_i13.up_port[3];
     Switch_i55.down_port[4] <--> Link_1Gbps <--> Switch_4_i13.up_port[3];
     Switch_i55.down_port[5] <--> Link_1Gbps <--> Switch_5_i13.up_port[3];
     Switch_i55.down_port[6] <--> Link_1Gbps <--> Switch_6_i13.up_port[3];
     Switch_i55.down_port[7] <--> Link_1Gbps <--> Switch_7_i13.up_port[3];
     Switch_i56.down_port[0] <--> Link_1Gbps <--> Switch_0_i14.up_port[0];
     Switch_i56.down_port[1] <--> Link_1Gbps <--> Switch_1_i14.up_port[0];
     Switch_i56.down_port[2] <--> Link_1Gbps <--> Switch_2_i14.up_port[0];
     Switch_i56.down_port[3] <--> Link_1Gbps <--> Switch_3_i14.up_port[0];
     Switch_i56.down_port[4] <--> Link_1Gbps <--> Switch_4_i14.up_port[0];
     Switch_i56.down_port[5] <--> Link_1Gbps <--> Switch_5_i14.up_port[0];
     Switch_i56.down_port[6] <--> Link_1Gbps <--> Switch_6_i14.up_port[0];
     Switch_i56.down_port[7] <--> Link_1Gbps <--> Switch_7_i14.up_port[0];
     Switch_i57.down_port[0] <--> Link_1Gbps <--> Switch_0_i14.up_port[1];
     Switch_i57.down_port[1] <--> Link_1Gbps <--> Switch_1_i14.up_port[1];
     Switch_i57.down_port[2] <--> Link_1Gbps <--> Switch_2_i14.up_port[1];
     Switch_i57.down_port[3] <--> Link_1Gbps <--> Switch_3_i14.up_port[1];
     Switch_i57.down_port[4] <--> Link_1Gbps <--> Switch_4_i14.up_port[1];
     Switch_i57.down_port[5] <--> Link_1Gbps <--> Switch_5_i14.up_port[1];
     Switch_i57.down_port[6] <--> Link_1Gbps <--> Switch_6_i14.up_port[1];
     Switch_i57.down_port[7] <--> Link_1Gbps <--> Switch_7_i14.up_port[1];
     Switch_i58.down_port[0] <--> Link_1Gbps <--> Switch_0_i14.up_port[2];
     Switch_i58.down_port[1] <--> Link_1Gbps <--> Switch_1_i14.up_port[2];
     Switch_i58.down_port[2] <--> Link_1Gbps <--> Switch_2_i14.up_port[2];
     Switch_i58.down_port[3] <--> Link_1Gbps <--> Switch_3_i14.up_port[2];
     Switch_i58.down_port[4] <--> Link_1Gbps <--> Switch_4_i14.up_port[2];
     Switch_i58.down_port[5] <--> Link_1Gbps <--> Switch_5_i14.up_port[2];
     Switch_i58.down_port[6] <--> Link_1Gbps <--> Switch_6_i14.up_port[2];
     Switch_i58.down_port[7] <--> Link_1Gbps <--> Switch_7_i14.up_port[2];
     Switch_i59.down_port[0] <--> Link_1Gbps <--> Switch_0_i14.up_port[3];
     Switch_i59.down_port[1] <--> Link_1Gbps <--> Switch_1_i14.up_port[3];
     Switch_i59.down_port[2] <--> Link_1Gbps <--> Switch_2_i14.up_port[3];
     Switch_i59.down_port[3] <--> Link_1Gbps <--> Switch_3_i14.up_port[3];
     Switch_i59.down_port[4] <--> Link_1Gbps <--> Switch_4_i14.up_port[3];
     Switch_i59.down_port[5] <--> Link_1Gbps <--> Switch_5_i14.up_port[3];
     Switch_i59.down_port[6] <--> Link_1Gbps <--> Switch_6_i14.up_port[3];
     Switch_i59.down_port[7] <--> Link_1Gbps <--> Switch_7_i14.up_port[3];
     Switch_i60.down_port[0] <--> Link_1Gbps <--> Switch_0_i15.up_port[0];
     Switch_i60.down_port[1] <--> Link_1Gbps <--> Switch_1_i15.up_port[0];
     Switch_i60.down_port[2] <--> Link_1Gbps <--> Switch_2_i15.up_port[0];
     Switch_i60.down_port[3] <--> Link_1Gbps <--> Switch_3_i15.up_port[0];
     Switch_i60.down_port[4] <--> Link_1Gbps <--> Switch_4_i15.up_port[0];
     Switch_i60.down_port[5] <--> Link_1Gbps <--> Switch_5_i15.up_port[0];
     Switch_i60.down_port[6] <--> Link_1Gbps <--> Switch_6_i15.up_port[0];
     Switch_i60.down_port[7] <--> Link_1Gbps <--> Switch_7_i15.up_port[0];
     Switch_i61.down_port[0] <--> Link_1Gbps <--> Switch_0_i15.up_port[1];
     Switch_i61.down_port[1] <--> Link_1Gbps <--> Switch_1_i15.up_port[1];
     Switch_i61.down_port[2] <--> Link_1Gbps <--> Switch_2_i15.up_port[1];
     Switch_i61.down_port[3] <--> Link_1Gbps <--> Switch_3_i15.up_port[1];
     Switch_i61.down_port[4] <--> Link_1Gbps <--> Switch_4_i15.up_port[1];
     Switch_i61.down_port[5] <--> Link_1Gbps <--> Switch_5_i15.up_port[1];
     Switch_i61.down_port[6] <--> Link_1Gbps <--> Switch_6_i15.up_port[1];
     Switch_i61.down_port[7] <--> Link_1Gbps <--> Switch_7_i15.up_port[1];
     Switch_i62.down_port[0] <--> Link_1Gbps <--> Switch_0_i15.up_port[2];
     Switch_i62.down_port[1] <--> Link_1Gbps <--> Switch_1_i15.up_port[2];
     Switch_i62.down_port[2] <--> Link_1Gbps <--> Switch_2_i15.up_port[2];
     Switch_i62.down_port[3] <--> Link_1Gbps <--> Switch_3_i15.up_port[2];
     Switch_i62.down_port[4] <--> Link_1Gbps <--> Switch_4_i15.up_port[2];
     Switch_i62.down_port[5] <--> Link_1Gbps <--> Switch_5_i15.up_port[2];
     Switch_i62.down_port[6] <--> Link_1Gbps <--> Switch_6_i15.up_port[2];
     Switch_i62.down_port[7] <--> Link_1Gbps <--> Switch_7_i15.up_port[2];
     Switch_i63.down_port[0] <--> Link_1Gbps <--> Switch_0_i15.up_port[3];
     Switch_i63.down_port[1] <--> Link_1Gbps <--> Switch_1_i15.up_port[3];
     Switch_i63.down_port[2] <--> Link_1Gbps <--> Switch_2_i15.up_port[3];
     Switch_i63.down_port[3] <--> Link_1Gbps <--> Switch_3_i15.up_port[3];
     Switch_i63.down_port[4] <--> Link_1Gbps <--> Switch_4_i15.up_port[3];
     Switch_i63.down_port[5] <--> Link_1Gbps <--> Switch_5_i15.up_port[3];
     Switch_i63.down_port[6] <--> Link_1Gbps <--> Switch_6_i15.up_port[3];
     Switch_i63.down_port[7] <--> Link_1Gbps <--> Switch_7_i15.up_port[3];
}
