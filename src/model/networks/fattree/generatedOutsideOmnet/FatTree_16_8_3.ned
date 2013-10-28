package datacenter.model.networks.fattree.generatedOutsideOmnet;
import ned.DatarateChannel;
import datacenter.model.switch.EthSwitch;
import datacenter.model.node.server.Server;
import datacenter.model.node.server.*;


network FatTree_16_8_3
{
  parameters:
    **.tree_depth               = 3;
    **.int_switch_down_ports    = 16;
    **.tor_switch_up_ports      = 8;
    **.tor_switch_down_ports    = 8;
    **.switch_up_ports          = 8;
    **.switch_down_ports        = 8;
    **.switch_switch_link_speed = 1000000000 bps;
    **.server_switch_link_speed = 1000000000 bps;
    string ServerType = default("TCPClientServer");
    **.number_of_paths = 64;
    int DefaultQueueSizeBytes @unit(bytes) = default(32KiB);
    int DefaultQueueSizePkts = default(0);

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
    Server_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=50,650,x");
            address = 0;
        gates:
    }
    Server_0_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=175,650,x");
            address = 1;
        gates:
    }
    Server_0_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=300,650,x");
            address = 2;
        gates:
    }
    Server_0_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=425,650,x");
            address = 3;
        gates:
    }
    Server_0_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=550,650,x");
            address = 4;
        gates:
    }
    Server_0_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=675,650,x");
            address = 5;
        gates:
    }
    Server_0_0_6 : <ServerType> like Server
    {
        parameters:
            @display("p=800,650,x");
            address = 6;
        gates:
    }
    Server_0_0_7 : <ServerType> like Server
    {
        parameters:
            @display("p=925,650,x");
            address = 7;
        gates:
    }
    Switch_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=487,450,x");
            switch_id = "Switch_0_0_i0";
            depth = 2;
            sub_tree_id = 0;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=1050,650,x");
            address = 8;
        gates:
    }
    Server_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=1175,650,x");
            address = 9;
        gates:
    }
    Server_0_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=1300,650,x");
            address = 10;
        gates:
    }
    Server_0_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=1425,650,x");
            address = 11;
        gates:
    }
    Server_0_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=1550,650,x");
            address = 12;
        gates:
    }
    Server_0_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=1675,650,x");
            address = 13;
        gates:
    }
    Server_0_1_6 : <ServerType> like Server
    {
        parameters:
            @display("p=1800,650,x");
            address = 14;
        gates:
    }
    Server_0_1_7 : <ServerType> like Server
    {
        parameters:
            @display("p=1925,650,x");
            address = 15;
        gates:
    }
    Switch_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=1487,450,x");
            switch_id = "Switch_0_1_i0";
            depth = 2;
            sub_tree_id = 8;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_0_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=2050,650,x");
            address = 16;
        gates:
    }
    Server_0_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=2175,650,x");
            address = 17;
        gates:
    }
    Server_0_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=2300,650,x");
            address = 18;
        gates:
    }
    Server_0_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=2425,650,x");
            address = 19;
        gates:
    }
    Server_0_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=2550,650,x");
            address = 20;
        gates:
    }
    Server_0_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=2675,650,x");
            address = 21;
        gates:
    }
    Server_0_2_6 : <ServerType> like Server
    {
        parameters:
            @display("p=2800,650,x");
            address = 22;
        gates:
    }
    Server_0_2_7 : <ServerType> like Server
    {
        parameters:
            @display("p=2925,650,x");
            address = 23;
        gates:
    }
    Switch_0_2_i0 : EthSwitch
    {
        parameters:
            @display("p=2487,450,x");
            switch_id = "Switch_0_2_i0";
            depth = 2;
            sub_tree_id = 16;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_0_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=3050,650,x");
            address = 24;
        gates:
    }
    Server_0_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=3175,650,x");
            address = 25;
        gates:
    }
    Server_0_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=3300,650,x");
            address = 26;
        gates:
    }
    Server_0_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=3425,650,x");
            address = 27;
        gates:
    }
    Server_0_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=3550,650,x");
            address = 28;
        gates:
    }
    Server_0_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=3675,650,x");
            address = 29;
        gates:
    }
    Server_0_3_6 : <ServerType> like Server
    {
        parameters:
            @display("p=3800,650,x");
            address = 30;
        gates:
    }
    Server_0_3_7 : <ServerType> like Server
    {
        parameters:
            @display("p=3925,650,x");
            address = 31;
        gates:
    }
    Switch_0_3_i0 : EthSwitch
    {
        parameters:
            @display("p=3487,450,x");
            switch_id = "Switch_0_3_i0";
            depth = 2;
            sub_tree_id = 24;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_0_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=4050,650,x");
            address = 32;
        gates:
    }
    Server_0_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=4175,650,x");
            address = 33;
        gates:
    }
    Server_0_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=4300,650,x");
            address = 34;
        gates:
    }
    Server_0_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=4425,650,x");
            address = 35;
        gates:
    }
    Server_0_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=4550,650,x");
            address = 36;
        gates:
    }
    Server_0_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=4675,650,x");
            address = 37;
        gates:
    }
    Server_0_4_6 : <ServerType> like Server
    {
        parameters:
            @display("p=4800,650,x");
            address = 38;
        gates:
    }
    Server_0_4_7 : <ServerType> like Server
    {
        parameters:
            @display("p=4925,650,x");
            address = 39;
        gates:
    }
    Switch_0_4_i0 : EthSwitch
    {
        parameters:
            @display("p=4487,450,x");
            switch_id = "Switch_0_4_i0";
            depth = 2;
            sub_tree_id = 32;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_0_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=5050,650,x");
            address = 40;
        gates:
    }
    Server_0_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=5175,650,x");
            address = 41;
        gates:
    }
    Server_0_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=5300,650,x");
            address = 42;
        gates:
    }
    Server_0_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=5425,650,x");
            address = 43;
        gates:
    }
    Server_0_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=5550,650,x");
            address = 44;
        gates:
    }
    Server_0_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=5675,650,x");
            address = 45;
        gates:
    }
    Server_0_5_6 : <ServerType> like Server
    {
        parameters:
            @display("p=5800,650,x");
            address = 46;
        gates:
    }
    Server_0_5_7 : <ServerType> like Server
    {
        parameters:
            @display("p=5925,650,x");
            address = 47;
        gates:
    }
    Switch_0_5_i0 : EthSwitch
    {
        parameters:
            @display("p=5487,450,x");
            switch_id = "Switch_0_5_i0";
            depth = 2;
            sub_tree_id = 40;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_0_6_0 : <ServerType> like Server
    {
        parameters:
            @display("p=6050,650,x");
            address = 48;
        gates:
    }
    Server_0_6_1 : <ServerType> like Server
    {
        parameters:
            @display("p=6175,650,x");
            address = 49;
        gates:
    }
    Server_0_6_2 : <ServerType> like Server
    {
        parameters:
            @display("p=6300,650,x");
            address = 50;
        gates:
    }
    Server_0_6_3 : <ServerType> like Server
    {
        parameters:
            @display("p=6425,650,x");
            address = 51;
        gates:
    }
    Server_0_6_4 : <ServerType> like Server
    {
        parameters:
            @display("p=6550,650,x");
            address = 52;
        gates:
    }
    Server_0_6_5 : <ServerType> like Server
    {
        parameters:
            @display("p=6675,650,x");
            address = 53;
        gates:
    }
    Server_0_6_6 : <ServerType> like Server
    {
        parameters:
            @display("p=6800,650,x");
            address = 54;
        gates:
    }
    Server_0_6_7 : <ServerType> like Server
    {
        parameters:
            @display("p=6925,650,x");
            address = 55;
        gates:
    }
    Switch_0_6_i0 : EthSwitch
    {
        parameters:
            @display("p=6487,450,x");
            switch_id = "Switch_0_6_i0";
            depth = 2;
            sub_tree_id = 48;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_0_7_0 : <ServerType> like Server
    {
        parameters:
            @display("p=7050,650,x");
            address = 56;
        gates:
    }
    Server_0_7_1 : <ServerType> like Server
    {
        parameters:
            @display("p=7175,650,x");
            address = 57;
        gates:
    }
    Server_0_7_2 : <ServerType> like Server
    {
        parameters:
            @display("p=7300,650,x");
            address = 58;
        gates:
    }
    Server_0_7_3 : <ServerType> like Server
    {
        parameters:
            @display("p=7425,650,x");
            address = 59;
        gates:
    }
    Server_0_7_4 : <ServerType> like Server
    {
        parameters:
            @display("p=7550,650,x");
            address = 60;
        gates:
    }
    Server_0_7_5 : <ServerType> like Server
    {
        parameters:
            @display("p=7675,650,x");
            address = 61;
        gates:
    }
    Server_0_7_6 : <ServerType> like Server
    {
        parameters:
            @display("p=7800,650,x");
            address = 62;
        gates:
    }
    Server_0_7_7 : <ServerType> like Server
    {
        parameters:
            @display("p=7925,650,x");
            address = 63;
        gates:
    }
    Switch_0_7_i0 : EthSwitch
    {
        parameters:
            @display("p=7487,450,x");
            switch_id = "Switch_0_7_i0";
            depth = 2;
            sub_tree_id = 56;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_0_i0 : EthSwitch
    {
        parameters:
            @display("p=925,250,x");
            switch_id = "Switch_0_i0";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_0_i1 : EthSwitch
    {
        parameters:
            @display("p=1800,250,x");
            switch_id = "Switch_0_i1";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_0_i2 : EthSwitch
    {
        parameters:
            @display("p=2675,250,x");
            switch_id = "Switch_0_i2";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_0_i3 : EthSwitch
    {
        parameters:
            @display("p=3550,250,x");
            switch_id = "Switch_0_i3";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_0_i4 : EthSwitch
    {
        parameters:
            @display("p=4425,250,x");
            switch_id = "Switch_0_i4";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_0_i5 : EthSwitch
    {
        parameters:
            @display("p=5300,250,x");
            switch_id = "Switch_0_i5";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_0_i6 : EthSwitch
    {
        parameters:
            @display("p=6175,250,x");
            switch_id = "Switch_0_i6";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_0_i7 : EthSwitch
    {
        parameters:
            @display("p=7050,250,x");
            switch_id = "Switch_0_i7";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=8050,650,x");
            address = 64;
        gates:
    }
    Server_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=8175,650,x");
            address = 65;
        gates:
    }
    Server_1_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=8300,650,x");
            address = 66;
        gates:
    }
    Server_1_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=8425,650,x");
            address = 67;
        gates:
    }
    Server_1_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=8550,650,x");
            address = 68;
        gates:
    }
    Server_1_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=8675,650,x");
            address = 69;
        gates:
    }
    Server_1_0_6 : <ServerType> like Server
    {
        parameters:
            @display("p=8800,650,x");
            address = 70;
        gates:
    }
    Server_1_0_7 : <ServerType> like Server
    {
        parameters:
            @display("p=8925,650,x");
            address = 71;
        gates:
    }
    Switch_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=8487,450,x");
            switch_id = "Switch_1_0_i0";
            depth = 2;
            sub_tree_id = 64;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=9050,650,x");
            address = 72;
        gates:
    }
    Server_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=9175,650,x");
            address = 73;
        gates:
    }
    Server_1_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=9300,650,x");
            address = 74;
        gates:
    }
    Server_1_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=9425,650,x");
            address = 75;
        gates:
    }
    Server_1_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=9550,650,x");
            address = 76;
        gates:
    }
    Server_1_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=9675,650,x");
            address = 77;
        gates:
    }
    Server_1_1_6 : <ServerType> like Server
    {
        parameters:
            @display("p=9800,650,x");
            address = 78;
        gates:
    }
    Server_1_1_7 : <ServerType> like Server
    {
        parameters:
            @display("p=9925,650,x");
            address = 79;
        gates:
    }
    Switch_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=9487,450,x");
            switch_id = "Switch_1_1_i0";
            depth = 2;
            sub_tree_id = 72;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_1_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=10050,650,x");
            address = 80;
        gates:
    }
    Server_1_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=10175,650,x");
            address = 81;
        gates:
    }
    Server_1_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=10300,650,x");
            address = 82;
        gates:
    }
    Server_1_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=10425,650,x");
            address = 83;
        gates:
    }
    Server_1_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=10550,650,x");
            address = 84;
        gates:
    }
    Server_1_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=10675,650,x");
            address = 85;
        gates:
    }
    Server_1_2_6 : <ServerType> like Server
    {
        parameters:
            @display("p=10800,650,x");
            address = 86;
        gates:
    }
    Server_1_2_7 : <ServerType> like Server
    {
        parameters:
            @display("p=10925,650,x");
            address = 87;
        gates:
    }
    Switch_1_2_i0 : EthSwitch
    {
        parameters:
            @display("p=10487,450,x");
            switch_id = "Switch_1_2_i0";
            depth = 2;
            sub_tree_id = 80;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_1_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=11050,650,x");
            address = 88;
        gates:
    }
    Server_1_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=11175,650,x");
            address = 89;
        gates:
    }
    Server_1_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=11300,650,x");
            address = 90;
        gates:
    }
    Server_1_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=11425,650,x");
            address = 91;
        gates:
    }
    Server_1_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=11550,650,x");
            address = 92;
        gates:
    }
    Server_1_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=11675,650,x");
            address = 93;
        gates:
    }
    Server_1_3_6 : <ServerType> like Server
    {
        parameters:
            @display("p=11800,650,x");
            address = 94;
        gates:
    }
    Server_1_3_7 : <ServerType> like Server
    {
        parameters:
            @display("p=11925,650,x");
            address = 95;
        gates:
    }
    Switch_1_3_i0 : EthSwitch
    {
        parameters:
            @display("p=11487,450,x");
            switch_id = "Switch_1_3_i0";
            depth = 2;
            sub_tree_id = 88;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_1_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=12050,650,x");
            address = 96;
        gates:
    }
    Server_1_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=12175,650,x");
            address = 97;
        gates:
    }
    Server_1_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=12300,650,x");
            address = 98;
        gates:
    }
    Server_1_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=12425,650,x");
            address = 99;
        gates:
    }
    Server_1_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=12550,650,x");
            address = 100;
        gates:
    }
    Server_1_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=12675,650,x");
            address = 101;
        gates:
    }
    Server_1_4_6 : <ServerType> like Server
    {
        parameters:
            @display("p=12800,650,x");
            address = 102;
        gates:
    }
    Server_1_4_7 : <ServerType> like Server
    {
        parameters:
            @display("p=12925,650,x");
            address = 103;
        gates:
    }
    Switch_1_4_i0 : EthSwitch
    {
        parameters:
            @display("p=12487,450,x");
            switch_id = "Switch_1_4_i0";
            depth = 2;
            sub_tree_id = 96;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_1_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=13050,650,x");
            address = 104;
        gates:
    }
    Server_1_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=13175,650,x");
            address = 105;
        gates:
    }
    Server_1_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=13300,650,x");
            address = 106;
        gates:
    }
    Server_1_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=13425,650,x");
            address = 107;
        gates:
    }
    Server_1_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=13550,650,x");
            address = 108;
        gates:
    }
    Server_1_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=13675,650,x");
            address = 109;
        gates:
    }
    Server_1_5_6 : <ServerType> like Server
    {
        parameters:
            @display("p=13800,650,x");
            address = 110;
        gates:
    }
    Server_1_5_7 : <ServerType> like Server
    {
        parameters:
            @display("p=13925,650,x");
            address = 111;
        gates:
    }
    Switch_1_5_i0 : EthSwitch
    {
        parameters:
            @display("p=13487,450,x");
            switch_id = "Switch_1_5_i0";
            depth = 2;
            sub_tree_id = 104;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_1_6_0 : <ServerType> like Server
    {
        parameters:
            @display("p=14050,650,x");
            address = 112;
        gates:
    }
    Server_1_6_1 : <ServerType> like Server
    {
        parameters:
            @display("p=14175,650,x");
            address = 113;
        gates:
    }
    Server_1_6_2 : <ServerType> like Server
    {
        parameters:
            @display("p=14300,650,x");
            address = 114;
        gates:
    }
    Server_1_6_3 : <ServerType> like Server
    {
        parameters:
            @display("p=14425,650,x");
            address = 115;
        gates:
    }
    Server_1_6_4 : <ServerType> like Server
    {
        parameters:
            @display("p=14550,650,x");
            address = 116;
        gates:
    }
    Server_1_6_5 : <ServerType> like Server
    {
        parameters:
            @display("p=14675,650,x");
            address = 117;
        gates:
    }
    Server_1_6_6 : <ServerType> like Server
    {
        parameters:
            @display("p=14800,650,x");
            address = 118;
        gates:
    }
    Server_1_6_7 : <ServerType> like Server
    {
        parameters:
            @display("p=14925,650,x");
            address = 119;
        gates:
    }
    Switch_1_6_i0 : EthSwitch
    {
        parameters:
            @display("p=14487,450,x");
            switch_id = "Switch_1_6_i0";
            depth = 2;
            sub_tree_id = 112;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_1_7_0 : <ServerType> like Server
    {
        parameters:
            @display("p=15050,650,x");
            address = 120;
        gates:
    }
    Server_1_7_1 : <ServerType> like Server
    {
        parameters:
            @display("p=15175,650,x");
            address = 121;
        gates:
    }
    Server_1_7_2 : <ServerType> like Server
    {
        parameters:
            @display("p=15300,650,x");
            address = 122;
        gates:
    }
    Server_1_7_3 : <ServerType> like Server
    {
        parameters:
            @display("p=15425,650,x");
            address = 123;
        gates:
    }
    Server_1_7_4 : <ServerType> like Server
    {
        parameters:
            @display("p=15550,650,x");
            address = 124;
        gates:
    }
    Server_1_7_5 : <ServerType> like Server
    {
        parameters:
            @display("p=15675,650,x");
            address = 125;
        gates:
    }
    Server_1_7_6 : <ServerType> like Server
    {
        parameters:
            @display("p=15800,650,x");
            address = 126;
        gates:
    }
    Server_1_7_7 : <ServerType> like Server
    {
        parameters:
            @display("p=15925,650,x");
            address = 127;
        gates:
    }
    Switch_1_7_i0 : EthSwitch
    {
        parameters:
            @display("p=15487,450,x");
            switch_id = "Switch_1_7_i0";
            depth = 2;
            sub_tree_id = 120;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_1_i0 : EthSwitch
    {
        parameters:
            @display("p=8925,250,x");
            switch_id = "Switch_1_i0";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_1_i1 : EthSwitch
    {
        parameters:
            @display("p=9800,250,x");
            switch_id = "Switch_1_i1";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_1_i2 : EthSwitch
    {
        parameters:
            @display("p=10675,250,x");
            switch_id = "Switch_1_i2";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_1_i3 : EthSwitch
    {
        parameters:
            @display("p=11550,250,x");
            switch_id = "Switch_1_i3";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_1_i4 : EthSwitch
    {
        parameters:
            @display("p=12425,250,x");
            switch_id = "Switch_1_i4";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_1_i5 : EthSwitch
    {
        parameters:
            @display("p=13300,250,x");
            switch_id = "Switch_1_i5";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_1_i6 : EthSwitch
    {
        parameters:
            @display("p=14175,250,x");
            switch_id = "Switch_1_i6";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_1_i7 : EthSwitch
    {
        parameters:
            @display("p=15050,250,x");
            switch_id = "Switch_1_i7";
            depth = 1;
            sub_tree_id = 64;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_2_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=16050,650,x");
            address = 128;
        gates:
    }
    Server_2_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=16175,650,x");
            address = 129;
        gates:
    }
    Server_2_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=16300,650,x");
            address = 130;
        gates:
    }
    Server_2_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=16425,650,x");
            address = 131;
        gates:
    }
    Server_2_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=16550,650,x");
            address = 132;
        gates:
    }
    Server_2_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=16675,650,x");
            address = 133;
        gates:
    }
    Server_2_0_6 : <ServerType> like Server
    {
        parameters:
            @display("p=16800,650,x");
            address = 134;
        gates:
    }
    Server_2_0_7 : <ServerType> like Server
    {
        parameters:
            @display("p=16925,650,x");
            address = 135;
        gates:
    }
    Switch_2_0_i0 : EthSwitch
    {
        parameters:
            @display("p=16487,450,x");
            switch_id = "Switch_2_0_i0";
            depth = 2;
            sub_tree_id = 128;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_2_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=17050,650,x");
            address = 136;
        gates:
    }
    Server_2_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=17175,650,x");
            address = 137;
        gates:
    }
    Server_2_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=17300,650,x");
            address = 138;
        gates:
    }
    Server_2_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=17425,650,x");
            address = 139;
        gates:
    }
    Server_2_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=17550,650,x");
            address = 140;
        gates:
    }
    Server_2_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=17675,650,x");
            address = 141;
        gates:
    }
    Server_2_1_6 : <ServerType> like Server
    {
        parameters:
            @display("p=17800,650,x");
            address = 142;
        gates:
    }
    Server_2_1_7 : <ServerType> like Server
    {
        parameters:
            @display("p=17925,650,x");
            address = 143;
        gates:
    }
    Switch_2_1_i0 : EthSwitch
    {
        parameters:
            @display("p=17487,450,x");
            switch_id = "Switch_2_1_i0";
            depth = 2;
            sub_tree_id = 136;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_2_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=18050,650,x");
            address = 144;
        gates:
    }
    Server_2_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=18175,650,x");
            address = 145;
        gates:
    }
    Server_2_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=18300,650,x");
            address = 146;
        gates:
    }
    Server_2_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=18425,650,x");
            address = 147;
        gates:
    }
    Server_2_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=18550,650,x");
            address = 148;
        gates:
    }
    Server_2_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=18675,650,x");
            address = 149;
        gates:
    }
    Server_2_2_6 : <ServerType> like Server
    {
        parameters:
            @display("p=18800,650,x");
            address = 150;
        gates:
    }
    Server_2_2_7 : <ServerType> like Server
    {
        parameters:
            @display("p=18925,650,x");
            address = 151;
        gates:
    }
    Switch_2_2_i0 : EthSwitch
    {
        parameters:
            @display("p=18487,450,x");
            switch_id = "Switch_2_2_i0";
            depth = 2;
            sub_tree_id = 144;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_2_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=19050,650,x");
            address = 152;
        gates:
    }
    Server_2_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=19175,650,x");
            address = 153;
        gates:
    }
    Server_2_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=19300,650,x");
            address = 154;
        gates:
    }
    Server_2_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=19425,650,x");
            address = 155;
        gates:
    }
    Server_2_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=19550,650,x");
            address = 156;
        gates:
    }
    Server_2_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=19675,650,x");
            address = 157;
        gates:
    }
    Server_2_3_6 : <ServerType> like Server
    {
        parameters:
            @display("p=19800,650,x");
            address = 158;
        gates:
    }
    Server_2_3_7 : <ServerType> like Server
    {
        parameters:
            @display("p=19925,650,x");
            address = 159;
        gates:
    }
    Switch_2_3_i0 : EthSwitch
    {
        parameters:
            @display("p=19487,450,x");
            switch_id = "Switch_2_3_i0";
            depth = 2;
            sub_tree_id = 152;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_2_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=20050,650,x");
            address = 160;
        gates:
    }
    Server_2_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=20175,650,x");
            address = 161;
        gates:
    }
    Server_2_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=20300,650,x");
            address = 162;
        gates:
    }
    Server_2_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=20425,650,x");
            address = 163;
        gates:
    }
    Server_2_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=20550,650,x");
            address = 164;
        gates:
    }
    Server_2_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=20675,650,x");
            address = 165;
        gates:
    }
    Server_2_4_6 : <ServerType> like Server
    {
        parameters:
            @display("p=20800,650,x");
            address = 166;
        gates:
    }
    Server_2_4_7 : <ServerType> like Server
    {
        parameters:
            @display("p=20925,650,x");
            address = 167;
        gates:
    }
    Switch_2_4_i0 : EthSwitch
    {
        parameters:
            @display("p=20487,450,x");
            switch_id = "Switch_2_4_i0";
            depth = 2;
            sub_tree_id = 160;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_2_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=21050,650,x");
            address = 168;
        gates:
    }
    Server_2_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=21175,650,x");
            address = 169;
        gates:
    }
    Server_2_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=21300,650,x");
            address = 170;
        gates:
    }
    Server_2_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=21425,650,x");
            address = 171;
        gates:
    }
    Server_2_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=21550,650,x");
            address = 172;
        gates:
    }
    Server_2_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=21675,650,x");
            address = 173;
        gates:
    }
    Server_2_5_6 : <ServerType> like Server
    {
        parameters:
            @display("p=21800,650,x");
            address = 174;
        gates:
    }
    Server_2_5_7 : <ServerType> like Server
    {
        parameters:
            @display("p=21925,650,x");
            address = 175;
        gates:
    }
    Switch_2_5_i0 : EthSwitch
    {
        parameters:
            @display("p=21487,450,x");
            switch_id = "Switch_2_5_i0";
            depth = 2;
            sub_tree_id = 168;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_2_6_0 : <ServerType> like Server
    {
        parameters:
            @display("p=22050,650,x");
            address = 176;
        gates:
    }
    Server_2_6_1 : <ServerType> like Server
    {
        parameters:
            @display("p=22175,650,x");
            address = 177;
        gates:
    }
    Server_2_6_2 : <ServerType> like Server
    {
        parameters:
            @display("p=22300,650,x");
            address = 178;
        gates:
    }
    Server_2_6_3 : <ServerType> like Server
    {
        parameters:
            @display("p=22425,650,x");
            address = 179;
        gates:
    }
    Server_2_6_4 : <ServerType> like Server
    {
        parameters:
            @display("p=22550,650,x");
            address = 180;
        gates:
    }
    Server_2_6_5 : <ServerType> like Server
    {
        parameters:
            @display("p=22675,650,x");
            address = 181;
        gates:
    }
    Server_2_6_6 : <ServerType> like Server
    {
        parameters:
            @display("p=22800,650,x");
            address = 182;
        gates:
    }
    Server_2_6_7 : <ServerType> like Server
    {
        parameters:
            @display("p=22925,650,x");
            address = 183;
        gates:
    }
    Switch_2_6_i0 : EthSwitch
    {
        parameters:
            @display("p=22487,450,x");
            switch_id = "Switch_2_6_i0";
            depth = 2;
            sub_tree_id = 176;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_2_7_0 : <ServerType> like Server
    {
        parameters:
            @display("p=23050,650,x");
            address = 184;
        gates:
    }
    Server_2_7_1 : <ServerType> like Server
    {
        parameters:
            @display("p=23175,650,x");
            address = 185;
        gates:
    }
    Server_2_7_2 : <ServerType> like Server
    {
        parameters:
            @display("p=23300,650,x");
            address = 186;
        gates:
    }
    Server_2_7_3 : <ServerType> like Server
    {
        parameters:
            @display("p=23425,650,x");
            address = 187;
        gates:
    }
    Server_2_7_4 : <ServerType> like Server
    {
        parameters:
            @display("p=23550,650,x");
            address = 188;
        gates:
    }
    Server_2_7_5 : <ServerType> like Server
    {
        parameters:
            @display("p=23675,650,x");
            address = 189;
        gates:
    }
    Server_2_7_6 : <ServerType> like Server
    {
        parameters:
            @display("p=23800,650,x");
            address = 190;
        gates:
    }
    Server_2_7_7 : <ServerType> like Server
    {
        parameters:
            @display("p=23925,650,x");
            address = 191;
        gates:
    }
    Switch_2_7_i0 : EthSwitch
    {
        parameters:
            @display("p=23487,450,x");
            switch_id = "Switch_2_7_i0";
            depth = 2;
            sub_tree_id = 184;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_2_i0 : EthSwitch
    {
        parameters:
            @display("p=16925,250,x");
            switch_id = "Switch_2_i0";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_2_i1 : EthSwitch
    {
        parameters:
            @display("p=17800,250,x");
            switch_id = "Switch_2_i1";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_2_i2 : EthSwitch
    {
        parameters:
            @display("p=18675,250,x");
            switch_id = "Switch_2_i2";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_2_i3 : EthSwitch
    {
        parameters:
            @display("p=19550,250,x");
            switch_id = "Switch_2_i3";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_2_i4 : EthSwitch
    {
        parameters:
            @display("p=20425,250,x");
            switch_id = "Switch_2_i4";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_2_i5 : EthSwitch
    {
        parameters:
            @display("p=21300,250,x");
            switch_id = "Switch_2_i5";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_2_i6 : EthSwitch
    {
        parameters:
            @display("p=22175,250,x");
            switch_id = "Switch_2_i6";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_2_i7 : EthSwitch
    {
        parameters:
            @display("p=23050,250,x");
            switch_id = "Switch_2_i7";
            depth = 1;
            sub_tree_id = 128;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_3_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=24050,650,x");
            address = 192;
        gates:
    }
    Server_3_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=24175,650,x");
            address = 193;
        gates:
    }
    Server_3_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=24300,650,x");
            address = 194;
        gates:
    }
    Server_3_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=24425,650,x");
            address = 195;
        gates:
    }
    Server_3_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=24550,650,x");
            address = 196;
        gates:
    }
    Server_3_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=24675,650,x");
            address = 197;
        gates:
    }
    Server_3_0_6 : <ServerType> like Server
    {
        parameters:
            @display("p=24800,650,x");
            address = 198;
        gates:
    }
    Server_3_0_7 : <ServerType> like Server
    {
        parameters:
            @display("p=24925,650,x");
            address = 199;
        gates:
    }
    Switch_3_0_i0 : EthSwitch
    {
        parameters:
            @display("p=24487,450,x");
            switch_id = "Switch_3_0_i0";
            depth = 2;
            sub_tree_id = 192;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_3_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=25050,650,x");
            address = 200;
        gates:
    }
    Server_3_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=25175,650,x");
            address = 201;
        gates:
    }
    Server_3_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=25300,650,x");
            address = 202;
        gates:
    }
    Server_3_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=25425,650,x");
            address = 203;
        gates:
    }
    Server_3_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=25550,650,x");
            address = 204;
        gates:
    }
    Server_3_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=25675,650,x");
            address = 205;
        gates:
    }
    Server_3_1_6 : <ServerType> like Server
    {
        parameters:
            @display("p=25800,650,x");
            address = 206;
        gates:
    }
    Server_3_1_7 : <ServerType> like Server
    {
        parameters:
            @display("p=25925,650,x");
            address = 207;
        gates:
    }
    Switch_3_1_i0 : EthSwitch
    {
        parameters:
            @display("p=25487,450,x");
            switch_id = "Switch_3_1_i0";
            depth = 2;
            sub_tree_id = 200;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_3_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=26050,650,x");
            address = 208;
        gates:
    }
    Server_3_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=26175,650,x");
            address = 209;
        gates:
    }
    Server_3_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=26300,650,x");
            address = 210;
        gates:
    }
    Server_3_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=26425,650,x");
            address = 211;
        gates:
    }
    Server_3_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=26550,650,x");
            address = 212;
        gates:
    }
    Server_3_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=26675,650,x");
            address = 213;
        gates:
    }
    Server_3_2_6 : <ServerType> like Server
    {
        parameters:
            @display("p=26800,650,x");
            address = 214;
        gates:
    }
    Server_3_2_7 : <ServerType> like Server
    {
        parameters:
            @display("p=26925,650,x");
            address = 215;
        gates:
    }
    Switch_3_2_i0 : EthSwitch
    {
        parameters:
            @display("p=26487,450,x");
            switch_id = "Switch_3_2_i0";
            depth = 2;
            sub_tree_id = 208;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_3_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=27050,650,x");
            address = 216;
        gates:
    }
    Server_3_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=27175,650,x");
            address = 217;
        gates:
    }
    Server_3_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=27300,650,x");
            address = 218;
        gates:
    }
    Server_3_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=27425,650,x");
            address = 219;
        gates:
    }
    Server_3_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=27550,650,x");
            address = 220;
        gates:
    }
    Server_3_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=27675,650,x");
            address = 221;
        gates:
    }
    Server_3_3_6 : <ServerType> like Server
    {
        parameters:
            @display("p=27800,650,x");
            address = 222;
        gates:
    }
    Server_3_3_7 : <ServerType> like Server
    {
        parameters:
            @display("p=27925,650,x");
            address = 223;
        gates:
    }
    Switch_3_3_i0 : EthSwitch
    {
        parameters:
            @display("p=27487,450,x");
            switch_id = "Switch_3_3_i0";
            depth = 2;
            sub_tree_id = 216;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_3_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=28050,650,x");
            address = 224;
        gates:
    }
    Server_3_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=28175,650,x");
            address = 225;
        gates:
    }
    Server_3_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=28300,650,x");
            address = 226;
        gates:
    }
    Server_3_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=28425,650,x");
            address = 227;
        gates:
    }
    Server_3_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=28550,650,x");
            address = 228;
        gates:
    }
    Server_3_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=28675,650,x");
            address = 229;
        gates:
    }
    Server_3_4_6 : <ServerType> like Server
    {
        parameters:
            @display("p=28800,650,x");
            address = 230;
        gates:
    }
    Server_3_4_7 : <ServerType> like Server
    {
        parameters:
            @display("p=28925,650,x");
            address = 231;
        gates:
    }
    Switch_3_4_i0 : EthSwitch
    {
        parameters:
            @display("p=28487,450,x");
            switch_id = "Switch_3_4_i0";
            depth = 2;
            sub_tree_id = 224;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_3_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=29050,650,x");
            address = 232;
        gates:
    }
    Server_3_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=29175,650,x");
            address = 233;
        gates:
    }
    Server_3_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=29300,650,x");
            address = 234;
        gates:
    }
    Server_3_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=29425,650,x");
            address = 235;
        gates:
    }
    Server_3_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=29550,650,x");
            address = 236;
        gates:
    }
    Server_3_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=29675,650,x");
            address = 237;
        gates:
    }
    Server_3_5_6 : <ServerType> like Server
    {
        parameters:
            @display("p=29800,650,x");
            address = 238;
        gates:
    }
    Server_3_5_7 : <ServerType> like Server
    {
        parameters:
            @display("p=29925,650,x");
            address = 239;
        gates:
    }
    Switch_3_5_i0 : EthSwitch
    {
        parameters:
            @display("p=29487,450,x");
            switch_id = "Switch_3_5_i0";
            depth = 2;
            sub_tree_id = 232;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_3_6_0 : <ServerType> like Server
    {
        parameters:
            @display("p=30050,650,x");
            address = 240;
        gates:
    }
    Server_3_6_1 : <ServerType> like Server
    {
        parameters:
            @display("p=30175,650,x");
            address = 241;
        gates:
    }
    Server_3_6_2 : <ServerType> like Server
    {
        parameters:
            @display("p=30300,650,x");
            address = 242;
        gates:
    }
    Server_3_6_3 : <ServerType> like Server
    {
        parameters:
            @display("p=30425,650,x");
            address = 243;
        gates:
    }
    Server_3_6_4 : <ServerType> like Server
    {
        parameters:
            @display("p=30550,650,x");
            address = 244;
        gates:
    }
    Server_3_6_5 : <ServerType> like Server
    {
        parameters:
            @display("p=30675,650,x");
            address = 245;
        gates:
    }
    Server_3_6_6 : <ServerType> like Server
    {
        parameters:
            @display("p=30800,650,x");
            address = 246;
        gates:
    }
    Server_3_6_7 : <ServerType> like Server
    {
        parameters:
            @display("p=30925,650,x");
            address = 247;
        gates:
    }
    Switch_3_6_i0 : EthSwitch
    {
        parameters:
            @display("p=30487,450,x");
            switch_id = "Switch_3_6_i0";
            depth = 2;
            sub_tree_id = 240;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_3_7_0 : <ServerType> like Server
    {
        parameters:
            @display("p=31050,650,x");
            address = 248;
        gates:
    }
    Server_3_7_1 : <ServerType> like Server
    {
        parameters:
            @display("p=31175,650,x");
            address = 249;
        gates:
    }
    Server_3_7_2 : <ServerType> like Server
    {
        parameters:
            @display("p=31300,650,x");
            address = 250;
        gates:
    }
    Server_3_7_3 : <ServerType> like Server
    {
        parameters:
            @display("p=31425,650,x");
            address = 251;
        gates:
    }
    Server_3_7_4 : <ServerType> like Server
    {
        parameters:
            @display("p=31550,650,x");
            address = 252;
        gates:
    }
    Server_3_7_5 : <ServerType> like Server
    {
        parameters:
            @display("p=31675,650,x");
            address = 253;
        gates:
    }
    Server_3_7_6 : <ServerType> like Server
    {
        parameters:
            @display("p=31800,650,x");
            address = 254;
        gates:
    }
    Server_3_7_7 : <ServerType> like Server
    {
        parameters:
            @display("p=31925,650,x");
            address = 255;
        gates:
    }
    Switch_3_7_i0 : EthSwitch
    {
        parameters:
            @display("p=31487,450,x");
            switch_id = "Switch_3_7_i0";
            depth = 2;
            sub_tree_id = 248;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_3_i0 : EthSwitch
    {
        parameters:
            @display("p=24925,250,x");
            switch_id = "Switch_3_i0";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_3_i1 : EthSwitch
    {
        parameters:
            @display("p=25800,250,x");
            switch_id = "Switch_3_i1";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_3_i2 : EthSwitch
    {
        parameters:
            @display("p=26675,250,x");
            switch_id = "Switch_3_i2";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_3_i3 : EthSwitch
    {
        parameters:
            @display("p=27550,250,x");
            switch_id = "Switch_3_i3";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_3_i4 : EthSwitch
    {
        parameters:
            @display("p=28425,250,x");
            switch_id = "Switch_3_i4";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_3_i5 : EthSwitch
    {
        parameters:
            @display("p=29300,250,x");
            switch_id = "Switch_3_i5";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_3_i6 : EthSwitch
    {
        parameters:
            @display("p=30175,250,x");
            switch_id = "Switch_3_i6";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_3_i7 : EthSwitch
    {
        parameters:
            @display("p=31050,250,x");
            switch_id = "Switch_3_i7";
            depth = 1;
            sub_tree_id = 192;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_4_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=32050,650,x");
            address = 256;
        gates:
    }
    Server_4_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=32175,650,x");
            address = 257;
        gates:
    }
    Server_4_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=32300,650,x");
            address = 258;
        gates:
    }
    Server_4_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=32425,650,x");
            address = 259;
        gates:
    }
    Server_4_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=32550,650,x");
            address = 260;
        gates:
    }
    Server_4_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=32675,650,x");
            address = 261;
        gates:
    }
    Server_4_0_6 : <ServerType> like Server
    {
        parameters:
            @display("p=32800,650,x");
            address = 262;
        gates:
    }
    Server_4_0_7 : <ServerType> like Server
    {
        parameters:
            @display("p=32925,650,x");
            address = 263;
        gates:
    }
    Switch_4_0_i0 : EthSwitch
    {
        parameters:
            @display("p=32487,450,x");
            switch_id = "Switch_4_0_i0";
            depth = 2;
            sub_tree_id = 256;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_4_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=33050,650,x");
            address = 264;
        gates:
    }
    Server_4_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=33175,650,x");
            address = 265;
        gates:
    }
    Server_4_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=33300,650,x");
            address = 266;
        gates:
    }
    Server_4_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=33425,650,x");
            address = 267;
        gates:
    }
    Server_4_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=33550,650,x");
            address = 268;
        gates:
    }
    Server_4_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=33675,650,x");
            address = 269;
        gates:
    }
    Server_4_1_6 : <ServerType> like Server
    {
        parameters:
            @display("p=33800,650,x");
            address = 270;
        gates:
    }
    Server_4_1_7 : <ServerType> like Server
    {
        parameters:
            @display("p=33925,650,x");
            address = 271;
        gates:
    }
    Switch_4_1_i0 : EthSwitch
    {
        parameters:
            @display("p=33487,450,x");
            switch_id = "Switch_4_1_i0";
            depth = 2;
            sub_tree_id = 264;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_4_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=34050,650,x");
            address = 272;
        gates:
    }
    Server_4_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=34175,650,x");
            address = 273;
        gates:
    }
    Server_4_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=34300,650,x");
            address = 274;
        gates:
    }
    Server_4_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=34425,650,x");
            address = 275;
        gates:
    }
    Server_4_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=34550,650,x");
            address = 276;
        gates:
    }
    Server_4_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=34675,650,x");
            address = 277;
        gates:
    }
    Server_4_2_6 : <ServerType> like Server
    {
        parameters:
            @display("p=34800,650,x");
            address = 278;
        gates:
    }
    Server_4_2_7 : <ServerType> like Server
    {
        parameters:
            @display("p=34925,650,x");
            address = 279;
        gates:
    }
    Switch_4_2_i0 : EthSwitch
    {
        parameters:
            @display("p=34487,450,x");
            switch_id = "Switch_4_2_i0";
            depth = 2;
            sub_tree_id = 272;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_4_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=35050,650,x");
            address = 280;
        gates:
    }
    Server_4_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=35175,650,x");
            address = 281;
        gates:
    }
    Server_4_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=35300,650,x");
            address = 282;
        gates:
    }
    Server_4_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=35425,650,x");
            address = 283;
        gates:
    }
    Server_4_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=35550,650,x");
            address = 284;
        gates:
    }
    Server_4_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=35675,650,x");
            address = 285;
        gates:
    }
    Server_4_3_6 : <ServerType> like Server
    {
        parameters:
            @display("p=35800,650,x");
            address = 286;
        gates:
    }
    Server_4_3_7 : <ServerType> like Server
    {
        parameters:
            @display("p=35925,650,x");
            address = 287;
        gates:
    }
    Switch_4_3_i0 : EthSwitch
    {
        parameters:
            @display("p=35487,450,x");
            switch_id = "Switch_4_3_i0";
            depth = 2;
            sub_tree_id = 280;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_4_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=36050,650,x");
            address = 288;
        gates:
    }
    Server_4_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=36175,650,x");
            address = 289;
        gates:
    }
    Server_4_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=36300,650,x");
            address = 290;
        gates:
    }
    Server_4_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=36425,650,x");
            address = 291;
        gates:
    }
    Server_4_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=36550,650,x");
            address = 292;
        gates:
    }
    Server_4_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=36675,650,x");
            address = 293;
        gates:
    }
    Server_4_4_6 : <ServerType> like Server
    {
        parameters:
            @display("p=36800,650,x");
            address = 294;
        gates:
    }
    Server_4_4_7 : <ServerType> like Server
    {
        parameters:
            @display("p=36925,650,x");
            address = 295;
        gates:
    }
    Switch_4_4_i0 : EthSwitch
    {
        parameters:
            @display("p=36487,450,x");
            switch_id = "Switch_4_4_i0";
            depth = 2;
            sub_tree_id = 288;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_4_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=37050,650,x");
            address = 296;
        gates:
    }
    Server_4_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=37175,650,x");
            address = 297;
        gates:
    }
    Server_4_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=37300,650,x");
            address = 298;
        gates:
    }
    Server_4_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=37425,650,x");
            address = 299;
        gates:
    }
    Server_4_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=37550,650,x");
            address = 300;
        gates:
    }
    Server_4_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=37675,650,x");
            address = 301;
        gates:
    }
    Server_4_5_6 : <ServerType> like Server
    {
        parameters:
            @display("p=37800,650,x");
            address = 302;
        gates:
    }
    Server_4_5_7 : <ServerType> like Server
    {
        parameters:
            @display("p=37925,650,x");
            address = 303;
        gates:
    }
    Switch_4_5_i0 : EthSwitch
    {
        parameters:
            @display("p=37487,450,x");
            switch_id = "Switch_4_5_i0";
            depth = 2;
            sub_tree_id = 296;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_4_6_0 : <ServerType> like Server
    {
        parameters:
            @display("p=38050,650,x");
            address = 304;
        gates:
    }
    Server_4_6_1 : <ServerType> like Server
    {
        parameters:
            @display("p=38175,650,x");
            address = 305;
        gates:
    }
    Server_4_6_2 : <ServerType> like Server
    {
        parameters:
            @display("p=38300,650,x");
            address = 306;
        gates:
    }
    Server_4_6_3 : <ServerType> like Server
    {
        parameters:
            @display("p=38425,650,x");
            address = 307;
        gates:
    }
    Server_4_6_4 : <ServerType> like Server
    {
        parameters:
            @display("p=38550,650,x");
            address = 308;
        gates:
    }
    Server_4_6_5 : <ServerType> like Server
    {
        parameters:
            @display("p=38675,650,x");
            address = 309;
        gates:
    }
    Server_4_6_6 : <ServerType> like Server
    {
        parameters:
            @display("p=38800,650,x");
            address = 310;
        gates:
    }
    Server_4_6_7 : <ServerType> like Server
    {
        parameters:
            @display("p=38925,650,x");
            address = 311;
        gates:
    }
    Switch_4_6_i0 : EthSwitch
    {
        parameters:
            @display("p=38487,450,x");
            switch_id = "Switch_4_6_i0";
            depth = 2;
            sub_tree_id = 304;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_4_7_0 : <ServerType> like Server
    {
        parameters:
            @display("p=39050,650,x");
            address = 312;
        gates:
    }
    Server_4_7_1 : <ServerType> like Server
    {
        parameters:
            @display("p=39175,650,x");
            address = 313;
        gates:
    }
    Server_4_7_2 : <ServerType> like Server
    {
        parameters:
            @display("p=39300,650,x");
            address = 314;
        gates:
    }
    Server_4_7_3 : <ServerType> like Server
    {
        parameters:
            @display("p=39425,650,x");
            address = 315;
        gates:
    }
    Server_4_7_4 : <ServerType> like Server
    {
        parameters:
            @display("p=39550,650,x");
            address = 316;
        gates:
    }
    Server_4_7_5 : <ServerType> like Server
    {
        parameters:
            @display("p=39675,650,x");
            address = 317;
        gates:
    }
    Server_4_7_6 : <ServerType> like Server
    {
        parameters:
            @display("p=39800,650,x");
            address = 318;
        gates:
    }
    Server_4_7_7 : <ServerType> like Server
    {
        parameters:
            @display("p=39925,650,x");
            address = 319;
        gates:
    }
    Switch_4_7_i0 : EthSwitch
    {
        parameters:
            @display("p=39487,450,x");
            switch_id = "Switch_4_7_i0";
            depth = 2;
            sub_tree_id = 312;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_4_i0 : EthSwitch
    {
        parameters:
            @display("p=32925,250,x");
            switch_id = "Switch_4_i0";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_4_i1 : EthSwitch
    {
        parameters:
            @display("p=33800,250,x");
            switch_id = "Switch_4_i1";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_4_i2 : EthSwitch
    {
        parameters:
            @display("p=34675,250,x");
            switch_id = "Switch_4_i2";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_4_i3 : EthSwitch
    {
        parameters:
            @display("p=35550,250,x");
            switch_id = "Switch_4_i3";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_4_i4 : EthSwitch
    {
        parameters:
            @display("p=36425,250,x");
            switch_id = "Switch_4_i4";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_4_i5 : EthSwitch
    {
        parameters:
            @display("p=37300,250,x");
            switch_id = "Switch_4_i5";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_4_i6 : EthSwitch
    {
        parameters:
            @display("p=38175,250,x");
            switch_id = "Switch_4_i6";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_4_i7 : EthSwitch
    {
        parameters:
            @display("p=39050,250,x");
            switch_id = "Switch_4_i7";
            depth = 1;
            sub_tree_id = 256;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_5_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=40050,650,x");
            address = 320;
        gates:
    }
    Server_5_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=40175,650,x");
            address = 321;
        gates:
    }
    Server_5_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=40300,650,x");
            address = 322;
        gates:
    }
    Server_5_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=40425,650,x");
            address = 323;
        gates:
    }
    Server_5_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=40550,650,x");
            address = 324;
        gates:
    }
    Server_5_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=40675,650,x");
            address = 325;
        gates:
    }
    Server_5_0_6 : <ServerType> like Server
    {
        parameters:
            @display("p=40800,650,x");
            address = 326;
        gates:
    }
    Server_5_0_7 : <ServerType> like Server
    {
        parameters:
            @display("p=40925,650,x");
            address = 327;
        gates:
    }
    Switch_5_0_i0 : EthSwitch
    {
        parameters:
            @display("p=40487,450,x");
            switch_id = "Switch_5_0_i0";
            depth = 2;
            sub_tree_id = 320;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_5_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=41050,650,x");
            address = 328;
        gates:
    }
    Server_5_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=41175,650,x");
            address = 329;
        gates:
    }
    Server_5_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=41300,650,x");
            address = 330;
        gates:
    }
    Server_5_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=41425,650,x");
            address = 331;
        gates:
    }
    Server_5_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=41550,650,x");
            address = 332;
        gates:
    }
    Server_5_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=41675,650,x");
            address = 333;
        gates:
    }
    Server_5_1_6 : <ServerType> like Server
    {
        parameters:
            @display("p=41800,650,x");
            address = 334;
        gates:
    }
    Server_5_1_7 : <ServerType> like Server
    {
        parameters:
            @display("p=41925,650,x");
            address = 335;
        gates:
    }
    Switch_5_1_i0 : EthSwitch
    {
        parameters:
            @display("p=41487,450,x");
            switch_id = "Switch_5_1_i0";
            depth = 2;
            sub_tree_id = 328;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_5_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=42050,650,x");
            address = 336;
        gates:
    }
    Server_5_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=42175,650,x");
            address = 337;
        gates:
    }
    Server_5_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=42300,650,x");
            address = 338;
        gates:
    }
    Server_5_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=42425,650,x");
            address = 339;
        gates:
    }
    Server_5_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=42550,650,x");
            address = 340;
        gates:
    }
    Server_5_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=42675,650,x");
            address = 341;
        gates:
    }
    Server_5_2_6 : <ServerType> like Server
    {
        parameters:
            @display("p=42800,650,x");
            address = 342;
        gates:
    }
    Server_5_2_7 : <ServerType> like Server
    {
        parameters:
            @display("p=42925,650,x");
            address = 343;
        gates:
    }
    Switch_5_2_i0 : EthSwitch
    {
        parameters:
            @display("p=42487,450,x");
            switch_id = "Switch_5_2_i0";
            depth = 2;
            sub_tree_id = 336;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_5_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=43050,650,x");
            address = 344;
        gates:
    }
    Server_5_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=43175,650,x");
            address = 345;
        gates:
    }
    Server_5_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=43300,650,x");
            address = 346;
        gates:
    }
    Server_5_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=43425,650,x");
            address = 347;
        gates:
    }
    Server_5_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=43550,650,x");
            address = 348;
        gates:
    }
    Server_5_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=43675,650,x");
            address = 349;
        gates:
    }
    Server_5_3_6 : <ServerType> like Server
    {
        parameters:
            @display("p=43800,650,x");
            address = 350;
        gates:
    }
    Server_5_3_7 : <ServerType> like Server
    {
        parameters:
            @display("p=43925,650,x");
            address = 351;
        gates:
    }
    Switch_5_3_i0 : EthSwitch
    {
        parameters:
            @display("p=43487,450,x");
            switch_id = "Switch_5_3_i0";
            depth = 2;
            sub_tree_id = 344;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_5_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=44050,650,x");
            address = 352;
        gates:
    }
    Server_5_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=44175,650,x");
            address = 353;
        gates:
    }
    Server_5_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=44300,650,x");
            address = 354;
        gates:
    }
    Server_5_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=44425,650,x");
            address = 355;
        gates:
    }
    Server_5_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=44550,650,x");
            address = 356;
        gates:
    }
    Server_5_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=44675,650,x");
            address = 357;
        gates:
    }
    Server_5_4_6 : <ServerType> like Server
    {
        parameters:
            @display("p=44800,650,x");
            address = 358;
        gates:
    }
    Server_5_4_7 : <ServerType> like Server
    {
        parameters:
            @display("p=44925,650,x");
            address = 359;
        gates:
    }
    Switch_5_4_i0 : EthSwitch
    {
        parameters:
            @display("p=44487,450,x");
            switch_id = "Switch_5_4_i0";
            depth = 2;
            sub_tree_id = 352;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_5_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=45050,650,x");
            address = 360;
        gates:
    }
    Server_5_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=45175,650,x");
            address = 361;
        gates:
    }
    Server_5_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=45300,650,x");
            address = 362;
        gates:
    }
    Server_5_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=45425,650,x");
            address = 363;
        gates:
    }
    Server_5_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=45550,650,x");
            address = 364;
        gates:
    }
    Server_5_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=45675,650,x");
            address = 365;
        gates:
    }
    Server_5_5_6 : <ServerType> like Server
    {
        parameters:
            @display("p=45800,650,x");
            address = 366;
        gates:
    }
    Server_5_5_7 : <ServerType> like Server
    {
        parameters:
            @display("p=45925,650,x");
            address = 367;
        gates:
    }
    Switch_5_5_i0 : EthSwitch
    {
        parameters:
            @display("p=45487,450,x");
            switch_id = "Switch_5_5_i0";
            depth = 2;
            sub_tree_id = 360;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_5_6_0 : <ServerType> like Server
    {
        parameters:
            @display("p=46050,650,x");
            address = 368;
        gates:
    }
    Server_5_6_1 : <ServerType> like Server
    {
        parameters:
            @display("p=46175,650,x");
            address = 369;
        gates:
    }
    Server_5_6_2 : <ServerType> like Server
    {
        parameters:
            @display("p=46300,650,x");
            address = 370;
        gates:
    }
    Server_5_6_3 : <ServerType> like Server
    {
        parameters:
            @display("p=46425,650,x");
            address = 371;
        gates:
    }
    Server_5_6_4 : <ServerType> like Server
    {
        parameters:
            @display("p=46550,650,x");
            address = 372;
        gates:
    }
    Server_5_6_5 : <ServerType> like Server
    {
        parameters:
            @display("p=46675,650,x");
            address = 373;
        gates:
    }
    Server_5_6_6 : <ServerType> like Server
    {
        parameters:
            @display("p=46800,650,x");
            address = 374;
        gates:
    }
    Server_5_6_7 : <ServerType> like Server
    {
        parameters:
            @display("p=46925,650,x");
            address = 375;
        gates:
    }
    Switch_5_6_i0 : EthSwitch
    {
        parameters:
            @display("p=46487,450,x");
            switch_id = "Switch_5_6_i0";
            depth = 2;
            sub_tree_id = 368;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_5_7_0 : <ServerType> like Server
    {
        parameters:
            @display("p=47050,650,x");
            address = 376;
        gates:
    }
    Server_5_7_1 : <ServerType> like Server
    {
        parameters:
            @display("p=47175,650,x");
            address = 377;
        gates:
    }
    Server_5_7_2 : <ServerType> like Server
    {
        parameters:
            @display("p=47300,650,x");
            address = 378;
        gates:
    }
    Server_5_7_3 : <ServerType> like Server
    {
        parameters:
            @display("p=47425,650,x");
            address = 379;
        gates:
    }
    Server_5_7_4 : <ServerType> like Server
    {
        parameters:
            @display("p=47550,650,x");
            address = 380;
        gates:
    }
    Server_5_7_5 : <ServerType> like Server
    {
        parameters:
            @display("p=47675,650,x");
            address = 381;
        gates:
    }
    Server_5_7_6 : <ServerType> like Server
    {
        parameters:
            @display("p=47800,650,x");
            address = 382;
        gates:
    }
    Server_5_7_7 : <ServerType> like Server
    {
        parameters:
            @display("p=47925,650,x");
            address = 383;
        gates:
    }
    Switch_5_7_i0 : EthSwitch
    {
        parameters:
            @display("p=47487,450,x");
            switch_id = "Switch_5_7_i0";
            depth = 2;
            sub_tree_id = 376;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_5_i0 : EthSwitch
    {
        parameters:
            @display("p=40925,250,x");
            switch_id = "Switch_5_i0";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_5_i1 : EthSwitch
    {
        parameters:
            @display("p=41800,250,x");
            switch_id = "Switch_5_i1";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_5_i2 : EthSwitch
    {
        parameters:
            @display("p=42675,250,x");
            switch_id = "Switch_5_i2";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_5_i3 : EthSwitch
    {
        parameters:
            @display("p=43550,250,x");
            switch_id = "Switch_5_i3";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_5_i4 : EthSwitch
    {
        parameters:
            @display("p=44425,250,x");
            switch_id = "Switch_5_i4";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_5_i5 : EthSwitch
    {
        parameters:
            @display("p=45300,250,x");
            switch_id = "Switch_5_i5";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_5_i6 : EthSwitch
    {
        parameters:
            @display("p=46175,250,x");
            switch_id = "Switch_5_i6";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_5_i7 : EthSwitch
    {
        parameters:
            @display("p=47050,250,x");
            switch_id = "Switch_5_i7";
            depth = 1;
            sub_tree_id = 320;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_6_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=48050,650,x");
            address = 384;
        gates:
    }
    Server_6_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=48175,650,x");
            address = 385;
        gates:
    }
    Server_6_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=48300,650,x");
            address = 386;
        gates:
    }
    Server_6_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=48425,650,x");
            address = 387;
        gates:
    }
    Server_6_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=48550,650,x");
            address = 388;
        gates:
    }
    Server_6_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=48675,650,x");
            address = 389;
        gates:
    }
    Server_6_0_6 : <ServerType> like Server
    {
        parameters:
            @display("p=48800,650,x");
            address = 390;
        gates:
    }
    Server_6_0_7 : <ServerType> like Server
    {
        parameters:
            @display("p=48925,650,x");
            address = 391;
        gates:
    }
    Switch_6_0_i0 : EthSwitch
    {
        parameters:
            @display("p=48487,450,x");
            switch_id = "Switch_6_0_i0";
            depth = 2;
            sub_tree_id = 384;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_6_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=49050,650,x");
            address = 392;
        gates:
    }
    Server_6_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=49175,650,x");
            address = 393;
        gates:
    }
    Server_6_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=49300,650,x");
            address = 394;
        gates:
    }
    Server_6_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=49425,650,x");
            address = 395;
        gates:
    }
    Server_6_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=49550,650,x");
            address = 396;
        gates:
    }
    Server_6_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=49675,650,x");
            address = 397;
        gates:
    }
    Server_6_1_6 : <ServerType> like Server
    {
        parameters:
            @display("p=49800,650,x");
            address = 398;
        gates:
    }
    Server_6_1_7 : <ServerType> like Server
    {
        parameters:
            @display("p=49925,650,x");
            address = 399;
        gates:
    }
    Switch_6_1_i0 : EthSwitch
    {
        parameters:
            @display("p=49487,450,x");
            switch_id = "Switch_6_1_i0";
            depth = 2;
            sub_tree_id = 392;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_6_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=50050,650,x");
            address = 400;
        gates:
    }
    Server_6_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=50175,650,x");
            address = 401;
        gates:
    }
    Server_6_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=50300,650,x");
            address = 402;
        gates:
    }
    Server_6_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=50425,650,x");
            address = 403;
        gates:
    }
    Server_6_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=50550,650,x");
            address = 404;
        gates:
    }
    Server_6_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=50675,650,x");
            address = 405;
        gates:
    }
    Server_6_2_6 : <ServerType> like Server
    {
        parameters:
            @display("p=50800,650,x");
            address = 406;
        gates:
    }
    Server_6_2_7 : <ServerType> like Server
    {
        parameters:
            @display("p=50925,650,x");
            address = 407;
        gates:
    }
    Switch_6_2_i0 : EthSwitch
    {
        parameters:
            @display("p=50487,450,x");
            switch_id = "Switch_6_2_i0";
            depth = 2;
            sub_tree_id = 400;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_6_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=51050,650,x");
            address = 408;
        gates:
    }
    Server_6_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=51175,650,x");
            address = 409;
        gates:
    }
    Server_6_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=51300,650,x");
            address = 410;
        gates:
    }
    Server_6_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=51425,650,x");
            address = 411;
        gates:
    }
    Server_6_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=51550,650,x");
            address = 412;
        gates:
    }
    Server_6_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=51675,650,x");
            address = 413;
        gates:
    }
    Server_6_3_6 : <ServerType> like Server
    {
        parameters:
            @display("p=51800,650,x");
            address = 414;
        gates:
    }
    Server_6_3_7 : <ServerType> like Server
    {
        parameters:
            @display("p=51925,650,x");
            address = 415;
        gates:
    }
    Switch_6_3_i0 : EthSwitch
    {
        parameters:
            @display("p=51487,450,x");
            switch_id = "Switch_6_3_i0";
            depth = 2;
            sub_tree_id = 408;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_6_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=52050,650,x");
            address = 416;
        gates:
    }
    Server_6_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=52175,650,x");
            address = 417;
        gates:
    }
    Server_6_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=52300,650,x");
            address = 418;
        gates:
    }
    Server_6_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=52425,650,x");
            address = 419;
        gates:
    }
    Server_6_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=52550,650,x");
            address = 420;
        gates:
    }
    Server_6_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=52675,650,x");
            address = 421;
        gates:
    }
    Server_6_4_6 : <ServerType> like Server
    {
        parameters:
            @display("p=52800,650,x");
            address = 422;
        gates:
    }
    Server_6_4_7 : <ServerType> like Server
    {
        parameters:
            @display("p=52925,650,x");
            address = 423;
        gates:
    }
    Switch_6_4_i0 : EthSwitch
    {
        parameters:
            @display("p=52487,450,x");
            switch_id = "Switch_6_4_i0";
            depth = 2;
            sub_tree_id = 416;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_6_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=53050,650,x");
            address = 424;
        gates:
    }
    Server_6_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=53175,650,x");
            address = 425;
        gates:
    }
    Server_6_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=53300,650,x");
            address = 426;
        gates:
    }
    Server_6_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=53425,650,x");
            address = 427;
        gates:
    }
    Server_6_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=53550,650,x");
            address = 428;
        gates:
    }
    Server_6_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=53675,650,x");
            address = 429;
        gates:
    }
    Server_6_5_6 : <ServerType> like Server
    {
        parameters:
            @display("p=53800,650,x");
            address = 430;
        gates:
    }
    Server_6_5_7 : <ServerType> like Server
    {
        parameters:
            @display("p=53925,650,x");
            address = 431;
        gates:
    }
    Switch_6_5_i0 : EthSwitch
    {
        parameters:
            @display("p=53487,450,x");
            switch_id = "Switch_6_5_i0";
            depth = 2;
            sub_tree_id = 424;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_6_6_0 : <ServerType> like Server
    {
        parameters:
            @display("p=54050,650,x");
            address = 432;
        gates:
    }
    Server_6_6_1 : <ServerType> like Server
    {
        parameters:
            @display("p=54175,650,x");
            address = 433;
        gates:
    }
    Server_6_6_2 : <ServerType> like Server
    {
        parameters:
            @display("p=54300,650,x");
            address = 434;
        gates:
    }
    Server_6_6_3 : <ServerType> like Server
    {
        parameters:
            @display("p=54425,650,x");
            address = 435;
        gates:
    }
    Server_6_6_4 : <ServerType> like Server
    {
        parameters:
            @display("p=54550,650,x");
            address = 436;
        gates:
    }
    Server_6_6_5 : <ServerType> like Server
    {
        parameters:
            @display("p=54675,650,x");
            address = 437;
        gates:
    }
    Server_6_6_6 : <ServerType> like Server
    {
        parameters:
            @display("p=54800,650,x");
            address = 438;
        gates:
    }
    Server_6_6_7 : <ServerType> like Server
    {
        parameters:
            @display("p=54925,650,x");
            address = 439;
        gates:
    }
    Switch_6_6_i0 : EthSwitch
    {
        parameters:
            @display("p=54487,450,x");
            switch_id = "Switch_6_6_i0";
            depth = 2;
            sub_tree_id = 432;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_6_7_0 : <ServerType> like Server
    {
        parameters:
            @display("p=55050,650,x");
            address = 440;
        gates:
    }
    Server_6_7_1 : <ServerType> like Server
    {
        parameters:
            @display("p=55175,650,x");
            address = 441;
        gates:
    }
    Server_6_7_2 : <ServerType> like Server
    {
        parameters:
            @display("p=55300,650,x");
            address = 442;
        gates:
    }
    Server_6_7_3 : <ServerType> like Server
    {
        parameters:
            @display("p=55425,650,x");
            address = 443;
        gates:
    }
    Server_6_7_4 : <ServerType> like Server
    {
        parameters:
            @display("p=55550,650,x");
            address = 444;
        gates:
    }
    Server_6_7_5 : <ServerType> like Server
    {
        parameters:
            @display("p=55675,650,x");
            address = 445;
        gates:
    }
    Server_6_7_6 : <ServerType> like Server
    {
        parameters:
            @display("p=55800,650,x");
            address = 446;
        gates:
    }
    Server_6_7_7 : <ServerType> like Server
    {
        parameters:
            @display("p=55925,650,x");
            address = 447;
        gates:
    }
    Switch_6_7_i0 : EthSwitch
    {
        parameters:
            @display("p=55487,450,x");
            switch_id = "Switch_6_7_i0";
            depth = 2;
            sub_tree_id = 440;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_6_i0 : EthSwitch
    {
        parameters:
            @display("p=48925,250,x");
            switch_id = "Switch_6_i0";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_6_i1 : EthSwitch
    {
        parameters:
            @display("p=49800,250,x");
            switch_id = "Switch_6_i1";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_6_i2 : EthSwitch
    {
        parameters:
            @display("p=50675,250,x");
            switch_id = "Switch_6_i2";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_6_i3 : EthSwitch
    {
        parameters:
            @display("p=51550,250,x");
            switch_id = "Switch_6_i3";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_6_i4 : EthSwitch
    {
        parameters:
            @display("p=52425,250,x");
            switch_id = "Switch_6_i4";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_6_i5 : EthSwitch
    {
        parameters:
            @display("p=53300,250,x");
            switch_id = "Switch_6_i5";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_6_i6 : EthSwitch
    {
        parameters:
            @display("p=54175,250,x");
            switch_id = "Switch_6_i6";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_6_i7 : EthSwitch
    {
        parameters:
            @display("p=55050,250,x");
            switch_id = "Switch_6_i7";
            depth = 1;
            sub_tree_id = 384;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_7_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=56050,650,x");
            address = 448;
        gates:
    }
    Server_7_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=56175,650,x");
            address = 449;
        gates:
    }
    Server_7_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=56300,650,x");
            address = 450;
        gates:
    }
    Server_7_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=56425,650,x");
            address = 451;
        gates:
    }
    Server_7_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=56550,650,x");
            address = 452;
        gates:
    }
    Server_7_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=56675,650,x");
            address = 453;
        gates:
    }
    Server_7_0_6 : <ServerType> like Server
    {
        parameters:
            @display("p=56800,650,x");
            address = 454;
        gates:
    }
    Server_7_0_7 : <ServerType> like Server
    {
        parameters:
            @display("p=56925,650,x");
            address = 455;
        gates:
    }
    Switch_7_0_i0 : EthSwitch
    {
        parameters:
            @display("p=56487,450,x");
            switch_id = "Switch_7_0_i0";
            depth = 2;
            sub_tree_id = 448;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_7_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=57050,650,x");
            address = 456;
        gates:
    }
    Server_7_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=57175,650,x");
            address = 457;
        gates:
    }
    Server_7_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=57300,650,x");
            address = 458;
        gates:
    }
    Server_7_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=57425,650,x");
            address = 459;
        gates:
    }
    Server_7_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=57550,650,x");
            address = 460;
        gates:
    }
    Server_7_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=57675,650,x");
            address = 461;
        gates:
    }
    Server_7_1_6 : <ServerType> like Server
    {
        parameters:
            @display("p=57800,650,x");
            address = 462;
        gates:
    }
    Server_7_1_7 : <ServerType> like Server
    {
        parameters:
            @display("p=57925,650,x");
            address = 463;
        gates:
    }
    Switch_7_1_i0 : EthSwitch
    {
        parameters:
            @display("p=57487,450,x");
            switch_id = "Switch_7_1_i0";
            depth = 2;
            sub_tree_id = 456;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_7_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=58050,650,x");
            address = 464;
        gates:
    }
    Server_7_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=58175,650,x");
            address = 465;
        gates:
    }
    Server_7_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=58300,650,x");
            address = 466;
        gates:
    }
    Server_7_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=58425,650,x");
            address = 467;
        gates:
    }
    Server_7_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=58550,650,x");
            address = 468;
        gates:
    }
    Server_7_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=58675,650,x");
            address = 469;
        gates:
    }
    Server_7_2_6 : <ServerType> like Server
    {
        parameters:
            @display("p=58800,650,x");
            address = 470;
        gates:
    }
    Server_7_2_7 : <ServerType> like Server
    {
        parameters:
            @display("p=58925,650,x");
            address = 471;
        gates:
    }
    Switch_7_2_i0 : EthSwitch
    {
        parameters:
            @display("p=58487,450,x");
            switch_id = "Switch_7_2_i0";
            depth = 2;
            sub_tree_id = 464;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_7_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=59050,650,x");
            address = 472;
        gates:
    }
    Server_7_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=59175,650,x");
            address = 473;
        gates:
    }
    Server_7_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=59300,650,x");
            address = 474;
        gates:
    }
    Server_7_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=59425,650,x");
            address = 475;
        gates:
    }
    Server_7_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=59550,650,x");
            address = 476;
        gates:
    }
    Server_7_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=59675,650,x");
            address = 477;
        gates:
    }
    Server_7_3_6 : <ServerType> like Server
    {
        parameters:
            @display("p=59800,650,x");
            address = 478;
        gates:
    }
    Server_7_3_7 : <ServerType> like Server
    {
        parameters:
            @display("p=59925,650,x");
            address = 479;
        gates:
    }
    Switch_7_3_i0 : EthSwitch
    {
        parameters:
            @display("p=59487,450,x");
            switch_id = "Switch_7_3_i0";
            depth = 2;
            sub_tree_id = 472;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_7_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=60050,650,x");
            address = 480;
        gates:
    }
    Server_7_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=60175,650,x");
            address = 481;
        gates:
    }
    Server_7_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=60300,650,x");
            address = 482;
        gates:
    }
    Server_7_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=60425,650,x");
            address = 483;
        gates:
    }
    Server_7_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=60550,650,x");
            address = 484;
        gates:
    }
    Server_7_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=60675,650,x");
            address = 485;
        gates:
    }
    Server_7_4_6 : <ServerType> like Server
    {
        parameters:
            @display("p=60800,650,x");
            address = 486;
        gates:
    }
    Server_7_4_7 : <ServerType> like Server
    {
        parameters:
            @display("p=60925,650,x");
            address = 487;
        gates:
    }
    Switch_7_4_i0 : EthSwitch
    {
        parameters:
            @display("p=60487,450,x");
            switch_id = "Switch_7_4_i0";
            depth = 2;
            sub_tree_id = 480;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_7_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=61050,650,x");
            address = 488;
        gates:
    }
    Server_7_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=61175,650,x");
            address = 489;
        gates:
    }
    Server_7_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=61300,650,x");
            address = 490;
        gates:
    }
    Server_7_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=61425,650,x");
            address = 491;
        gates:
    }
    Server_7_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=61550,650,x");
            address = 492;
        gates:
    }
    Server_7_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=61675,650,x");
            address = 493;
        gates:
    }
    Server_7_5_6 : <ServerType> like Server
    {
        parameters:
            @display("p=61800,650,x");
            address = 494;
        gates:
    }
    Server_7_5_7 : <ServerType> like Server
    {
        parameters:
            @display("p=61925,650,x");
            address = 495;
        gates:
    }
    Switch_7_5_i0 : EthSwitch
    {
        parameters:
            @display("p=61487,450,x");
            switch_id = "Switch_7_5_i0";
            depth = 2;
            sub_tree_id = 488;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_7_6_0 : <ServerType> like Server
    {
        parameters:
            @display("p=62050,650,x");
            address = 496;
        gates:
    }
    Server_7_6_1 : <ServerType> like Server
    {
        parameters:
            @display("p=62175,650,x");
            address = 497;
        gates:
    }
    Server_7_6_2 : <ServerType> like Server
    {
        parameters:
            @display("p=62300,650,x");
            address = 498;
        gates:
    }
    Server_7_6_3 : <ServerType> like Server
    {
        parameters:
            @display("p=62425,650,x");
            address = 499;
        gates:
    }
    Server_7_6_4 : <ServerType> like Server
    {
        parameters:
            @display("p=62550,650,x");
            address = 500;
        gates:
    }
    Server_7_6_5 : <ServerType> like Server
    {
        parameters:
            @display("p=62675,650,x");
            address = 501;
        gates:
    }
    Server_7_6_6 : <ServerType> like Server
    {
        parameters:
            @display("p=62800,650,x");
            address = 502;
        gates:
    }
    Server_7_6_7 : <ServerType> like Server
    {
        parameters:
            @display("p=62925,650,x");
            address = 503;
        gates:
    }
    Switch_7_6_i0 : EthSwitch
    {
        parameters:
            @display("p=62487,450,x");
            switch_id = "Switch_7_6_i0";
            depth = 2;
            sub_tree_id = 496;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_7_7_0 : <ServerType> like Server
    {
        parameters:
            @display("p=63050,650,x");
            address = 504;
        gates:
    }
    Server_7_7_1 : <ServerType> like Server
    {
        parameters:
            @display("p=63175,650,x");
            address = 505;
        gates:
    }
    Server_7_7_2 : <ServerType> like Server
    {
        parameters:
            @display("p=63300,650,x");
            address = 506;
        gates:
    }
    Server_7_7_3 : <ServerType> like Server
    {
        parameters:
            @display("p=63425,650,x");
            address = 507;
        gates:
    }
    Server_7_7_4 : <ServerType> like Server
    {
        parameters:
            @display("p=63550,650,x");
            address = 508;
        gates:
    }
    Server_7_7_5 : <ServerType> like Server
    {
        parameters:
            @display("p=63675,650,x");
            address = 509;
        gates:
    }
    Server_7_7_6 : <ServerType> like Server
    {
        parameters:
            @display("p=63800,650,x");
            address = 510;
        gates:
    }
    Server_7_7_7 : <ServerType> like Server
    {
        parameters:
            @display("p=63925,650,x");
            address = 511;
        gates:
    }
    Switch_7_7_i0 : EthSwitch
    {
        parameters:
            @display("p=63487,450,x");
            switch_id = "Switch_7_7_i0";
            depth = 2;
            sub_tree_id = 504;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_7_i0 : EthSwitch
    {
        parameters:
            @display("p=56925,250,x");
            switch_id = "Switch_7_i0";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_7_i1 : EthSwitch
    {
        parameters:
            @display("p=57800,250,x");
            switch_id = "Switch_7_i1";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_7_i2 : EthSwitch
    {
        parameters:
            @display("p=58675,250,x");
            switch_id = "Switch_7_i2";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_7_i3 : EthSwitch
    {
        parameters:
            @display("p=59550,250,x");
            switch_id = "Switch_7_i3";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_7_i4 : EthSwitch
    {
        parameters:
            @display("p=60425,250,x");
            switch_id = "Switch_7_i4";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_7_i5 : EthSwitch
    {
        parameters:
            @display("p=61300,250,x");
            switch_id = "Switch_7_i5";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_7_i6 : EthSwitch
    {
        parameters:
            @display("p=62175,250,x");
            switch_id = "Switch_7_i6";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_7_i7 : EthSwitch
    {
        parameters:
            @display("p=63050,250,x");
            switch_id = "Switch_7_i7";
            depth = 1;
            sub_tree_id = 448;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_8_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=64050,650,x");
            address = 512;
        gates:
    }
    Server_8_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=64175,650,x");
            address = 513;
        gates:
    }
    Server_8_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=64300,650,x");
            address = 514;
        gates:
    }
    Server_8_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=64425,650,x");
            address = 515;
        gates:
    }
    Server_8_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=64550,650,x");
            address = 516;
        gates:
    }
    Server_8_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=64675,650,x");
            address = 517;
        gates:
    }
    Server_8_0_6 : <ServerType> like Server
    {
        parameters:
            @display("p=64800,650,x");
            address = 518;
        gates:
    }
    Server_8_0_7 : <ServerType> like Server
    {
        parameters:
            @display("p=64925,650,x");
            address = 519;
        gates:
    }
    Switch_8_0_i0 : EthSwitch
    {
        parameters:
            @display("p=64487,450,x");
            switch_id = "Switch_8_0_i0";
            depth = 2;
            sub_tree_id = 512;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_8_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=65050,650,x");
            address = 520;
        gates:
    }
    Server_8_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=65175,650,x");
            address = 521;
        gates:
    }
    Server_8_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=65300,650,x");
            address = 522;
        gates:
    }
    Server_8_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=65425,650,x");
            address = 523;
        gates:
    }
    Server_8_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=65550,650,x");
            address = 524;
        gates:
    }
    Server_8_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=65675,650,x");
            address = 525;
        gates:
    }
    Server_8_1_6 : <ServerType> like Server
    {
        parameters:
            @display("p=65800,650,x");
            address = 526;
        gates:
    }
    Server_8_1_7 : <ServerType> like Server
    {
        parameters:
            @display("p=65925,650,x");
            address = 527;
        gates:
    }
    Switch_8_1_i0 : EthSwitch
    {
        parameters:
            @display("p=65487,450,x");
            switch_id = "Switch_8_1_i0";
            depth = 2;
            sub_tree_id = 520;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_8_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=66050,650,x");
            address = 528;
        gates:
    }
    Server_8_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=66175,650,x");
            address = 529;
        gates:
    }
    Server_8_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=66300,650,x");
            address = 530;
        gates:
    }
    Server_8_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=66425,650,x");
            address = 531;
        gates:
    }
    Server_8_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=66550,650,x");
            address = 532;
        gates:
    }
    Server_8_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=66675,650,x");
            address = 533;
        gates:
    }
    Server_8_2_6 : <ServerType> like Server
    {
        parameters:
            @display("p=66800,650,x");
            address = 534;
        gates:
    }
    Server_8_2_7 : <ServerType> like Server
    {
        parameters:
            @display("p=66925,650,x");
            address = 535;
        gates:
    }
    Switch_8_2_i0 : EthSwitch
    {
        parameters:
            @display("p=66487,450,x");
            switch_id = "Switch_8_2_i0";
            depth = 2;
            sub_tree_id = 528;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_8_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=67050,650,x");
            address = 536;
        gates:
    }
    Server_8_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=67175,650,x");
            address = 537;
        gates:
    }
    Server_8_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=67300,650,x");
            address = 538;
        gates:
    }
    Server_8_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=67425,650,x");
            address = 539;
        gates:
    }
    Server_8_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=67550,650,x");
            address = 540;
        gates:
    }
    Server_8_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=67675,650,x");
            address = 541;
        gates:
    }
    Server_8_3_6 : <ServerType> like Server
    {
        parameters:
            @display("p=67800,650,x");
            address = 542;
        gates:
    }
    Server_8_3_7 : <ServerType> like Server
    {
        parameters:
            @display("p=67925,650,x");
            address = 543;
        gates:
    }
    Switch_8_3_i0 : EthSwitch
    {
        parameters:
            @display("p=67487,450,x");
            switch_id = "Switch_8_3_i0";
            depth = 2;
            sub_tree_id = 536;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_8_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=68050,650,x");
            address = 544;
        gates:
    }
    Server_8_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=68175,650,x");
            address = 545;
        gates:
    }
    Server_8_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=68300,650,x");
            address = 546;
        gates:
    }
    Server_8_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=68425,650,x");
            address = 547;
        gates:
    }
    Server_8_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=68550,650,x");
            address = 548;
        gates:
    }
    Server_8_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=68675,650,x");
            address = 549;
        gates:
    }
    Server_8_4_6 : <ServerType> like Server
    {
        parameters:
            @display("p=68800,650,x");
            address = 550;
        gates:
    }
    Server_8_4_7 : <ServerType> like Server
    {
        parameters:
            @display("p=68925,650,x");
            address = 551;
        gates:
    }
    Switch_8_4_i0 : EthSwitch
    {
        parameters:
            @display("p=68487,450,x");
            switch_id = "Switch_8_4_i0";
            depth = 2;
            sub_tree_id = 544;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_8_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=69050,650,x");
            address = 552;
        gates:
    }
    Server_8_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=69175,650,x");
            address = 553;
        gates:
    }
    Server_8_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=69300,650,x");
            address = 554;
        gates:
    }
    Server_8_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=69425,650,x");
            address = 555;
        gates:
    }
    Server_8_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=69550,650,x");
            address = 556;
        gates:
    }
    Server_8_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=69675,650,x");
            address = 557;
        gates:
    }
    Server_8_5_6 : <ServerType> like Server
    {
        parameters:
            @display("p=69800,650,x");
            address = 558;
        gates:
    }
    Server_8_5_7 : <ServerType> like Server
    {
        parameters:
            @display("p=69925,650,x");
            address = 559;
        gates:
    }
    Switch_8_5_i0 : EthSwitch
    {
        parameters:
            @display("p=69487,450,x");
            switch_id = "Switch_8_5_i0";
            depth = 2;
            sub_tree_id = 552;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_8_6_0 : <ServerType> like Server
    {
        parameters:
            @display("p=70050,650,x");
            address = 560;
        gates:
    }
    Server_8_6_1 : <ServerType> like Server
    {
        parameters:
            @display("p=70175,650,x");
            address = 561;
        gates:
    }
    Server_8_6_2 : <ServerType> like Server
    {
        parameters:
            @display("p=70300,650,x");
            address = 562;
        gates:
    }
    Server_8_6_3 : <ServerType> like Server
    {
        parameters:
            @display("p=70425,650,x");
            address = 563;
        gates:
    }
    Server_8_6_4 : <ServerType> like Server
    {
        parameters:
            @display("p=70550,650,x");
            address = 564;
        gates:
    }
    Server_8_6_5 : <ServerType> like Server
    {
        parameters:
            @display("p=70675,650,x");
            address = 565;
        gates:
    }
    Server_8_6_6 : <ServerType> like Server
    {
        parameters:
            @display("p=70800,650,x");
            address = 566;
        gates:
    }
    Server_8_6_7 : <ServerType> like Server
    {
        parameters:
            @display("p=70925,650,x");
            address = 567;
        gates:
    }
    Switch_8_6_i0 : EthSwitch
    {
        parameters:
            @display("p=70487,450,x");
            switch_id = "Switch_8_6_i0";
            depth = 2;
            sub_tree_id = 560;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_8_7_0 : <ServerType> like Server
    {
        parameters:
            @display("p=71050,650,x");
            address = 568;
        gates:
    }
    Server_8_7_1 : <ServerType> like Server
    {
        parameters:
            @display("p=71175,650,x");
            address = 569;
        gates:
    }
    Server_8_7_2 : <ServerType> like Server
    {
        parameters:
            @display("p=71300,650,x");
            address = 570;
        gates:
    }
    Server_8_7_3 : <ServerType> like Server
    {
        parameters:
            @display("p=71425,650,x");
            address = 571;
        gates:
    }
    Server_8_7_4 : <ServerType> like Server
    {
        parameters:
            @display("p=71550,650,x");
            address = 572;
        gates:
    }
    Server_8_7_5 : <ServerType> like Server
    {
        parameters:
            @display("p=71675,650,x");
            address = 573;
        gates:
    }
    Server_8_7_6 : <ServerType> like Server
    {
        parameters:
            @display("p=71800,650,x");
            address = 574;
        gates:
    }
    Server_8_7_7 : <ServerType> like Server
    {
        parameters:
            @display("p=71925,650,x");
            address = 575;
        gates:
    }
    Switch_8_7_i0 : EthSwitch
    {
        parameters:
            @display("p=71487,450,x");
            switch_id = "Switch_8_7_i0";
            depth = 2;
            sub_tree_id = 568;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_8_i0 : EthSwitch
    {
        parameters:
            @display("p=64925,250,x");
            switch_id = "Switch_8_i0";
            depth = 1;
            sub_tree_id = 512;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_8_i1 : EthSwitch
    {
        parameters:
            @display("p=65800,250,x");
            switch_id = "Switch_8_i1";
            depth = 1;
            sub_tree_id = 512;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_8_i2 : EthSwitch
    {
        parameters:
            @display("p=66675,250,x");
            switch_id = "Switch_8_i2";
            depth = 1;
            sub_tree_id = 512;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_8_i3 : EthSwitch
    {
        parameters:
            @display("p=67550,250,x");
            switch_id = "Switch_8_i3";
            depth = 1;
            sub_tree_id = 512;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_8_i4 : EthSwitch
    {
        parameters:
            @display("p=68425,250,x");
            switch_id = "Switch_8_i4";
            depth = 1;
            sub_tree_id = 512;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_8_i5 : EthSwitch
    {
        parameters:
            @display("p=69300,250,x");
            switch_id = "Switch_8_i5";
            depth = 1;
            sub_tree_id = 512;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_8_i6 : EthSwitch
    {
        parameters:
            @display("p=70175,250,x");
            switch_id = "Switch_8_i6";
            depth = 1;
            sub_tree_id = 512;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_8_i7 : EthSwitch
    {
        parameters:
            @display("p=71050,250,x");
            switch_id = "Switch_8_i7";
            depth = 1;
            sub_tree_id = 512;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_9_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=72050,650,x");
            address = 576;
        gates:
    }
    Server_9_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=72175,650,x");
            address = 577;
        gates:
    }
    Server_9_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=72300,650,x");
            address = 578;
        gates:
    }
    Server_9_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=72425,650,x");
            address = 579;
        gates:
    }
    Server_9_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=72550,650,x");
            address = 580;
        gates:
    }
    Server_9_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=72675,650,x");
            address = 581;
        gates:
    }
    Server_9_0_6 : <ServerType> like Server
    {
        parameters:
            @display("p=72800,650,x");
            address = 582;
        gates:
    }
    Server_9_0_7 : <ServerType> like Server
    {
        parameters:
            @display("p=72925,650,x");
            address = 583;
        gates:
    }
    Switch_9_0_i0 : EthSwitch
    {
        parameters:
            @display("p=72487,450,x");
            switch_id = "Switch_9_0_i0";
            depth = 2;
            sub_tree_id = 576;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_9_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=73050,650,x");
            address = 584;
        gates:
    }
    Server_9_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=73175,650,x");
            address = 585;
        gates:
    }
    Server_9_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=73300,650,x");
            address = 586;
        gates:
    }
    Server_9_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=73425,650,x");
            address = 587;
        gates:
    }
    Server_9_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=73550,650,x");
            address = 588;
        gates:
    }
    Server_9_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=73675,650,x");
            address = 589;
        gates:
    }
    Server_9_1_6 : <ServerType> like Server
    {
        parameters:
            @display("p=73800,650,x");
            address = 590;
        gates:
    }
    Server_9_1_7 : <ServerType> like Server
    {
        parameters:
            @display("p=73925,650,x");
            address = 591;
        gates:
    }
    Switch_9_1_i0 : EthSwitch
    {
        parameters:
            @display("p=73487,450,x");
            switch_id = "Switch_9_1_i0";
            depth = 2;
            sub_tree_id = 584;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_9_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=74050,650,x");
            address = 592;
        gates:
    }
    Server_9_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=74175,650,x");
            address = 593;
        gates:
    }
    Server_9_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=74300,650,x");
            address = 594;
        gates:
    }
    Server_9_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=74425,650,x");
            address = 595;
        gates:
    }
    Server_9_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=74550,650,x");
            address = 596;
        gates:
    }
    Server_9_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=74675,650,x");
            address = 597;
        gates:
    }
    Server_9_2_6 : <ServerType> like Server
    {
        parameters:
            @display("p=74800,650,x");
            address = 598;
        gates:
    }
    Server_9_2_7 : <ServerType> like Server
    {
        parameters:
            @display("p=74925,650,x");
            address = 599;
        gates:
    }
    Switch_9_2_i0 : EthSwitch
    {
        parameters:
            @display("p=74487,450,x");
            switch_id = "Switch_9_2_i0";
            depth = 2;
            sub_tree_id = 592;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_9_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=75050,650,x");
            address = 600;
        gates:
    }
    Server_9_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=75175,650,x");
            address = 601;
        gates:
    }
    Server_9_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=75300,650,x");
            address = 602;
        gates:
    }
    Server_9_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=75425,650,x");
            address = 603;
        gates:
    }
    Server_9_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=75550,650,x");
            address = 604;
        gates:
    }
    Server_9_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=75675,650,x");
            address = 605;
        gates:
    }
    Server_9_3_6 : <ServerType> like Server
    {
        parameters:
            @display("p=75800,650,x");
            address = 606;
        gates:
    }
    Server_9_3_7 : <ServerType> like Server
    {
        parameters:
            @display("p=75925,650,x");
            address = 607;
        gates:
    }
    Switch_9_3_i0 : EthSwitch
    {
        parameters:
            @display("p=75487,450,x");
            switch_id = "Switch_9_3_i0";
            depth = 2;
            sub_tree_id = 600;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_9_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=76050,650,x");
            address = 608;
        gates:
    }
    Server_9_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=76175,650,x");
            address = 609;
        gates:
    }
    Server_9_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=76300,650,x");
            address = 610;
        gates:
    }
    Server_9_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=76425,650,x");
            address = 611;
        gates:
    }
    Server_9_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=76550,650,x");
            address = 612;
        gates:
    }
    Server_9_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=76675,650,x");
            address = 613;
        gates:
    }
    Server_9_4_6 : <ServerType> like Server
    {
        parameters:
            @display("p=76800,650,x");
            address = 614;
        gates:
    }
    Server_9_4_7 : <ServerType> like Server
    {
        parameters:
            @display("p=76925,650,x");
            address = 615;
        gates:
    }
    Switch_9_4_i0 : EthSwitch
    {
        parameters:
            @display("p=76487,450,x");
            switch_id = "Switch_9_4_i0";
            depth = 2;
            sub_tree_id = 608;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_9_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=77050,650,x");
            address = 616;
        gates:
    }
    Server_9_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=77175,650,x");
            address = 617;
        gates:
    }
    Server_9_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=77300,650,x");
            address = 618;
        gates:
    }
    Server_9_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=77425,650,x");
            address = 619;
        gates:
    }
    Server_9_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=77550,650,x");
            address = 620;
        gates:
    }
    Server_9_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=77675,650,x");
            address = 621;
        gates:
    }
    Server_9_5_6 : <ServerType> like Server
    {
        parameters:
            @display("p=77800,650,x");
            address = 622;
        gates:
    }
    Server_9_5_7 : <ServerType> like Server
    {
        parameters:
            @display("p=77925,650,x");
            address = 623;
        gates:
    }
    Switch_9_5_i0 : EthSwitch
    {
        parameters:
            @display("p=77487,450,x");
            switch_id = "Switch_9_5_i0";
            depth = 2;
            sub_tree_id = 616;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_9_6_0 : <ServerType> like Server
    {
        parameters:
            @display("p=78050,650,x");
            address = 624;
        gates:
    }
    Server_9_6_1 : <ServerType> like Server
    {
        parameters:
            @display("p=78175,650,x");
            address = 625;
        gates:
    }
    Server_9_6_2 : <ServerType> like Server
    {
        parameters:
            @display("p=78300,650,x");
            address = 626;
        gates:
    }
    Server_9_6_3 : <ServerType> like Server
    {
        parameters:
            @display("p=78425,650,x");
            address = 627;
        gates:
    }
    Server_9_6_4 : <ServerType> like Server
    {
        parameters:
            @display("p=78550,650,x");
            address = 628;
        gates:
    }
    Server_9_6_5 : <ServerType> like Server
    {
        parameters:
            @display("p=78675,650,x");
            address = 629;
        gates:
    }
    Server_9_6_6 : <ServerType> like Server
    {
        parameters:
            @display("p=78800,650,x");
            address = 630;
        gates:
    }
    Server_9_6_7 : <ServerType> like Server
    {
        parameters:
            @display("p=78925,650,x");
            address = 631;
        gates:
    }
    Switch_9_6_i0 : EthSwitch
    {
        parameters:
            @display("p=78487,450,x");
            switch_id = "Switch_9_6_i0";
            depth = 2;
            sub_tree_id = 624;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_9_7_0 : <ServerType> like Server
    {
        parameters:
            @display("p=79050,650,x");
            address = 632;
        gates:
    }
    Server_9_7_1 : <ServerType> like Server
    {
        parameters:
            @display("p=79175,650,x");
            address = 633;
        gates:
    }
    Server_9_7_2 : <ServerType> like Server
    {
        parameters:
            @display("p=79300,650,x");
            address = 634;
        gates:
    }
    Server_9_7_3 : <ServerType> like Server
    {
        parameters:
            @display("p=79425,650,x");
            address = 635;
        gates:
    }
    Server_9_7_4 : <ServerType> like Server
    {
        parameters:
            @display("p=79550,650,x");
            address = 636;
        gates:
    }
    Server_9_7_5 : <ServerType> like Server
    {
        parameters:
            @display("p=79675,650,x");
            address = 637;
        gates:
    }
    Server_9_7_6 : <ServerType> like Server
    {
        parameters:
            @display("p=79800,650,x");
            address = 638;
        gates:
    }
    Server_9_7_7 : <ServerType> like Server
    {
        parameters:
            @display("p=79925,650,x");
            address = 639;
        gates:
    }
    Switch_9_7_i0 : EthSwitch
    {
        parameters:
            @display("p=79487,450,x");
            switch_id = "Switch_9_7_i0";
            depth = 2;
            sub_tree_id = 632;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_9_i0 : EthSwitch
    {
        parameters:
            @display("p=72925,250,x");
            switch_id = "Switch_9_i0";
            depth = 1;
            sub_tree_id = 576;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_9_i1 : EthSwitch
    {
        parameters:
            @display("p=73800,250,x");
            switch_id = "Switch_9_i1";
            depth = 1;
            sub_tree_id = 576;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_9_i2 : EthSwitch
    {
        parameters:
            @display("p=74675,250,x");
            switch_id = "Switch_9_i2";
            depth = 1;
            sub_tree_id = 576;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_9_i3 : EthSwitch
    {
        parameters:
            @display("p=75550,250,x");
            switch_id = "Switch_9_i3";
            depth = 1;
            sub_tree_id = 576;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_9_i4 : EthSwitch
    {
        parameters:
            @display("p=76425,250,x");
            switch_id = "Switch_9_i4";
            depth = 1;
            sub_tree_id = 576;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_9_i5 : EthSwitch
    {
        parameters:
            @display("p=77300,250,x");
            switch_id = "Switch_9_i5";
            depth = 1;
            sub_tree_id = 576;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_9_i6 : EthSwitch
    {
        parameters:
            @display("p=78175,250,x");
            switch_id = "Switch_9_i6";
            depth = 1;
            sub_tree_id = 576;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_9_i7 : EthSwitch
    {
        parameters:
            @display("p=79050,250,x");
            switch_id = "Switch_9_i7";
            depth = 1;
            sub_tree_id = 576;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_10_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=80050,650,x");
            address = 640;
        gates:
    }
    Server_10_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=80175,650,x");
            address = 641;
        gates:
    }
    Server_10_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=80300,650,x");
            address = 642;
        gates:
    }
    Server_10_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=80425,650,x");
            address = 643;
        gates:
    }
    Server_10_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=80550,650,x");
            address = 644;
        gates:
    }
    Server_10_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=80675,650,x");
            address = 645;
        gates:
    }
    Server_10_0_6 : <ServerType> like Server
    {
        parameters:
            @display("p=80800,650,x");
            address = 646;
        gates:
    }
    Server_10_0_7 : <ServerType> like Server
    {
        parameters:
            @display("p=80925,650,x");
            address = 647;
        gates:
    }
    Switch_10_0_i0 : EthSwitch
    {
        parameters:
            @display("p=80487,450,x");
            switch_id = "Switch_10_0_i0";
            depth = 2;
            sub_tree_id = 640;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_10_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=81050,650,x");
            address = 648;
        gates:
    }
    Server_10_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=81175,650,x");
            address = 649;
        gates:
    }
    Server_10_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=81300,650,x");
            address = 650;
        gates:
    }
    Server_10_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=81425,650,x");
            address = 651;
        gates:
    }
    Server_10_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=81550,650,x");
            address = 652;
        gates:
    }
    Server_10_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=81675,650,x");
            address = 653;
        gates:
    }
    Server_10_1_6 : <ServerType> like Server
    {
        parameters:
            @display("p=81800,650,x");
            address = 654;
        gates:
    }
    Server_10_1_7 : <ServerType> like Server
    {
        parameters:
            @display("p=81925,650,x");
            address = 655;
        gates:
    }
    Switch_10_1_i0 : EthSwitch
    {
        parameters:
            @display("p=81487,450,x");
            switch_id = "Switch_10_1_i0";
            depth = 2;
            sub_tree_id = 648;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_10_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=82050,650,x");
            address = 656;
        gates:
    }
    Server_10_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=82175,650,x");
            address = 657;
        gates:
    }
    Server_10_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=82300,650,x");
            address = 658;
        gates:
    }
    Server_10_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=82425,650,x");
            address = 659;
        gates:
    }
    Server_10_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=82550,650,x");
            address = 660;
        gates:
    }
    Server_10_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=82675,650,x");
            address = 661;
        gates:
    }
    Server_10_2_6 : <ServerType> like Server
    {
        parameters:
            @display("p=82800,650,x");
            address = 662;
        gates:
    }
    Server_10_2_7 : <ServerType> like Server
    {
        parameters:
            @display("p=82925,650,x");
            address = 663;
        gates:
    }
    Switch_10_2_i0 : EthSwitch
    {
        parameters:
            @display("p=82487,450,x");
            switch_id = "Switch_10_2_i0";
            depth = 2;
            sub_tree_id = 656;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_10_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=83050,650,x");
            address = 664;
        gates:
    }
    Server_10_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=83175,650,x");
            address = 665;
        gates:
    }
    Server_10_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=83300,650,x");
            address = 666;
        gates:
    }
    Server_10_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=83425,650,x");
            address = 667;
        gates:
    }
    Server_10_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=83550,650,x");
            address = 668;
        gates:
    }
    Server_10_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=83675,650,x");
            address = 669;
        gates:
    }
    Server_10_3_6 : <ServerType> like Server
    {
        parameters:
            @display("p=83800,650,x");
            address = 670;
        gates:
    }
    Server_10_3_7 : <ServerType> like Server
    {
        parameters:
            @display("p=83925,650,x");
            address = 671;
        gates:
    }
    Switch_10_3_i0 : EthSwitch
    {
        parameters:
            @display("p=83487,450,x");
            switch_id = "Switch_10_3_i0";
            depth = 2;
            sub_tree_id = 664;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_10_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=84050,650,x");
            address = 672;
        gates:
    }
    Server_10_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=84175,650,x");
            address = 673;
        gates:
    }
    Server_10_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=84300,650,x");
            address = 674;
        gates:
    }
    Server_10_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=84425,650,x");
            address = 675;
        gates:
    }
    Server_10_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=84550,650,x");
            address = 676;
        gates:
    }
    Server_10_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=84675,650,x");
            address = 677;
        gates:
    }
    Server_10_4_6 : <ServerType> like Server
    {
        parameters:
            @display("p=84800,650,x");
            address = 678;
        gates:
    }
    Server_10_4_7 : <ServerType> like Server
    {
        parameters:
            @display("p=84925,650,x");
            address = 679;
        gates:
    }
    Switch_10_4_i0 : EthSwitch
    {
        parameters:
            @display("p=84487,450,x");
            switch_id = "Switch_10_4_i0";
            depth = 2;
            sub_tree_id = 672;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_10_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=85050,650,x");
            address = 680;
        gates:
    }
    Server_10_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=85175,650,x");
            address = 681;
        gates:
    }
    Server_10_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=85300,650,x");
            address = 682;
        gates:
    }
    Server_10_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=85425,650,x");
            address = 683;
        gates:
    }
    Server_10_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=85550,650,x");
            address = 684;
        gates:
    }
    Server_10_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=85675,650,x");
            address = 685;
        gates:
    }
    Server_10_5_6 : <ServerType> like Server
    {
        parameters:
            @display("p=85800,650,x");
            address = 686;
        gates:
    }
    Server_10_5_7 : <ServerType> like Server
    {
        parameters:
            @display("p=85925,650,x");
            address = 687;
        gates:
    }
    Switch_10_5_i0 : EthSwitch
    {
        parameters:
            @display("p=85487,450,x");
            switch_id = "Switch_10_5_i0";
            depth = 2;
            sub_tree_id = 680;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_10_6_0 : <ServerType> like Server
    {
        parameters:
            @display("p=86050,650,x");
            address = 688;
        gates:
    }
    Server_10_6_1 : <ServerType> like Server
    {
        parameters:
            @display("p=86175,650,x");
            address = 689;
        gates:
    }
    Server_10_6_2 : <ServerType> like Server
    {
        parameters:
            @display("p=86300,650,x");
            address = 690;
        gates:
    }
    Server_10_6_3 : <ServerType> like Server
    {
        parameters:
            @display("p=86425,650,x");
            address = 691;
        gates:
    }
    Server_10_6_4 : <ServerType> like Server
    {
        parameters:
            @display("p=86550,650,x");
            address = 692;
        gates:
    }
    Server_10_6_5 : <ServerType> like Server
    {
        parameters:
            @display("p=86675,650,x");
            address = 693;
        gates:
    }
    Server_10_6_6 : <ServerType> like Server
    {
        parameters:
            @display("p=86800,650,x");
            address = 694;
        gates:
    }
    Server_10_6_7 : <ServerType> like Server
    {
        parameters:
            @display("p=86925,650,x");
            address = 695;
        gates:
    }
    Switch_10_6_i0 : EthSwitch
    {
        parameters:
            @display("p=86487,450,x");
            switch_id = "Switch_10_6_i0";
            depth = 2;
            sub_tree_id = 688;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_10_7_0 : <ServerType> like Server
    {
        parameters:
            @display("p=87050,650,x");
            address = 696;
        gates:
    }
    Server_10_7_1 : <ServerType> like Server
    {
        parameters:
            @display("p=87175,650,x");
            address = 697;
        gates:
    }
    Server_10_7_2 : <ServerType> like Server
    {
        parameters:
            @display("p=87300,650,x");
            address = 698;
        gates:
    }
    Server_10_7_3 : <ServerType> like Server
    {
        parameters:
            @display("p=87425,650,x");
            address = 699;
        gates:
    }
    Server_10_7_4 : <ServerType> like Server
    {
        parameters:
            @display("p=87550,650,x");
            address = 700;
        gates:
    }
    Server_10_7_5 : <ServerType> like Server
    {
        parameters:
            @display("p=87675,650,x");
            address = 701;
        gates:
    }
    Server_10_7_6 : <ServerType> like Server
    {
        parameters:
            @display("p=87800,650,x");
            address = 702;
        gates:
    }
    Server_10_7_7 : <ServerType> like Server
    {
        parameters:
            @display("p=87925,650,x");
            address = 703;
        gates:
    }
    Switch_10_7_i0 : EthSwitch
    {
        parameters:
            @display("p=87487,450,x");
            switch_id = "Switch_10_7_i0";
            depth = 2;
            sub_tree_id = 696;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_10_i0 : EthSwitch
    {
        parameters:
            @display("p=80925,250,x");
            switch_id = "Switch_10_i0";
            depth = 1;
            sub_tree_id = 640;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_10_i1 : EthSwitch
    {
        parameters:
            @display("p=81800,250,x");
            switch_id = "Switch_10_i1";
            depth = 1;
            sub_tree_id = 640;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_10_i2 : EthSwitch
    {
        parameters:
            @display("p=82675,250,x");
            switch_id = "Switch_10_i2";
            depth = 1;
            sub_tree_id = 640;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_10_i3 : EthSwitch
    {
        parameters:
            @display("p=83550,250,x");
            switch_id = "Switch_10_i3";
            depth = 1;
            sub_tree_id = 640;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_10_i4 : EthSwitch
    {
        parameters:
            @display("p=84425,250,x");
            switch_id = "Switch_10_i4";
            depth = 1;
            sub_tree_id = 640;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_10_i5 : EthSwitch
    {
        parameters:
            @display("p=85300,250,x");
            switch_id = "Switch_10_i5";
            depth = 1;
            sub_tree_id = 640;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_10_i6 : EthSwitch
    {
        parameters:
            @display("p=86175,250,x");
            switch_id = "Switch_10_i6";
            depth = 1;
            sub_tree_id = 640;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_10_i7 : EthSwitch
    {
        parameters:
            @display("p=87050,250,x");
            switch_id = "Switch_10_i7";
            depth = 1;
            sub_tree_id = 640;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_11_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=88050,650,x");
            address = 704;
        gates:
    }
    Server_11_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=88175,650,x");
            address = 705;
        gates:
    }
    Server_11_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=88300,650,x");
            address = 706;
        gates:
    }
    Server_11_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=88425,650,x");
            address = 707;
        gates:
    }
    Server_11_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=88550,650,x");
            address = 708;
        gates:
    }
    Server_11_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=88675,650,x");
            address = 709;
        gates:
    }
    Server_11_0_6 : <ServerType> like Server
    {
        parameters:
            @display("p=88800,650,x");
            address = 710;
        gates:
    }
    Server_11_0_7 : <ServerType> like Server
    {
        parameters:
            @display("p=88925,650,x");
            address = 711;
        gates:
    }
    Switch_11_0_i0 : EthSwitch
    {
        parameters:
            @display("p=88487,450,x");
            switch_id = "Switch_11_0_i0";
            depth = 2;
            sub_tree_id = 704;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_11_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=89050,650,x");
            address = 712;
        gates:
    }
    Server_11_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=89175,650,x");
            address = 713;
        gates:
    }
    Server_11_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=89300,650,x");
            address = 714;
        gates:
    }
    Server_11_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=89425,650,x");
            address = 715;
        gates:
    }
    Server_11_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=89550,650,x");
            address = 716;
        gates:
    }
    Server_11_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=89675,650,x");
            address = 717;
        gates:
    }
    Server_11_1_6 : <ServerType> like Server
    {
        parameters:
            @display("p=89800,650,x");
            address = 718;
        gates:
    }
    Server_11_1_7 : <ServerType> like Server
    {
        parameters:
            @display("p=89925,650,x");
            address = 719;
        gates:
    }
    Switch_11_1_i0 : EthSwitch
    {
        parameters:
            @display("p=89487,450,x");
            switch_id = "Switch_11_1_i0";
            depth = 2;
            sub_tree_id = 712;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_11_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=90050,650,x");
            address = 720;
        gates:
    }
    Server_11_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=90175,650,x");
            address = 721;
        gates:
    }
    Server_11_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=90300,650,x");
            address = 722;
        gates:
    }
    Server_11_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=90425,650,x");
            address = 723;
        gates:
    }
    Server_11_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=90550,650,x");
            address = 724;
        gates:
    }
    Server_11_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=90675,650,x");
            address = 725;
        gates:
    }
    Server_11_2_6 : <ServerType> like Server
    {
        parameters:
            @display("p=90800,650,x");
            address = 726;
        gates:
    }
    Server_11_2_7 : <ServerType> like Server
    {
        parameters:
            @display("p=90925,650,x");
            address = 727;
        gates:
    }
    Switch_11_2_i0 : EthSwitch
    {
        parameters:
            @display("p=90487,450,x");
            switch_id = "Switch_11_2_i0";
            depth = 2;
            sub_tree_id = 720;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_11_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=91050,650,x");
            address = 728;
        gates:
    }
    Server_11_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=91175,650,x");
            address = 729;
        gates:
    }
    Server_11_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=91300,650,x");
            address = 730;
        gates:
    }
    Server_11_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=91425,650,x");
            address = 731;
        gates:
    }
    Server_11_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=91550,650,x");
            address = 732;
        gates:
    }
    Server_11_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=91675,650,x");
            address = 733;
        gates:
    }
    Server_11_3_6 : <ServerType> like Server
    {
        parameters:
            @display("p=91800,650,x");
            address = 734;
        gates:
    }
    Server_11_3_7 : <ServerType> like Server
    {
        parameters:
            @display("p=91925,650,x");
            address = 735;
        gates:
    }
    Switch_11_3_i0 : EthSwitch
    {
        parameters:
            @display("p=91487,450,x");
            switch_id = "Switch_11_3_i0";
            depth = 2;
            sub_tree_id = 728;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_11_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=92050,650,x");
            address = 736;
        gates:
    }
    Server_11_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=92175,650,x");
            address = 737;
        gates:
    }
    Server_11_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=92300,650,x");
            address = 738;
        gates:
    }
    Server_11_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=92425,650,x");
            address = 739;
        gates:
    }
    Server_11_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=92550,650,x");
            address = 740;
        gates:
    }
    Server_11_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=92675,650,x");
            address = 741;
        gates:
    }
    Server_11_4_6 : <ServerType> like Server
    {
        parameters:
            @display("p=92800,650,x");
            address = 742;
        gates:
    }
    Server_11_4_7 : <ServerType> like Server
    {
        parameters:
            @display("p=92925,650,x");
            address = 743;
        gates:
    }
    Switch_11_4_i0 : EthSwitch
    {
        parameters:
            @display("p=92487,450,x");
            switch_id = "Switch_11_4_i0";
            depth = 2;
            sub_tree_id = 736;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_11_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=93050,650,x");
            address = 744;
        gates:
    }
    Server_11_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=93175,650,x");
            address = 745;
        gates:
    }
    Server_11_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=93300,650,x");
            address = 746;
        gates:
    }
    Server_11_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=93425,650,x");
            address = 747;
        gates:
    }
    Server_11_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=93550,650,x");
            address = 748;
        gates:
    }
    Server_11_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=93675,650,x");
            address = 749;
        gates:
    }
    Server_11_5_6 : <ServerType> like Server
    {
        parameters:
            @display("p=93800,650,x");
            address = 750;
        gates:
    }
    Server_11_5_7 : <ServerType> like Server
    {
        parameters:
            @display("p=93925,650,x");
            address = 751;
        gates:
    }
    Switch_11_5_i0 : EthSwitch
    {
        parameters:
            @display("p=93487,450,x");
            switch_id = "Switch_11_5_i0";
            depth = 2;
            sub_tree_id = 744;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_11_6_0 : <ServerType> like Server
    {
        parameters:
            @display("p=94050,650,x");
            address = 752;
        gates:
    }
    Server_11_6_1 : <ServerType> like Server
    {
        parameters:
            @display("p=94175,650,x");
            address = 753;
        gates:
    }
    Server_11_6_2 : <ServerType> like Server
    {
        parameters:
            @display("p=94300,650,x");
            address = 754;
        gates:
    }
    Server_11_6_3 : <ServerType> like Server
    {
        parameters:
            @display("p=94425,650,x");
            address = 755;
        gates:
    }
    Server_11_6_4 : <ServerType> like Server
    {
        parameters:
            @display("p=94550,650,x");
            address = 756;
        gates:
    }
    Server_11_6_5 : <ServerType> like Server
    {
        parameters:
            @display("p=94675,650,x");
            address = 757;
        gates:
    }
    Server_11_6_6 : <ServerType> like Server
    {
        parameters:
            @display("p=94800,650,x");
            address = 758;
        gates:
    }
    Server_11_6_7 : <ServerType> like Server
    {
        parameters:
            @display("p=94925,650,x");
            address = 759;
        gates:
    }
    Switch_11_6_i0 : EthSwitch
    {
        parameters:
            @display("p=94487,450,x");
            switch_id = "Switch_11_6_i0";
            depth = 2;
            sub_tree_id = 752;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_11_7_0 : <ServerType> like Server
    {
        parameters:
            @display("p=95050,650,x");
            address = 760;
        gates:
    }
    Server_11_7_1 : <ServerType> like Server
    {
        parameters:
            @display("p=95175,650,x");
            address = 761;
        gates:
    }
    Server_11_7_2 : <ServerType> like Server
    {
        parameters:
            @display("p=95300,650,x");
            address = 762;
        gates:
    }
    Server_11_7_3 : <ServerType> like Server
    {
        parameters:
            @display("p=95425,650,x");
            address = 763;
        gates:
    }
    Server_11_7_4 : <ServerType> like Server
    {
        parameters:
            @display("p=95550,650,x");
            address = 764;
        gates:
    }
    Server_11_7_5 : <ServerType> like Server
    {
        parameters:
            @display("p=95675,650,x");
            address = 765;
        gates:
    }
    Server_11_7_6 : <ServerType> like Server
    {
        parameters:
            @display("p=95800,650,x");
            address = 766;
        gates:
    }
    Server_11_7_7 : <ServerType> like Server
    {
        parameters:
            @display("p=95925,650,x");
            address = 767;
        gates:
    }
    Switch_11_7_i0 : EthSwitch
    {
        parameters:
            @display("p=95487,450,x");
            switch_id = "Switch_11_7_i0";
            depth = 2;
            sub_tree_id = 760;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_11_i0 : EthSwitch
    {
        parameters:
            @display("p=88925,250,x");
            switch_id = "Switch_11_i0";
            depth = 1;
            sub_tree_id = 704;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_11_i1 : EthSwitch
    {
        parameters:
            @display("p=89800,250,x");
            switch_id = "Switch_11_i1";
            depth = 1;
            sub_tree_id = 704;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_11_i2 : EthSwitch
    {
        parameters:
            @display("p=90675,250,x");
            switch_id = "Switch_11_i2";
            depth = 1;
            sub_tree_id = 704;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_11_i3 : EthSwitch
    {
        parameters:
            @display("p=91550,250,x");
            switch_id = "Switch_11_i3";
            depth = 1;
            sub_tree_id = 704;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_11_i4 : EthSwitch
    {
        parameters:
            @display("p=92425,250,x");
            switch_id = "Switch_11_i4";
            depth = 1;
            sub_tree_id = 704;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_11_i5 : EthSwitch
    {
        parameters:
            @display("p=93300,250,x");
            switch_id = "Switch_11_i5";
            depth = 1;
            sub_tree_id = 704;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_11_i6 : EthSwitch
    {
        parameters:
            @display("p=94175,250,x");
            switch_id = "Switch_11_i6";
            depth = 1;
            sub_tree_id = 704;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_11_i7 : EthSwitch
    {
        parameters:
            @display("p=95050,250,x");
            switch_id = "Switch_11_i7";
            depth = 1;
            sub_tree_id = 704;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_12_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=96050,650,x");
            address = 768;
        gates:
    }
    Server_12_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=96175,650,x");
            address = 769;
        gates:
    }
    Server_12_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=96300,650,x");
            address = 770;
        gates:
    }
    Server_12_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=96425,650,x");
            address = 771;
        gates:
    }
    Server_12_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=96550,650,x");
            address = 772;
        gates:
    }
    Server_12_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=96675,650,x");
            address = 773;
        gates:
    }
    Server_12_0_6 : <ServerType> like Server
    {
        parameters:
            @display("p=96800,650,x");
            address = 774;
        gates:
    }
    Server_12_0_7 : <ServerType> like Server
    {
        parameters:
            @display("p=96925,650,x");
            address = 775;
        gates:
    }
    Switch_12_0_i0 : EthSwitch
    {
        parameters:
            @display("p=96487,450,x");
            switch_id = "Switch_12_0_i0";
            depth = 2;
            sub_tree_id = 768;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_12_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=97050,650,x");
            address = 776;
        gates:
    }
    Server_12_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=97175,650,x");
            address = 777;
        gates:
    }
    Server_12_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=97300,650,x");
            address = 778;
        gates:
    }
    Server_12_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=97425,650,x");
            address = 779;
        gates:
    }
    Server_12_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=97550,650,x");
            address = 780;
        gates:
    }
    Server_12_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=97675,650,x");
            address = 781;
        gates:
    }
    Server_12_1_6 : <ServerType> like Server
    {
        parameters:
            @display("p=97800,650,x");
            address = 782;
        gates:
    }
    Server_12_1_7 : <ServerType> like Server
    {
        parameters:
            @display("p=97925,650,x");
            address = 783;
        gates:
    }
    Switch_12_1_i0 : EthSwitch
    {
        parameters:
            @display("p=97487,450,x");
            switch_id = "Switch_12_1_i0";
            depth = 2;
            sub_tree_id = 776;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_12_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=98050,650,x");
            address = 784;
        gates:
    }
    Server_12_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=98175,650,x");
            address = 785;
        gates:
    }
    Server_12_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=98300,650,x");
            address = 786;
        gates:
    }
    Server_12_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=98425,650,x");
            address = 787;
        gates:
    }
    Server_12_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=98550,650,x");
            address = 788;
        gates:
    }
    Server_12_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=98675,650,x");
            address = 789;
        gates:
    }
    Server_12_2_6 : <ServerType> like Server
    {
        parameters:
            @display("p=98800,650,x");
            address = 790;
        gates:
    }
    Server_12_2_7 : <ServerType> like Server
    {
        parameters:
            @display("p=98925,650,x");
            address = 791;
        gates:
    }
    Switch_12_2_i0 : EthSwitch
    {
        parameters:
            @display("p=98487,450,x");
            switch_id = "Switch_12_2_i0";
            depth = 2;
            sub_tree_id = 784;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_12_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=99050,650,x");
            address = 792;
        gates:
    }
    Server_12_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=99175,650,x");
            address = 793;
        gates:
    }
    Server_12_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=99300,650,x");
            address = 794;
        gates:
    }
    Server_12_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=99425,650,x");
            address = 795;
        gates:
    }
    Server_12_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=99550,650,x");
            address = 796;
        gates:
    }
    Server_12_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=99675,650,x");
            address = 797;
        gates:
    }
    Server_12_3_6 : <ServerType> like Server
    {
        parameters:
            @display("p=99800,650,x");
            address = 798;
        gates:
    }
    Server_12_3_7 : <ServerType> like Server
    {
        parameters:
            @display("p=99925,650,x");
            address = 799;
        gates:
    }
    Switch_12_3_i0 : EthSwitch
    {
        parameters:
            @display("p=99487,450,x");
            switch_id = "Switch_12_3_i0";
            depth = 2;
            sub_tree_id = 792;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_12_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=100050,650,x");
            address = 800;
        gates:
    }
    Server_12_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=100175,650,x");
            address = 801;
        gates:
    }
    Server_12_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=100300,650,x");
            address = 802;
        gates:
    }
    Server_12_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=100425,650,x");
            address = 803;
        gates:
    }
    Server_12_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=100550,650,x");
            address = 804;
        gates:
    }
    Server_12_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=100675,650,x");
            address = 805;
        gates:
    }
    Server_12_4_6 : <ServerType> like Server
    {
        parameters:
            @display("p=100800,650,x");
            address = 806;
        gates:
    }
    Server_12_4_7 : <ServerType> like Server
    {
        parameters:
            @display("p=100925,650,x");
            address = 807;
        gates:
    }
    Switch_12_4_i0 : EthSwitch
    {
        parameters:
            @display("p=100487,450,x");
            switch_id = "Switch_12_4_i0";
            depth = 2;
            sub_tree_id = 800;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_12_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=101050,650,x");
            address = 808;
        gates:
    }
    Server_12_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=101175,650,x");
            address = 809;
        gates:
    }
    Server_12_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=101300,650,x");
            address = 810;
        gates:
    }
    Server_12_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=101425,650,x");
            address = 811;
        gates:
    }
    Server_12_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=101550,650,x");
            address = 812;
        gates:
    }
    Server_12_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=101675,650,x");
            address = 813;
        gates:
    }
    Server_12_5_6 : <ServerType> like Server
    {
        parameters:
            @display("p=101800,650,x");
            address = 814;
        gates:
    }
    Server_12_5_7 : <ServerType> like Server
    {
        parameters:
            @display("p=101925,650,x");
            address = 815;
        gates:
    }
    Switch_12_5_i0 : EthSwitch
    {
        parameters:
            @display("p=101487,450,x");
            switch_id = "Switch_12_5_i0";
            depth = 2;
            sub_tree_id = 808;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_12_6_0 : <ServerType> like Server
    {
        parameters:
            @display("p=102050,650,x");
            address = 816;
        gates:
    }
    Server_12_6_1 : <ServerType> like Server
    {
        parameters:
            @display("p=102175,650,x");
            address = 817;
        gates:
    }
    Server_12_6_2 : <ServerType> like Server
    {
        parameters:
            @display("p=102300,650,x");
            address = 818;
        gates:
    }
    Server_12_6_3 : <ServerType> like Server
    {
        parameters:
            @display("p=102425,650,x");
            address = 819;
        gates:
    }
    Server_12_6_4 : <ServerType> like Server
    {
        parameters:
            @display("p=102550,650,x");
            address = 820;
        gates:
    }
    Server_12_6_5 : <ServerType> like Server
    {
        parameters:
            @display("p=102675,650,x");
            address = 821;
        gates:
    }
    Server_12_6_6 : <ServerType> like Server
    {
        parameters:
            @display("p=102800,650,x");
            address = 822;
        gates:
    }
    Server_12_6_7 : <ServerType> like Server
    {
        parameters:
            @display("p=102925,650,x");
            address = 823;
        gates:
    }
    Switch_12_6_i0 : EthSwitch
    {
        parameters:
            @display("p=102487,450,x");
            switch_id = "Switch_12_6_i0";
            depth = 2;
            sub_tree_id = 816;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_12_7_0 : <ServerType> like Server
    {
        parameters:
            @display("p=103050,650,x");
            address = 824;
        gates:
    }
    Server_12_7_1 : <ServerType> like Server
    {
        parameters:
            @display("p=103175,650,x");
            address = 825;
        gates:
    }
    Server_12_7_2 : <ServerType> like Server
    {
        parameters:
            @display("p=103300,650,x");
            address = 826;
        gates:
    }
    Server_12_7_3 : <ServerType> like Server
    {
        parameters:
            @display("p=103425,650,x");
            address = 827;
        gates:
    }
    Server_12_7_4 : <ServerType> like Server
    {
        parameters:
            @display("p=103550,650,x");
            address = 828;
        gates:
    }
    Server_12_7_5 : <ServerType> like Server
    {
        parameters:
            @display("p=103675,650,x");
            address = 829;
        gates:
    }
    Server_12_7_6 : <ServerType> like Server
    {
        parameters:
            @display("p=103800,650,x");
            address = 830;
        gates:
    }
    Server_12_7_7 : <ServerType> like Server
    {
        parameters:
            @display("p=103925,650,x");
            address = 831;
        gates:
    }
    Switch_12_7_i0 : EthSwitch
    {
        parameters:
            @display("p=103487,450,x");
            switch_id = "Switch_12_7_i0";
            depth = 2;
            sub_tree_id = 824;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_12_i0 : EthSwitch
    {
        parameters:
            @display("p=96925,250,x");
            switch_id = "Switch_12_i0";
            depth = 1;
            sub_tree_id = 768;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_12_i1 : EthSwitch
    {
        parameters:
            @display("p=97800,250,x");
            switch_id = "Switch_12_i1";
            depth = 1;
            sub_tree_id = 768;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_12_i2 : EthSwitch
    {
        parameters:
            @display("p=98675,250,x");
            switch_id = "Switch_12_i2";
            depth = 1;
            sub_tree_id = 768;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_12_i3 : EthSwitch
    {
        parameters:
            @display("p=99550,250,x");
            switch_id = "Switch_12_i3";
            depth = 1;
            sub_tree_id = 768;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_12_i4 : EthSwitch
    {
        parameters:
            @display("p=100425,250,x");
            switch_id = "Switch_12_i4";
            depth = 1;
            sub_tree_id = 768;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_12_i5 : EthSwitch
    {
        parameters:
            @display("p=101300,250,x");
            switch_id = "Switch_12_i5";
            depth = 1;
            sub_tree_id = 768;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_12_i6 : EthSwitch
    {
        parameters:
            @display("p=102175,250,x");
            switch_id = "Switch_12_i6";
            depth = 1;
            sub_tree_id = 768;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_12_i7 : EthSwitch
    {
        parameters:
            @display("p=103050,250,x");
            switch_id = "Switch_12_i7";
            depth = 1;
            sub_tree_id = 768;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_13_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=104050,650,x");
            address = 832;
        gates:
    }
    Server_13_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=104175,650,x");
            address = 833;
        gates:
    }
    Server_13_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=104300,650,x");
            address = 834;
        gates:
    }
    Server_13_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=104425,650,x");
            address = 835;
        gates:
    }
    Server_13_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=104550,650,x");
            address = 836;
        gates:
    }
    Server_13_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=104675,650,x");
            address = 837;
        gates:
    }
    Server_13_0_6 : <ServerType> like Server
    {
        parameters:
            @display("p=104800,650,x");
            address = 838;
        gates:
    }
    Server_13_0_7 : <ServerType> like Server
    {
        parameters:
            @display("p=104925,650,x");
            address = 839;
        gates:
    }
    Switch_13_0_i0 : EthSwitch
    {
        parameters:
            @display("p=104487,450,x");
            switch_id = "Switch_13_0_i0";
            depth = 2;
            sub_tree_id = 832;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_13_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=105050,650,x");
            address = 840;
        gates:
    }
    Server_13_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=105175,650,x");
            address = 841;
        gates:
    }
    Server_13_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=105300,650,x");
            address = 842;
        gates:
    }
    Server_13_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=105425,650,x");
            address = 843;
        gates:
    }
    Server_13_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=105550,650,x");
            address = 844;
        gates:
    }
    Server_13_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=105675,650,x");
            address = 845;
        gates:
    }
    Server_13_1_6 : <ServerType> like Server
    {
        parameters:
            @display("p=105800,650,x");
            address = 846;
        gates:
    }
    Server_13_1_7 : <ServerType> like Server
    {
        parameters:
            @display("p=105925,650,x");
            address = 847;
        gates:
    }
    Switch_13_1_i0 : EthSwitch
    {
        parameters:
            @display("p=105487,450,x");
            switch_id = "Switch_13_1_i0";
            depth = 2;
            sub_tree_id = 840;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_13_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=106050,650,x");
            address = 848;
        gates:
    }
    Server_13_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=106175,650,x");
            address = 849;
        gates:
    }
    Server_13_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=106300,650,x");
            address = 850;
        gates:
    }
    Server_13_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=106425,650,x");
            address = 851;
        gates:
    }
    Server_13_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=106550,650,x");
            address = 852;
        gates:
    }
    Server_13_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=106675,650,x");
            address = 853;
        gates:
    }
    Server_13_2_6 : <ServerType> like Server
    {
        parameters:
            @display("p=106800,650,x");
            address = 854;
        gates:
    }
    Server_13_2_7 : <ServerType> like Server
    {
        parameters:
            @display("p=106925,650,x");
            address = 855;
        gates:
    }
    Switch_13_2_i0 : EthSwitch
    {
        parameters:
            @display("p=106487,450,x");
            switch_id = "Switch_13_2_i0";
            depth = 2;
            sub_tree_id = 848;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_13_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=107050,650,x");
            address = 856;
        gates:
    }
    Server_13_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=107175,650,x");
            address = 857;
        gates:
    }
    Server_13_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=107300,650,x");
            address = 858;
        gates:
    }
    Server_13_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=107425,650,x");
            address = 859;
        gates:
    }
    Server_13_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=107550,650,x");
            address = 860;
        gates:
    }
    Server_13_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=107675,650,x");
            address = 861;
        gates:
    }
    Server_13_3_6 : <ServerType> like Server
    {
        parameters:
            @display("p=107800,650,x");
            address = 862;
        gates:
    }
    Server_13_3_7 : <ServerType> like Server
    {
        parameters:
            @display("p=107925,650,x");
            address = 863;
        gates:
    }
    Switch_13_3_i0 : EthSwitch
    {
        parameters:
            @display("p=107487,450,x");
            switch_id = "Switch_13_3_i0";
            depth = 2;
            sub_tree_id = 856;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_13_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=108050,650,x");
            address = 864;
        gates:
    }
    Server_13_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=108175,650,x");
            address = 865;
        gates:
    }
    Server_13_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=108300,650,x");
            address = 866;
        gates:
    }
    Server_13_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=108425,650,x");
            address = 867;
        gates:
    }
    Server_13_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=108550,650,x");
            address = 868;
        gates:
    }
    Server_13_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=108675,650,x");
            address = 869;
        gates:
    }
    Server_13_4_6 : <ServerType> like Server
    {
        parameters:
            @display("p=108800,650,x");
            address = 870;
        gates:
    }
    Server_13_4_7 : <ServerType> like Server
    {
        parameters:
            @display("p=108925,650,x");
            address = 871;
        gates:
    }
    Switch_13_4_i0 : EthSwitch
    {
        parameters:
            @display("p=108487,450,x");
            switch_id = "Switch_13_4_i0";
            depth = 2;
            sub_tree_id = 864;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_13_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=109050,650,x");
            address = 872;
        gates:
    }
    Server_13_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=109175,650,x");
            address = 873;
        gates:
    }
    Server_13_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=109300,650,x");
            address = 874;
        gates:
    }
    Server_13_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=109425,650,x");
            address = 875;
        gates:
    }
    Server_13_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=109550,650,x");
            address = 876;
        gates:
    }
    Server_13_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=109675,650,x");
            address = 877;
        gates:
    }
    Server_13_5_6 : <ServerType> like Server
    {
        parameters:
            @display("p=109800,650,x");
            address = 878;
        gates:
    }
    Server_13_5_7 : <ServerType> like Server
    {
        parameters:
            @display("p=109925,650,x");
            address = 879;
        gates:
    }
    Switch_13_5_i0 : EthSwitch
    {
        parameters:
            @display("p=109487,450,x");
            switch_id = "Switch_13_5_i0";
            depth = 2;
            sub_tree_id = 872;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_13_6_0 : <ServerType> like Server
    {
        parameters:
            @display("p=110050,650,x");
            address = 880;
        gates:
    }
    Server_13_6_1 : <ServerType> like Server
    {
        parameters:
            @display("p=110175,650,x");
            address = 881;
        gates:
    }
    Server_13_6_2 : <ServerType> like Server
    {
        parameters:
            @display("p=110300,650,x");
            address = 882;
        gates:
    }
    Server_13_6_3 : <ServerType> like Server
    {
        parameters:
            @display("p=110425,650,x");
            address = 883;
        gates:
    }
    Server_13_6_4 : <ServerType> like Server
    {
        parameters:
            @display("p=110550,650,x");
            address = 884;
        gates:
    }
    Server_13_6_5 : <ServerType> like Server
    {
        parameters:
            @display("p=110675,650,x");
            address = 885;
        gates:
    }
    Server_13_6_6 : <ServerType> like Server
    {
        parameters:
            @display("p=110800,650,x");
            address = 886;
        gates:
    }
    Server_13_6_7 : <ServerType> like Server
    {
        parameters:
            @display("p=110925,650,x");
            address = 887;
        gates:
    }
    Switch_13_6_i0 : EthSwitch
    {
        parameters:
            @display("p=110487,450,x");
            switch_id = "Switch_13_6_i0";
            depth = 2;
            sub_tree_id = 880;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_13_7_0 : <ServerType> like Server
    {
        parameters:
            @display("p=111050,650,x");
            address = 888;
        gates:
    }
    Server_13_7_1 : <ServerType> like Server
    {
        parameters:
            @display("p=111175,650,x");
            address = 889;
        gates:
    }
    Server_13_7_2 : <ServerType> like Server
    {
        parameters:
            @display("p=111300,650,x");
            address = 890;
        gates:
    }
    Server_13_7_3 : <ServerType> like Server
    {
        parameters:
            @display("p=111425,650,x");
            address = 891;
        gates:
    }
    Server_13_7_4 : <ServerType> like Server
    {
        parameters:
            @display("p=111550,650,x");
            address = 892;
        gates:
    }
    Server_13_7_5 : <ServerType> like Server
    {
        parameters:
            @display("p=111675,650,x");
            address = 893;
        gates:
    }
    Server_13_7_6 : <ServerType> like Server
    {
        parameters:
            @display("p=111800,650,x");
            address = 894;
        gates:
    }
    Server_13_7_7 : <ServerType> like Server
    {
        parameters:
            @display("p=111925,650,x");
            address = 895;
        gates:
    }
    Switch_13_7_i0 : EthSwitch
    {
        parameters:
            @display("p=111487,450,x");
            switch_id = "Switch_13_7_i0";
            depth = 2;
            sub_tree_id = 888;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_13_i0 : EthSwitch
    {
        parameters:
            @display("p=104925,250,x");
            switch_id = "Switch_13_i0";
            depth = 1;
            sub_tree_id = 832;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_13_i1 : EthSwitch
    {
        parameters:
            @display("p=105800,250,x");
            switch_id = "Switch_13_i1";
            depth = 1;
            sub_tree_id = 832;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_13_i2 : EthSwitch
    {
        parameters:
            @display("p=106675,250,x");
            switch_id = "Switch_13_i2";
            depth = 1;
            sub_tree_id = 832;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_13_i3 : EthSwitch
    {
        parameters:
            @display("p=107550,250,x");
            switch_id = "Switch_13_i3";
            depth = 1;
            sub_tree_id = 832;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_13_i4 : EthSwitch
    {
        parameters:
            @display("p=108425,250,x");
            switch_id = "Switch_13_i4";
            depth = 1;
            sub_tree_id = 832;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_13_i5 : EthSwitch
    {
        parameters:
            @display("p=109300,250,x");
            switch_id = "Switch_13_i5";
            depth = 1;
            sub_tree_id = 832;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_13_i6 : EthSwitch
    {
        parameters:
            @display("p=110175,250,x");
            switch_id = "Switch_13_i6";
            depth = 1;
            sub_tree_id = 832;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_13_i7 : EthSwitch
    {
        parameters:
            @display("p=111050,250,x");
            switch_id = "Switch_13_i7";
            depth = 1;
            sub_tree_id = 832;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_14_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=112050,650,x");
            address = 896;
        gates:
    }
    Server_14_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=112175,650,x");
            address = 897;
        gates:
    }
    Server_14_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=112300,650,x");
            address = 898;
        gates:
    }
    Server_14_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=112425,650,x");
            address = 899;
        gates:
    }
    Server_14_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=112550,650,x");
            address = 900;
        gates:
    }
    Server_14_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=112675,650,x");
            address = 901;
        gates:
    }
    Server_14_0_6 : <ServerType> like Server
    {
        parameters:
            @display("p=112800,650,x");
            address = 902;
        gates:
    }
    Server_14_0_7 : <ServerType> like Server
    {
        parameters:
            @display("p=112925,650,x");
            address = 903;
        gates:
    }
    Switch_14_0_i0 : EthSwitch
    {
        parameters:
            @display("p=112487,450,x");
            switch_id = "Switch_14_0_i0";
            depth = 2;
            sub_tree_id = 896;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_14_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=113050,650,x");
            address = 904;
        gates:
    }
    Server_14_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=113175,650,x");
            address = 905;
        gates:
    }
    Server_14_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=113300,650,x");
            address = 906;
        gates:
    }
    Server_14_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=113425,650,x");
            address = 907;
        gates:
    }
    Server_14_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=113550,650,x");
            address = 908;
        gates:
    }
    Server_14_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=113675,650,x");
            address = 909;
        gates:
    }
    Server_14_1_6 : <ServerType> like Server
    {
        parameters:
            @display("p=113800,650,x");
            address = 910;
        gates:
    }
    Server_14_1_7 : <ServerType> like Server
    {
        parameters:
            @display("p=113925,650,x");
            address = 911;
        gates:
    }
    Switch_14_1_i0 : EthSwitch
    {
        parameters:
            @display("p=113487,450,x");
            switch_id = "Switch_14_1_i0";
            depth = 2;
            sub_tree_id = 904;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_14_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=114050,650,x");
            address = 912;
        gates:
    }
    Server_14_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=114175,650,x");
            address = 913;
        gates:
    }
    Server_14_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=114300,650,x");
            address = 914;
        gates:
    }
    Server_14_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=114425,650,x");
            address = 915;
        gates:
    }
    Server_14_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=114550,650,x");
            address = 916;
        gates:
    }
    Server_14_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=114675,650,x");
            address = 917;
        gates:
    }
    Server_14_2_6 : <ServerType> like Server
    {
        parameters:
            @display("p=114800,650,x");
            address = 918;
        gates:
    }
    Server_14_2_7 : <ServerType> like Server
    {
        parameters:
            @display("p=114925,650,x");
            address = 919;
        gates:
    }
    Switch_14_2_i0 : EthSwitch
    {
        parameters:
            @display("p=114487,450,x");
            switch_id = "Switch_14_2_i0";
            depth = 2;
            sub_tree_id = 912;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_14_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=115050,650,x");
            address = 920;
        gates:
    }
    Server_14_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=115175,650,x");
            address = 921;
        gates:
    }
    Server_14_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=115300,650,x");
            address = 922;
        gates:
    }
    Server_14_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=115425,650,x");
            address = 923;
        gates:
    }
    Server_14_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=115550,650,x");
            address = 924;
        gates:
    }
    Server_14_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=115675,650,x");
            address = 925;
        gates:
    }
    Server_14_3_6 : <ServerType> like Server
    {
        parameters:
            @display("p=115800,650,x");
            address = 926;
        gates:
    }
    Server_14_3_7 : <ServerType> like Server
    {
        parameters:
            @display("p=115925,650,x");
            address = 927;
        gates:
    }
    Switch_14_3_i0 : EthSwitch
    {
        parameters:
            @display("p=115487,450,x");
            switch_id = "Switch_14_3_i0";
            depth = 2;
            sub_tree_id = 920;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_14_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=116050,650,x");
            address = 928;
        gates:
    }
    Server_14_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=116175,650,x");
            address = 929;
        gates:
    }
    Server_14_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=116300,650,x");
            address = 930;
        gates:
    }
    Server_14_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=116425,650,x");
            address = 931;
        gates:
    }
    Server_14_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=116550,650,x");
            address = 932;
        gates:
    }
    Server_14_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=116675,650,x");
            address = 933;
        gates:
    }
    Server_14_4_6 : <ServerType> like Server
    {
        parameters:
            @display("p=116800,650,x");
            address = 934;
        gates:
    }
    Server_14_4_7 : <ServerType> like Server
    {
        parameters:
            @display("p=116925,650,x");
            address = 935;
        gates:
    }
    Switch_14_4_i0 : EthSwitch
    {
        parameters:
            @display("p=116487,450,x");
            switch_id = "Switch_14_4_i0";
            depth = 2;
            sub_tree_id = 928;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_14_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=117050,650,x");
            address = 936;
        gates:
    }
    Server_14_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=117175,650,x");
            address = 937;
        gates:
    }
    Server_14_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=117300,650,x");
            address = 938;
        gates:
    }
    Server_14_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=117425,650,x");
            address = 939;
        gates:
    }
    Server_14_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=117550,650,x");
            address = 940;
        gates:
    }
    Server_14_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=117675,650,x");
            address = 941;
        gates:
    }
    Server_14_5_6 : <ServerType> like Server
    {
        parameters:
            @display("p=117800,650,x");
            address = 942;
        gates:
    }
    Server_14_5_7 : <ServerType> like Server
    {
        parameters:
            @display("p=117925,650,x");
            address = 943;
        gates:
    }
    Switch_14_5_i0 : EthSwitch
    {
        parameters:
            @display("p=117487,450,x");
            switch_id = "Switch_14_5_i0";
            depth = 2;
            sub_tree_id = 936;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_14_6_0 : <ServerType> like Server
    {
        parameters:
            @display("p=118050,650,x");
            address = 944;
        gates:
    }
    Server_14_6_1 : <ServerType> like Server
    {
        parameters:
            @display("p=118175,650,x");
            address = 945;
        gates:
    }
    Server_14_6_2 : <ServerType> like Server
    {
        parameters:
            @display("p=118300,650,x");
            address = 946;
        gates:
    }
    Server_14_6_3 : <ServerType> like Server
    {
        parameters:
            @display("p=118425,650,x");
            address = 947;
        gates:
    }
    Server_14_6_4 : <ServerType> like Server
    {
        parameters:
            @display("p=118550,650,x");
            address = 948;
        gates:
    }
    Server_14_6_5 : <ServerType> like Server
    {
        parameters:
            @display("p=118675,650,x");
            address = 949;
        gates:
    }
    Server_14_6_6 : <ServerType> like Server
    {
        parameters:
            @display("p=118800,650,x");
            address = 950;
        gates:
    }
    Server_14_6_7 : <ServerType> like Server
    {
        parameters:
            @display("p=118925,650,x");
            address = 951;
        gates:
    }
    Switch_14_6_i0 : EthSwitch
    {
        parameters:
            @display("p=118487,450,x");
            switch_id = "Switch_14_6_i0";
            depth = 2;
            sub_tree_id = 944;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_14_7_0 : <ServerType> like Server
    {
        parameters:
            @display("p=119050,650,x");
            address = 952;
        gates:
    }
    Server_14_7_1 : <ServerType> like Server
    {
        parameters:
            @display("p=119175,650,x");
            address = 953;
        gates:
    }
    Server_14_7_2 : <ServerType> like Server
    {
        parameters:
            @display("p=119300,650,x");
            address = 954;
        gates:
    }
    Server_14_7_3 : <ServerType> like Server
    {
        parameters:
            @display("p=119425,650,x");
            address = 955;
        gates:
    }
    Server_14_7_4 : <ServerType> like Server
    {
        parameters:
            @display("p=119550,650,x");
            address = 956;
        gates:
    }
    Server_14_7_5 : <ServerType> like Server
    {
        parameters:
            @display("p=119675,650,x");
            address = 957;
        gates:
    }
    Server_14_7_6 : <ServerType> like Server
    {
        parameters:
            @display("p=119800,650,x");
            address = 958;
        gates:
    }
    Server_14_7_7 : <ServerType> like Server
    {
        parameters:
            @display("p=119925,650,x");
            address = 959;
        gates:
    }
    Switch_14_7_i0 : EthSwitch
    {
        parameters:
            @display("p=119487,450,x");
            switch_id = "Switch_14_7_i0";
            depth = 2;
            sub_tree_id = 952;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_14_i0 : EthSwitch
    {
        parameters:
            @display("p=112925,250,x");
            switch_id = "Switch_14_i0";
            depth = 1;
            sub_tree_id = 896;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_14_i1 : EthSwitch
    {
        parameters:
            @display("p=113800,250,x");
            switch_id = "Switch_14_i1";
            depth = 1;
            sub_tree_id = 896;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_14_i2 : EthSwitch
    {
        parameters:
            @display("p=114675,250,x");
            switch_id = "Switch_14_i2";
            depth = 1;
            sub_tree_id = 896;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_14_i3 : EthSwitch
    {
        parameters:
            @display("p=115550,250,x");
            switch_id = "Switch_14_i3";
            depth = 1;
            sub_tree_id = 896;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_14_i4 : EthSwitch
    {
        parameters:
            @display("p=116425,250,x");
            switch_id = "Switch_14_i4";
            depth = 1;
            sub_tree_id = 896;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_14_i5 : EthSwitch
    {
        parameters:
            @display("p=117300,250,x");
            switch_id = "Switch_14_i5";
            depth = 1;
            sub_tree_id = 896;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_14_i6 : EthSwitch
    {
        parameters:
            @display("p=118175,250,x");
            switch_id = "Switch_14_i6";
            depth = 1;
            sub_tree_id = 896;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_14_i7 : EthSwitch
    {
        parameters:
            @display("p=119050,250,x");
            switch_id = "Switch_14_i7";
            depth = 1;
            sub_tree_id = 896;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_15_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=120050,650,x");
            address = 960;
        gates:
    }
    Server_15_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=120175,650,x");
            address = 961;
        gates:
    }
    Server_15_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=120300,650,x");
            address = 962;
        gates:
    }
    Server_15_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=120425,650,x");
            address = 963;
        gates:
    }
    Server_15_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=120550,650,x");
            address = 964;
        gates:
    }
    Server_15_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=120675,650,x");
            address = 965;
        gates:
    }
    Server_15_0_6 : <ServerType> like Server
    {
        parameters:
            @display("p=120800,650,x");
            address = 966;
        gates:
    }
    Server_15_0_7 : <ServerType> like Server
    {
        parameters:
            @display("p=120925,650,x");
            address = 967;
        gates:
    }
    Switch_15_0_i0 : EthSwitch
    {
        parameters:
            @display("p=120487,450,x");
            switch_id = "Switch_15_0_i0";
            depth = 2;
            sub_tree_id = 960;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_15_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=121050,650,x");
            address = 968;
        gates:
    }
    Server_15_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=121175,650,x");
            address = 969;
        gates:
    }
    Server_15_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=121300,650,x");
            address = 970;
        gates:
    }
    Server_15_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=121425,650,x");
            address = 971;
        gates:
    }
    Server_15_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=121550,650,x");
            address = 972;
        gates:
    }
    Server_15_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=121675,650,x");
            address = 973;
        gates:
    }
    Server_15_1_6 : <ServerType> like Server
    {
        parameters:
            @display("p=121800,650,x");
            address = 974;
        gates:
    }
    Server_15_1_7 : <ServerType> like Server
    {
        parameters:
            @display("p=121925,650,x");
            address = 975;
        gates:
    }
    Switch_15_1_i0 : EthSwitch
    {
        parameters:
            @display("p=121487,450,x");
            switch_id = "Switch_15_1_i0";
            depth = 2;
            sub_tree_id = 968;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_15_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=122050,650,x");
            address = 976;
        gates:
    }
    Server_15_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=122175,650,x");
            address = 977;
        gates:
    }
    Server_15_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=122300,650,x");
            address = 978;
        gates:
    }
    Server_15_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=122425,650,x");
            address = 979;
        gates:
    }
    Server_15_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=122550,650,x");
            address = 980;
        gates:
    }
    Server_15_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=122675,650,x");
            address = 981;
        gates:
    }
    Server_15_2_6 : <ServerType> like Server
    {
        parameters:
            @display("p=122800,650,x");
            address = 982;
        gates:
    }
    Server_15_2_7 : <ServerType> like Server
    {
        parameters:
            @display("p=122925,650,x");
            address = 983;
        gates:
    }
    Switch_15_2_i0 : EthSwitch
    {
        parameters:
            @display("p=122487,450,x");
            switch_id = "Switch_15_2_i0";
            depth = 2;
            sub_tree_id = 976;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_15_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=123050,650,x");
            address = 984;
        gates:
    }
    Server_15_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=123175,650,x");
            address = 985;
        gates:
    }
    Server_15_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=123300,650,x");
            address = 986;
        gates:
    }
    Server_15_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=123425,650,x");
            address = 987;
        gates:
    }
    Server_15_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=123550,650,x");
            address = 988;
        gates:
    }
    Server_15_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=123675,650,x");
            address = 989;
        gates:
    }
    Server_15_3_6 : <ServerType> like Server
    {
        parameters:
            @display("p=123800,650,x");
            address = 990;
        gates:
    }
    Server_15_3_7 : <ServerType> like Server
    {
        parameters:
            @display("p=123925,650,x");
            address = 991;
        gates:
    }
    Switch_15_3_i0 : EthSwitch
    {
        parameters:
            @display("p=123487,450,x");
            switch_id = "Switch_15_3_i0";
            depth = 2;
            sub_tree_id = 984;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_15_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=124050,650,x");
            address = 992;
        gates:
    }
    Server_15_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=124175,650,x");
            address = 993;
        gates:
    }
    Server_15_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=124300,650,x");
            address = 994;
        gates:
    }
    Server_15_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=124425,650,x");
            address = 995;
        gates:
    }
    Server_15_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=124550,650,x");
            address = 996;
        gates:
    }
    Server_15_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=124675,650,x");
            address = 997;
        gates:
    }
    Server_15_4_6 : <ServerType> like Server
    {
        parameters:
            @display("p=124800,650,x");
            address = 998;
        gates:
    }
    Server_15_4_7 : <ServerType> like Server
    {
        parameters:
            @display("p=124925,650,x");
            address = 999;
        gates:
    }
    Switch_15_4_i0 : EthSwitch
    {
        parameters:
            @display("p=124487,450,x");
            switch_id = "Switch_15_4_i0";
            depth = 2;
            sub_tree_id = 992;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_15_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=125050,650,x");
            address = 1000;
        gates:
    }
    Server_15_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=125175,650,x");
            address = 1001;
        gates:
    }
    Server_15_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=125300,650,x");
            address = 1002;
        gates:
    }
    Server_15_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=125425,650,x");
            address = 1003;
        gates:
    }
    Server_15_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=125550,650,x");
            address = 1004;
        gates:
    }
    Server_15_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=125675,650,x");
            address = 1005;
        gates:
    }
    Server_15_5_6 : <ServerType> like Server
    {
        parameters:
            @display("p=125800,650,x");
            address = 1006;
        gates:
    }
    Server_15_5_7 : <ServerType> like Server
    {
        parameters:
            @display("p=125925,650,x");
            address = 1007;
        gates:
    }
    Switch_15_5_i0 : EthSwitch
    {
        parameters:
            @display("p=125487,450,x");
            switch_id = "Switch_15_5_i0";
            depth = 2;
            sub_tree_id = 1000;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_15_6_0 : <ServerType> like Server
    {
        parameters:
            @display("p=126050,650,x");
            address = 1008;
        gates:
    }
    Server_15_6_1 : <ServerType> like Server
    {
        parameters:
            @display("p=126175,650,x");
            address = 1009;
        gates:
    }
    Server_15_6_2 : <ServerType> like Server
    {
        parameters:
            @display("p=126300,650,x");
            address = 1010;
        gates:
    }
    Server_15_6_3 : <ServerType> like Server
    {
        parameters:
            @display("p=126425,650,x");
            address = 1011;
        gates:
    }
    Server_15_6_4 : <ServerType> like Server
    {
        parameters:
            @display("p=126550,650,x");
            address = 1012;
        gates:
    }
    Server_15_6_5 : <ServerType> like Server
    {
        parameters:
            @display("p=126675,650,x");
            address = 1013;
        gates:
    }
    Server_15_6_6 : <ServerType> like Server
    {
        parameters:
            @display("p=126800,650,x");
            address = 1014;
        gates:
    }
    Server_15_6_7 : <ServerType> like Server
    {
        parameters:
            @display("p=126925,650,x");
            address = 1015;
        gates:
    }
    Switch_15_6_i0 : EthSwitch
    {
        parameters:
            @display("p=126487,450,x");
            switch_id = "Switch_15_6_i0";
            depth = 2;
            sub_tree_id = 1008;
        gates:
            down_port[8];
            up_port[8];
    }
    Server_15_7_0 : <ServerType> like Server
    {
        parameters:
            @display("p=127050,650,x");
            address = 1016;
        gates:
    }
    Server_15_7_1 : <ServerType> like Server
    {
        parameters:
            @display("p=127175,650,x");
            address = 1017;
        gates:
    }
    Server_15_7_2 : <ServerType> like Server
    {
        parameters:
            @display("p=127300,650,x");
            address = 1018;
        gates:
    }
    Server_15_7_3 : <ServerType> like Server
    {
        parameters:
            @display("p=127425,650,x");
            address = 1019;
        gates:
    }
    Server_15_7_4 : <ServerType> like Server
    {
        parameters:
            @display("p=127550,650,x");
            address = 1020;
        gates:
    }
    Server_15_7_5 : <ServerType> like Server
    {
        parameters:
            @display("p=127675,650,x");
            address = 1021;
        gates:
    }
    Server_15_7_6 : <ServerType> like Server
    {
        parameters:
            @display("p=127800,650,x");
            address = 1022;
        gates:
    }
    Server_15_7_7 : <ServerType> like Server
    {
        parameters:
            @display("p=127925,650,x");
            address = 1023;
        gates:
    }
    Switch_15_7_i0 : EthSwitch
    {
        parameters:
            @display("p=127487,450,x");
            switch_id = "Switch_15_7_i0";
            depth = 2;
            sub_tree_id = 1016;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_15_i0 : EthSwitch
    {
        parameters:
            @display("p=120925,250,x");
            switch_id = "Switch_15_i0";
            depth = 1;
            sub_tree_id = 960;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_15_i1 : EthSwitch
    {
        parameters:
            @display("p=121800,250,x");
            switch_id = "Switch_15_i1";
            depth = 1;
            sub_tree_id = 960;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_15_i2 : EthSwitch
    {
        parameters:
            @display("p=122675,250,x");
            switch_id = "Switch_15_i2";
            depth = 1;
            sub_tree_id = 960;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_15_i3 : EthSwitch
    {
        parameters:
            @display("p=123550,250,x");
            switch_id = "Switch_15_i3";
            depth = 1;
            sub_tree_id = 960;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_15_i4 : EthSwitch
    {
        parameters:
            @display("p=124425,250,x");
            switch_id = "Switch_15_i4";
            depth = 1;
            sub_tree_id = 960;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_15_i5 : EthSwitch
    {
        parameters:
            @display("p=125300,250,x");
            switch_id = "Switch_15_i5";
            depth = 1;
            sub_tree_id = 960;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_15_i6 : EthSwitch
    {
        parameters:
            @display("p=126175,250,x");
            switch_id = "Switch_15_i6";
            depth = 1;
            sub_tree_id = 960;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_15_i7 : EthSwitch
    {
        parameters:
            @display("p=127050,250,x");
            switch_id = "Switch_15_i7";
            depth = 1;
            sub_tree_id = 960;
        gates:
            down_port[8];
            up_port[8];
    }
    Switch_i0 : EthSwitch
    {
        parameters:
            @display("p=2017,50,x");
            switch_id = "Switch_i0";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i1 : EthSwitch
    {
        parameters:
            @display("p=3984,50,x");
            switch_id = "Switch_i1";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i2 : EthSwitch
    {
        parameters:
            @display("p=5951,50,x");
            switch_id = "Switch_i2";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i3 : EthSwitch
    {
        parameters:
            @display("p=7918,50,x");
            switch_id = "Switch_i3";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i4 : EthSwitch
    {
        parameters:
            @display("p=9885,50,x");
            switch_id = "Switch_i4";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i5 : EthSwitch
    {
        parameters:
            @display("p=11852,50,x");
            switch_id = "Switch_i5";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i6 : EthSwitch
    {
        parameters:
            @display("p=13819,50,x");
            switch_id = "Switch_i6";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i7 : EthSwitch
    {
        parameters:
            @display("p=15786,50,x");
            switch_id = "Switch_i7";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i8 : EthSwitch
    {
        parameters:
            @display("p=17753,50,x");
            switch_id = "Switch_i8";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i9 : EthSwitch
    {
        parameters:
            @display("p=19720,50,x");
            switch_id = "Switch_i9";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i10 : EthSwitch
    {
        parameters:
            @display("p=21687,50,x");
            switch_id = "Switch_i10";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i11 : EthSwitch
    {
        parameters:
            @display("p=23654,50,x");
            switch_id = "Switch_i11";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i12 : EthSwitch
    {
        parameters:
            @display("p=25621,50,x");
            switch_id = "Switch_i12";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i13 : EthSwitch
    {
        parameters:
            @display("p=27588,50,x");
            switch_id = "Switch_i13";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i14 : EthSwitch
    {
        parameters:
            @display("p=29555,50,x");
            switch_id = "Switch_i14";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i15 : EthSwitch
    {
        parameters:
            @display("p=31522,50,x");
            switch_id = "Switch_i15";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i16 : EthSwitch
    {
        parameters:
            @display("p=33489,50,x");
            switch_id = "Switch_i16";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i17 : EthSwitch
    {
        parameters:
            @display("p=35456,50,x");
            switch_id = "Switch_i17";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i18 : EthSwitch
    {
        parameters:
            @display("p=37423,50,x");
            switch_id = "Switch_i18";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i19 : EthSwitch
    {
        parameters:
            @display("p=39390,50,x");
            switch_id = "Switch_i19";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i20 : EthSwitch
    {
        parameters:
            @display("p=41357,50,x");
            switch_id = "Switch_i20";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i21 : EthSwitch
    {
        parameters:
            @display("p=43324,50,x");
            switch_id = "Switch_i21";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i22 : EthSwitch
    {
        parameters:
            @display("p=45291,50,x");
            switch_id = "Switch_i22";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i23 : EthSwitch
    {
        parameters:
            @display("p=47258,50,x");
            switch_id = "Switch_i23";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i24 : EthSwitch
    {
        parameters:
            @display("p=49225,50,x");
            switch_id = "Switch_i24";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i25 : EthSwitch
    {
        parameters:
            @display("p=51192,50,x");
            switch_id = "Switch_i25";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i26 : EthSwitch
    {
        parameters:
            @display("p=53159,50,x");
            switch_id = "Switch_i26";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i27 : EthSwitch
    {
        parameters:
            @display("p=55126,50,x");
            switch_id = "Switch_i27";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i28 : EthSwitch
    {
        parameters:
            @display("p=57093,50,x");
            switch_id = "Switch_i28";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i29 : EthSwitch
    {
        parameters:
            @display("p=59060,50,x");
            switch_id = "Switch_i29";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i30 : EthSwitch
    {
        parameters:
            @display("p=61027,50,x");
            switch_id = "Switch_i30";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i31 : EthSwitch
    {
        parameters:
            @display("p=62994,50,x");
            switch_id = "Switch_i31";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i32 : EthSwitch
    {
        parameters:
            @display("p=64961,50,x");
            switch_id = "Switch_i32";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i33 : EthSwitch
    {
        parameters:
            @display("p=66928,50,x");
            switch_id = "Switch_i33";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i34 : EthSwitch
    {
        parameters:
            @display("p=68895,50,x");
            switch_id = "Switch_i34";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i35 : EthSwitch
    {
        parameters:
            @display("p=70862,50,x");
            switch_id = "Switch_i35";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i36 : EthSwitch
    {
        parameters:
            @display("p=72829,50,x");
            switch_id = "Switch_i36";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i37 : EthSwitch
    {
        parameters:
            @display("p=74796,50,x");
            switch_id = "Switch_i37";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i38 : EthSwitch
    {
        parameters:
            @display("p=76763,50,x");
            switch_id = "Switch_i38";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i39 : EthSwitch
    {
        parameters:
            @display("p=78730,50,x");
            switch_id = "Switch_i39";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i40 : EthSwitch
    {
        parameters:
            @display("p=80697,50,x");
            switch_id = "Switch_i40";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i41 : EthSwitch
    {
        parameters:
            @display("p=82664,50,x");
            switch_id = "Switch_i41";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i42 : EthSwitch
    {
        parameters:
            @display("p=84631,50,x");
            switch_id = "Switch_i42";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i43 : EthSwitch
    {
        parameters:
            @display("p=86598,50,x");
            switch_id = "Switch_i43";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i44 : EthSwitch
    {
        parameters:
            @display("p=88565,50,x");
            switch_id = "Switch_i44";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i45 : EthSwitch
    {
        parameters:
            @display("p=90532,50,x");
            switch_id = "Switch_i45";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i46 : EthSwitch
    {
        parameters:
            @display("p=92499,50,x");
            switch_id = "Switch_i46";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i47 : EthSwitch
    {
        parameters:
            @display("p=94466,50,x");
            switch_id = "Switch_i47";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i48 : EthSwitch
    {
        parameters:
            @display("p=96433,50,x");
            switch_id = "Switch_i48";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i49 : EthSwitch
    {
        parameters:
            @display("p=98400,50,x");
            switch_id = "Switch_i49";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i50 : EthSwitch
    {
        parameters:
            @display("p=100367,50,x");
            switch_id = "Switch_i50";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i51 : EthSwitch
    {
        parameters:
            @display("p=102334,50,x");
            switch_id = "Switch_i51";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i52 : EthSwitch
    {
        parameters:
            @display("p=104301,50,x");
            switch_id = "Switch_i52";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i53 : EthSwitch
    {
        parameters:
            @display("p=106268,50,x");
            switch_id = "Switch_i53";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i54 : EthSwitch
    {
        parameters:
            @display("p=108235,50,x");
            switch_id = "Switch_i54";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i55 : EthSwitch
    {
        parameters:
            @display("p=110202,50,x");
            switch_id = "Switch_i55";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i56 : EthSwitch
    {
        parameters:
            @display("p=112169,50,x");
            switch_id = "Switch_i56";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i57 : EthSwitch
    {
        parameters:
            @display("p=114136,50,x");
            switch_id = "Switch_i57";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i58 : EthSwitch
    {
        parameters:
            @display("p=116103,50,x");
            switch_id = "Switch_i58";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i59 : EthSwitch
    {
        parameters:
            @display("p=118070,50,x");
            switch_id = "Switch_i59";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i60 : EthSwitch
    {
        parameters:
            @display("p=120037,50,x");
            switch_id = "Switch_i60";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i61 : EthSwitch
    {
        parameters:
            @display("p=122004,50,x");
            switch_id = "Switch_i61";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i62 : EthSwitch
    {
        parameters:
            @display("p=123971,50,x");
            switch_id = "Switch_i62";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }
    Switch_i63 : EthSwitch
    {
        parameters:
            @display("p=125938,50,x");
            switch_id = "Switch_i63";
            depth = 0;
            sub_tree_id = 304;
        gates:
            down_port[16];
            up_port[0];
    }

    connections:
     Switch_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_0_0_0.port;
     Switch_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_0_0_1.port;
     Switch_0_0_i0.down_port[2] <--> Link_1Gbps <--> Server_0_0_2.port;
     Switch_0_0_i0.down_port[3] <--> Link_1Gbps <--> Server_0_0_3.port;
     Switch_0_0_i0.down_port[4] <--> Link_1Gbps <--> Server_0_0_4.port;
     Switch_0_0_i0.down_port[5] <--> Link_1Gbps <--> Server_0_0_5.port;
     Switch_0_0_i0.down_port[6] <--> Link_1Gbps <--> Server_0_0_6.port;
     Switch_0_0_i0.down_port[7] <--> Link_1Gbps <--> Server_0_0_7.port;
     Switch_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_0_1_0.port;
     Switch_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_0_1_1.port;
     Switch_0_1_i0.down_port[2] <--> Link_1Gbps <--> Server_0_1_2.port;
     Switch_0_1_i0.down_port[3] <--> Link_1Gbps <--> Server_0_1_3.port;
     Switch_0_1_i0.down_port[4] <--> Link_1Gbps <--> Server_0_1_4.port;
     Switch_0_1_i0.down_port[5] <--> Link_1Gbps <--> Server_0_1_5.port;
     Switch_0_1_i0.down_port[6] <--> Link_1Gbps <--> Server_0_1_6.port;
     Switch_0_1_i0.down_port[7] <--> Link_1Gbps <--> Server_0_1_7.port;
     Switch_0_2_i0.down_port[0] <--> Link_1Gbps <--> Server_0_2_0.port;
     Switch_0_2_i0.down_port[1] <--> Link_1Gbps <--> Server_0_2_1.port;
     Switch_0_2_i0.down_port[2] <--> Link_1Gbps <--> Server_0_2_2.port;
     Switch_0_2_i0.down_port[3] <--> Link_1Gbps <--> Server_0_2_3.port;
     Switch_0_2_i0.down_port[4] <--> Link_1Gbps <--> Server_0_2_4.port;
     Switch_0_2_i0.down_port[5] <--> Link_1Gbps <--> Server_0_2_5.port;
     Switch_0_2_i0.down_port[6] <--> Link_1Gbps <--> Server_0_2_6.port;
     Switch_0_2_i0.down_port[7] <--> Link_1Gbps <--> Server_0_2_7.port;
     Switch_0_3_i0.down_port[0] <--> Link_1Gbps <--> Server_0_3_0.port;
     Switch_0_3_i0.down_port[1] <--> Link_1Gbps <--> Server_0_3_1.port;
     Switch_0_3_i0.down_port[2] <--> Link_1Gbps <--> Server_0_3_2.port;
     Switch_0_3_i0.down_port[3] <--> Link_1Gbps <--> Server_0_3_3.port;
     Switch_0_3_i0.down_port[4] <--> Link_1Gbps <--> Server_0_3_4.port;
     Switch_0_3_i0.down_port[5] <--> Link_1Gbps <--> Server_0_3_5.port;
     Switch_0_3_i0.down_port[6] <--> Link_1Gbps <--> Server_0_3_6.port;
     Switch_0_3_i0.down_port[7] <--> Link_1Gbps <--> Server_0_3_7.port;
     Switch_0_4_i0.down_port[0] <--> Link_1Gbps <--> Server_0_4_0.port;
     Switch_0_4_i0.down_port[1] <--> Link_1Gbps <--> Server_0_4_1.port;
     Switch_0_4_i0.down_port[2] <--> Link_1Gbps <--> Server_0_4_2.port;
     Switch_0_4_i0.down_port[3] <--> Link_1Gbps <--> Server_0_4_3.port;
     Switch_0_4_i0.down_port[4] <--> Link_1Gbps <--> Server_0_4_4.port;
     Switch_0_4_i0.down_port[5] <--> Link_1Gbps <--> Server_0_4_5.port;
     Switch_0_4_i0.down_port[6] <--> Link_1Gbps <--> Server_0_4_6.port;
     Switch_0_4_i0.down_port[7] <--> Link_1Gbps <--> Server_0_4_7.port;
     Switch_0_5_i0.down_port[0] <--> Link_1Gbps <--> Server_0_5_0.port;
     Switch_0_5_i0.down_port[1] <--> Link_1Gbps <--> Server_0_5_1.port;
     Switch_0_5_i0.down_port[2] <--> Link_1Gbps <--> Server_0_5_2.port;
     Switch_0_5_i0.down_port[3] <--> Link_1Gbps <--> Server_0_5_3.port;
     Switch_0_5_i0.down_port[4] <--> Link_1Gbps <--> Server_0_5_4.port;
     Switch_0_5_i0.down_port[5] <--> Link_1Gbps <--> Server_0_5_5.port;
     Switch_0_5_i0.down_port[6] <--> Link_1Gbps <--> Server_0_5_6.port;
     Switch_0_5_i0.down_port[7] <--> Link_1Gbps <--> Server_0_5_7.port;
     Switch_0_6_i0.down_port[0] <--> Link_1Gbps <--> Server_0_6_0.port;
     Switch_0_6_i0.down_port[1] <--> Link_1Gbps <--> Server_0_6_1.port;
     Switch_0_6_i0.down_port[2] <--> Link_1Gbps <--> Server_0_6_2.port;
     Switch_0_6_i0.down_port[3] <--> Link_1Gbps <--> Server_0_6_3.port;
     Switch_0_6_i0.down_port[4] <--> Link_1Gbps <--> Server_0_6_4.port;
     Switch_0_6_i0.down_port[5] <--> Link_1Gbps <--> Server_0_6_5.port;
     Switch_0_6_i0.down_port[6] <--> Link_1Gbps <--> Server_0_6_6.port;
     Switch_0_6_i0.down_port[7] <--> Link_1Gbps <--> Server_0_6_7.port;
     Switch_0_7_i0.down_port[0] <--> Link_1Gbps <--> Server_0_7_0.port;
     Switch_0_7_i0.down_port[1] <--> Link_1Gbps <--> Server_0_7_1.port;
     Switch_0_7_i0.down_port[2] <--> Link_1Gbps <--> Server_0_7_2.port;
     Switch_0_7_i0.down_port[3] <--> Link_1Gbps <--> Server_0_7_3.port;
     Switch_0_7_i0.down_port[4] <--> Link_1Gbps <--> Server_0_7_4.port;
     Switch_0_7_i0.down_port[5] <--> Link_1Gbps <--> Server_0_7_5.port;
     Switch_0_7_i0.down_port[6] <--> Link_1Gbps <--> Server_0_7_6.port;
     Switch_0_7_i0.down_port[7] <--> Link_1Gbps <--> Server_0_7_7.port;
     Switch_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i0.up_port[0];
     Switch_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i0.up_port[0];
     Switch_0_i0.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i0.up_port[0];
     Switch_0_i0.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i0.up_port[0];
     Switch_0_i0.down_port[4] <--> Link_1Gbps <--> Switch_0_4_i0.up_port[0];
     Switch_0_i0.down_port[5] <--> Link_1Gbps <--> Switch_0_5_i0.up_port[0];
     Switch_0_i0.down_port[6] <--> Link_1Gbps <--> Switch_0_6_i0.up_port[0];
     Switch_0_i0.down_port[7] <--> Link_1Gbps <--> Switch_0_7_i0.up_port[0];
     Switch_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i0.up_port[1];
     Switch_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i0.up_port[1];
     Switch_0_i1.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i0.up_port[1];
     Switch_0_i1.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i0.up_port[1];
     Switch_0_i1.down_port[4] <--> Link_1Gbps <--> Switch_0_4_i0.up_port[1];
     Switch_0_i1.down_port[5] <--> Link_1Gbps <--> Switch_0_5_i0.up_port[1];
     Switch_0_i1.down_port[6] <--> Link_1Gbps <--> Switch_0_6_i0.up_port[1];
     Switch_0_i1.down_port[7] <--> Link_1Gbps <--> Switch_0_7_i0.up_port[1];
     Switch_0_i2.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i0.up_port[2];
     Switch_0_i2.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i0.up_port[2];
     Switch_0_i2.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i0.up_port[2];
     Switch_0_i2.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i0.up_port[2];
     Switch_0_i2.down_port[4] <--> Link_1Gbps <--> Switch_0_4_i0.up_port[2];
     Switch_0_i2.down_port[5] <--> Link_1Gbps <--> Switch_0_5_i0.up_port[2];
     Switch_0_i2.down_port[6] <--> Link_1Gbps <--> Switch_0_6_i0.up_port[2];
     Switch_0_i2.down_port[7] <--> Link_1Gbps <--> Switch_0_7_i0.up_port[2];
     Switch_0_i3.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i0.up_port[3];
     Switch_0_i3.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i0.up_port[3];
     Switch_0_i3.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i0.up_port[3];
     Switch_0_i3.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i0.up_port[3];
     Switch_0_i3.down_port[4] <--> Link_1Gbps <--> Switch_0_4_i0.up_port[3];
     Switch_0_i3.down_port[5] <--> Link_1Gbps <--> Switch_0_5_i0.up_port[3];
     Switch_0_i3.down_port[6] <--> Link_1Gbps <--> Switch_0_6_i0.up_port[3];
     Switch_0_i3.down_port[7] <--> Link_1Gbps <--> Switch_0_7_i0.up_port[3];
     Switch_0_i4.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i0.up_port[4];
     Switch_0_i4.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i0.up_port[4];
     Switch_0_i4.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i0.up_port[4];
     Switch_0_i4.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i0.up_port[4];
     Switch_0_i4.down_port[4] <--> Link_1Gbps <--> Switch_0_4_i0.up_port[4];
     Switch_0_i4.down_port[5] <--> Link_1Gbps <--> Switch_0_5_i0.up_port[4];
     Switch_0_i4.down_port[6] <--> Link_1Gbps <--> Switch_0_6_i0.up_port[4];
     Switch_0_i4.down_port[7] <--> Link_1Gbps <--> Switch_0_7_i0.up_port[4];
     Switch_0_i5.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i0.up_port[5];
     Switch_0_i5.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i0.up_port[5];
     Switch_0_i5.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i0.up_port[5];
     Switch_0_i5.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i0.up_port[5];
     Switch_0_i5.down_port[4] <--> Link_1Gbps <--> Switch_0_4_i0.up_port[5];
     Switch_0_i5.down_port[5] <--> Link_1Gbps <--> Switch_0_5_i0.up_port[5];
     Switch_0_i5.down_port[6] <--> Link_1Gbps <--> Switch_0_6_i0.up_port[5];
     Switch_0_i5.down_port[7] <--> Link_1Gbps <--> Switch_0_7_i0.up_port[5];
     Switch_0_i6.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i0.up_port[6];
     Switch_0_i6.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i0.up_port[6];
     Switch_0_i6.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i0.up_port[6];
     Switch_0_i6.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i0.up_port[6];
     Switch_0_i6.down_port[4] <--> Link_1Gbps <--> Switch_0_4_i0.up_port[6];
     Switch_0_i6.down_port[5] <--> Link_1Gbps <--> Switch_0_5_i0.up_port[6];
     Switch_0_i6.down_port[6] <--> Link_1Gbps <--> Switch_0_6_i0.up_port[6];
     Switch_0_i6.down_port[7] <--> Link_1Gbps <--> Switch_0_7_i0.up_port[6];
     Switch_0_i7.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i0.up_port[7];
     Switch_0_i7.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i0.up_port[7];
     Switch_0_i7.down_port[2] <--> Link_1Gbps <--> Switch_0_2_i0.up_port[7];
     Switch_0_i7.down_port[3] <--> Link_1Gbps <--> Switch_0_3_i0.up_port[7];
     Switch_0_i7.down_port[4] <--> Link_1Gbps <--> Switch_0_4_i0.up_port[7];
     Switch_0_i7.down_port[5] <--> Link_1Gbps <--> Switch_0_5_i0.up_port[7];
     Switch_0_i7.down_port[6] <--> Link_1Gbps <--> Switch_0_6_i0.up_port[7];
     Switch_0_i7.down_port[7] <--> Link_1Gbps <--> Switch_0_7_i0.up_port[7];
     Switch_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_1_0_0.port;
     Switch_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_1_0_1.port;
     Switch_1_0_i0.down_port[2] <--> Link_1Gbps <--> Server_1_0_2.port;
     Switch_1_0_i0.down_port[3] <--> Link_1Gbps <--> Server_1_0_3.port;
     Switch_1_0_i0.down_port[4] <--> Link_1Gbps <--> Server_1_0_4.port;
     Switch_1_0_i0.down_port[5] <--> Link_1Gbps <--> Server_1_0_5.port;
     Switch_1_0_i0.down_port[6] <--> Link_1Gbps <--> Server_1_0_6.port;
     Switch_1_0_i0.down_port[7] <--> Link_1Gbps <--> Server_1_0_7.port;
     Switch_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_1_1_0.port;
     Switch_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_1_1_1.port;
     Switch_1_1_i0.down_port[2] <--> Link_1Gbps <--> Server_1_1_2.port;
     Switch_1_1_i0.down_port[3] <--> Link_1Gbps <--> Server_1_1_3.port;
     Switch_1_1_i0.down_port[4] <--> Link_1Gbps <--> Server_1_1_4.port;
     Switch_1_1_i0.down_port[5] <--> Link_1Gbps <--> Server_1_1_5.port;
     Switch_1_1_i0.down_port[6] <--> Link_1Gbps <--> Server_1_1_6.port;
     Switch_1_1_i0.down_port[7] <--> Link_1Gbps <--> Server_1_1_7.port;
     Switch_1_2_i0.down_port[0] <--> Link_1Gbps <--> Server_1_2_0.port;
     Switch_1_2_i0.down_port[1] <--> Link_1Gbps <--> Server_1_2_1.port;
     Switch_1_2_i0.down_port[2] <--> Link_1Gbps <--> Server_1_2_2.port;
     Switch_1_2_i0.down_port[3] <--> Link_1Gbps <--> Server_1_2_3.port;
     Switch_1_2_i0.down_port[4] <--> Link_1Gbps <--> Server_1_2_4.port;
     Switch_1_2_i0.down_port[5] <--> Link_1Gbps <--> Server_1_2_5.port;
     Switch_1_2_i0.down_port[6] <--> Link_1Gbps <--> Server_1_2_6.port;
     Switch_1_2_i0.down_port[7] <--> Link_1Gbps <--> Server_1_2_7.port;
     Switch_1_3_i0.down_port[0] <--> Link_1Gbps <--> Server_1_3_0.port;
     Switch_1_3_i0.down_port[1] <--> Link_1Gbps <--> Server_1_3_1.port;
     Switch_1_3_i0.down_port[2] <--> Link_1Gbps <--> Server_1_3_2.port;
     Switch_1_3_i0.down_port[3] <--> Link_1Gbps <--> Server_1_3_3.port;
     Switch_1_3_i0.down_port[4] <--> Link_1Gbps <--> Server_1_3_4.port;
     Switch_1_3_i0.down_port[5] <--> Link_1Gbps <--> Server_1_3_5.port;
     Switch_1_3_i0.down_port[6] <--> Link_1Gbps <--> Server_1_3_6.port;
     Switch_1_3_i0.down_port[7] <--> Link_1Gbps <--> Server_1_3_7.port;
     Switch_1_4_i0.down_port[0] <--> Link_1Gbps <--> Server_1_4_0.port;
     Switch_1_4_i0.down_port[1] <--> Link_1Gbps <--> Server_1_4_1.port;
     Switch_1_4_i0.down_port[2] <--> Link_1Gbps <--> Server_1_4_2.port;
     Switch_1_4_i0.down_port[3] <--> Link_1Gbps <--> Server_1_4_3.port;
     Switch_1_4_i0.down_port[4] <--> Link_1Gbps <--> Server_1_4_4.port;
     Switch_1_4_i0.down_port[5] <--> Link_1Gbps <--> Server_1_4_5.port;
     Switch_1_4_i0.down_port[6] <--> Link_1Gbps <--> Server_1_4_6.port;
     Switch_1_4_i0.down_port[7] <--> Link_1Gbps <--> Server_1_4_7.port;
     Switch_1_5_i0.down_port[0] <--> Link_1Gbps <--> Server_1_5_0.port;
     Switch_1_5_i0.down_port[1] <--> Link_1Gbps <--> Server_1_5_1.port;
     Switch_1_5_i0.down_port[2] <--> Link_1Gbps <--> Server_1_5_2.port;
     Switch_1_5_i0.down_port[3] <--> Link_1Gbps <--> Server_1_5_3.port;
     Switch_1_5_i0.down_port[4] <--> Link_1Gbps <--> Server_1_5_4.port;
     Switch_1_5_i0.down_port[5] <--> Link_1Gbps <--> Server_1_5_5.port;
     Switch_1_5_i0.down_port[6] <--> Link_1Gbps <--> Server_1_5_6.port;
     Switch_1_5_i0.down_port[7] <--> Link_1Gbps <--> Server_1_5_7.port;
     Switch_1_6_i0.down_port[0] <--> Link_1Gbps <--> Server_1_6_0.port;
     Switch_1_6_i0.down_port[1] <--> Link_1Gbps <--> Server_1_6_1.port;
     Switch_1_6_i0.down_port[2] <--> Link_1Gbps <--> Server_1_6_2.port;
     Switch_1_6_i0.down_port[3] <--> Link_1Gbps <--> Server_1_6_3.port;
     Switch_1_6_i0.down_port[4] <--> Link_1Gbps <--> Server_1_6_4.port;
     Switch_1_6_i0.down_port[5] <--> Link_1Gbps <--> Server_1_6_5.port;
     Switch_1_6_i0.down_port[6] <--> Link_1Gbps <--> Server_1_6_6.port;
     Switch_1_6_i0.down_port[7] <--> Link_1Gbps <--> Server_1_6_7.port;
     Switch_1_7_i0.down_port[0] <--> Link_1Gbps <--> Server_1_7_0.port;
     Switch_1_7_i0.down_port[1] <--> Link_1Gbps <--> Server_1_7_1.port;
     Switch_1_7_i0.down_port[2] <--> Link_1Gbps <--> Server_1_7_2.port;
     Switch_1_7_i0.down_port[3] <--> Link_1Gbps <--> Server_1_7_3.port;
     Switch_1_7_i0.down_port[4] <--> Link_1Gbps <--> Server_1_7_4.port;
     Switch_1_7_i0.down_port[5] <--> Link_1Gbps <--> Server_1_7_5.port;
     Switch_1_7_i0.down_port[6] <--> Link_1Gbps <--> Server_1_7_6.port;
     Switch_1_7_i0.down_port[7] <--> Link_1Gbps <--> Server_1_7_7.port;
     Switch_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i0.up_port[0];
     Switch_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i0.up_port[0];
     Switch_1_i0.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i0.up_port[0];
     Switch_1_i0.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i0.up_port[0];
     Switch_1_i0.down_port[4] <--> Link_1Gbps <--> Switch_1_4_i0.up_port[0];
     Switch_1_i0.down_port[5] <--> Link_1Gbps <--> Switch_1_5_i0.up_port[0];
     Switch_1_i0.down_port[6] <--> Link_1Gbps <--> Switch_1_6_i0.up_port[0];
     Switch_1_i0.down_port[7] <--> Link_1Gbps <--> Switch_1_7_i0.up_port[0];
     Switch_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i0.up_port[1];
     Switch_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i0.up_port[1];
     Switch_1_i1.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i0.up_port[1];
     Switch_1_i1.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i0.up_port[1];
     Switch_1_i1.down_port[4] <--> Link_1Gbps <--> Switch_1_4_i0.up_port[1];
     Switch_1_i1.down_port[5] <--> Link_1Gbps <--> Switch_1_5_i0.up_port[1];
     Switch_1_i1.down_port[6] <--> Link_1Gbps <--> Switch_1_6_i0.up_port[1];
     Switch_1_i1.down_port[7] <--> Link_1Gbps <--> Switch_1_7_i0.up_port[1];
     Switch_1_i2.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i0.up_port[2];
     Switch_1_i2.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i0.up_port[2];
     Switch_1_i2.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i0.up_port[2];
     Switch_1_i2.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i0.up_port[2];
     Switch_1_i2.down_port[4] <--> Link_1Gbps <--> Switch_1_4_i0.up_port[2];
     Switch_1_i2.down_port[5] <--> Link_1Gbps <--> Switch_1_5_i0.up_port[2];
     Switch_1_i2.down_port[6] <--> Link_1Gbps <--> Switch_1_6_i0.up_port[2];
     Switch_1_i2.down_port[7] <--> Link_1Gbps <--> Switch_1_7_i0.up_port[2];
     Switch_1_i3.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i0.up_port[3];
     Switch_1_i3.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i0.up_port[3];
     Switch_1_i3.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i0.up_port[3];
     Switch_1_i3.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i0.up_port[3];
     Switch_1_i3.down_port[4] <--> Link_1Gbps <--> Switch_1_4_i0.up_port[3];
     Switch_1_i3.down_port[5] <--> Link_1Gbps <--> Switch_1_5_i0.up_port[3];
     Switch_1_i3.down_port[6] <--> Link_1Gbps <--> Switch_1_6_i0.up_port[3];
     Switch_1_i3.down_port[7] <--> Link_1Gbps <--> Switch_1_7_i0.up_port[3];
     Switch_1_i4.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i0.up_port[4];
     Switch_1_i4.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i0.up_port[4];
     Switch_1_i4.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i0.up_port[4];
     Switch_1_i4.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i0.up_port[4];
     Switch_1_i4.down_port[4] <--> Link_1Gbps <--> Switch_1_4_i0.up_port[4];
     Switch_1_i4.down_port[5] <--> Link_1Gbps <--> Switch_1_5_i0.up_port[4];
     Switch_1_i4.down_port[6] <--> Link_1Gbps <--> Switch_1_6_i0.up_port[4];
     Switch_1_i4.down_port[7] <--> Link_1Gbps <--> Switch_1_7_i0.up_port[4];
     Switch_1_i5.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i0.up_port[5];
     Switch_1_i5.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i0.up_port[5];
     Switch_1_i5.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i0.up_port[5];
     Switch_1_i5.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i0.up_port[5];
     Switch_1_i5.down_port[4] <--> Link_1Gbps <--> Switch_1_4_i0.up_port[5];
     Switch_1_i5.down_port[5] <--> Link_1Gbps <--> Switch_1_5_i0.up_port[5];
     Switch_1_i5.down_port[6] <--> Link_1Gbps <--> Switch_1_6_i0.up_port[5];
     Switch_1_i5.down_port[7] <--> Link_1Gbps <--> Switch_1_7_i0.up_port[5];
     Switch_1_i6.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i0.up_port[6];
     Switch_1_i6.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i0.up_port[6];
     Switch_1_i6.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i0.up_port[6];
     Switch_1_i6.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i0.up_port[6];
     Switch_1_i6.down_port[4] <--> Link_1Gbps <--> Switch_1_4_i0.up_port[6];
     Switch_1_i6.down_port[5] <--> Link_1Gbps <--> Switch_1_5_i0.up_port[6];
     Switch_1_i6.down_port[6] <--> Link_1Gbps <--> Switch_1_6_i0.up_port[6];
     Switch_1_i6.down_port[7] <--> Link_1Gbps <--> Switch_1_7_i0.up_port[6];
     Switch_1_i7.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i0.up_port[7];
     Switch_1_i7.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i0.up_port[7];
     Switch_1_i7.down_port[2] <--> Link_1Gbps <--> Switch_1_2_i0.up_port[7];
     Switch_1_i7.down_port[3] <--> Link_1Gbps <--> Switch_1_3_i0.up_port[7];
     Switch_1_i7.down_port[4] <--> Link_1Gbps <--> Switch_1_4_i0.up_port[7];
     Switch_1_i7.down_port[5] <--> Link_1Gbps <--> Switch_1_5_i0.up_port[7];
     Switch_1_i7.down_port[6] <--> Link_1Gbps <--> Switch_1_6_i0.up_port[7];
     Switch_1_i7.down_port[7] <--> Link_1Gbps <--> Switch_1_7_i0.up_port[7];
     Switch_2_0_i0.down_port[0] <--> Link_1Gbps <--> Server_2_0_0.port;
     Switch_2_0_i0.down_port[1] <--> Link_1Gbps <--> Server_2_0_1.port;
     Switch_2_0_i0.down_port[2] <--> Link_1Gbps <--> Server_2_0_2.port;
     Switch_2_0_i0.down_port[3] <--> Link_1Gbps <--> Server_2_0_3.port;
     Switch_2_0_i0.down_port[4] <--> Link_1Gbps <--> Server_2_0_4.port;
     Switch_2_0_i0.down_port[5] <--> Link_1Gbps <--> Server_2_0_5.port;
     Switch_2_0_i0.down_port[6] <--> Link_1Gbps <--> Server_2_0_6.port;
     Switch_2_0_i0.down_port[7] <--> Link_1Gbps <--> Server_2_0_7.port;
     Switch_2_1_i0.down_port[0] <--> Link_1Gbps <--> Server_2_1_0.port;
     Switch_2_1_i0.down_port[1] <--> Link_1Gbps <--> Server_2_1_1.port;
     Switch_2_1_i0.down_port[2] <--> Link_1Gbps <--> Server_2_1_2.port;
     Switch_2_1_i0.down_port[3] <--> Link_1Gbps <--> Server_2_1_3.port;
     Switch_2_1_i0.down_port[4] <--> Link_1Gbps <--> Server_2_1_4.port;
     Switch_2_1_i0.down_port[5] <--> Link_1Gbps <--> Server_2_1_5.port;
     Switch_2_1_i0.down_port[6] <--> Link_1Gbps <--> Server_2_1_6.port;
     Switch_2_1_i0.down_port[7] <--> Link_1Gbps <--> Server_2_1_7.port;
     Switch_2_2_i0.down_port[0] <--> Link_1Gbps <--> Server_2_2_0.port;
     Switch_2_2_i0.down_port[1] <--> Link_1Gbps <--> Server_2_2_1.port;
     Switch_2_2_i0.down_port[2] <--> Link_1Gbps <--> Server_2_2_2.port;
     Switch_2_2_i0.down_port[3] <--> Link_1Gbps <--> Server_2_2_3.port;
     Switch_2_2_i0.down_port[4] <--> Link_1Gbps <--> Server_2_2_4.port;
     Switch_2_2_i0.down_port[5] <--> Link_1Gbps <--> Server_2_2_5.port;
     Switch_2_2_i0.down_port[6] <--> Link_1Gbps <--> Server_2_2_6.port;
     Switch_2_2_i0.down_port[7] <--> Link_1Gbps <--> Server_2_2_7.port;
     Switch_2_3_i0.down_port[0] <--> Link_1Gbps <--> Server_2_3_0.port;
     Switch_2_3_i0.down_port[1] <--> Link_1Gbps <--> Server_2_3_1.port;
     Switch_2_3_i0.down_port[2] <--> Link_1Gbps <--> Server_2_3_2.port;
     Switch_2_3_i0.down_port[3] <--> Link_1Gbps <--> Server_2_3_3.port;
     Switch_2_3_i0.down_port[4] <--> Link_1Gbps <--> Server_2_3_4.port;
     Switch_2_3_i0.down_port[5] <--> Link_1Gbps <--> Server_2_3_5.port;
     Switch_2_3_i0.down_port[6] <--> Link_1Gbps <--> Server_2_3_6.port;
     Switch_2_3_i0.down_port[7] <--> Link_1Gbps <--> Server_2_3_7.port;
     Switch_2_4_i0.down_port[0] <--> Link_1Gbps <--> Server_2_4_0.port;
     Switch_2_4_i0.down_port[1] <--> Link_1Gbps <--> Server_2_4_1.port;
     Switch_2_4_i0.down_port[2] <--> Link_1Gbps <--> Server_2_4_2.port;
     Switch_2_4_i0.down_port[3] <--> Link_1Gbps <--> Server_2_4_3.port;
     Switch_2_4_i0.down_port[4] <--> Link_1Gbps <--> Server_2_4_4.port;
     Switch_2_4_i0.down_port[5] <--> Link_1Gbps <--> Server_2_4_5.port;
     Switch_2_4_i0.down_port[6] <--> Link_1Gbps <--> Server_2_4_6.port;
     Switch_2_4_i0.down_port[7] <--> Link_1Gbps <--> Server_2_4_7.port;
     Switch_2_5_i0.down_port[0] <--> Link_1Gbps <--> Server_2_5_0.port;
     Switch_2_5_i0.down_port[1] <--> Link_1Gbps <--> Server_2_5_1.port;
     Switch_2_5_i0.down_port[2] <--> Link_1Gbps <--> Server_2_5_2.port;
     Switch_2_5_i0.down_port[3] <--> Link_1Gbps <--> Server_2_5_3.port;
     Switch_2_5_i0.down_port[4] <--> Link_1Gbps <--> Server_2_5_4.port;
     Switch_2_5_i0.down_port[5] <--> Link_1Gbps <--> Server_2_5_5.port;
     Switch_2_5_i0.down_port[6] <--> Link_1Gbps <--> Server_2_5_6.port;
     Switch_2_5_i0.down_port[7] <--> Link_1Gbps <--> Server_2_5_7.port;
     Switch_2_6_i0.down_port[0] <--> Link_1Gbps <--> Server_2_6_0.port;
     Switch_2_6_i0.down_port[1] <--> Link_1Gbps <--> Server_2_6_1.port;
     Switch_2_6_i0.down_port[2] <--> Link_1Gbps <--> Server_2_6_2.port;
     Switch_2_6_i0.down_port[3] <--> Link_1Gbps <--> Server_2_6_3.port;
     Switch_2_6_i0.down_port[4] <--> Link_1Gbps <--> Server_2_6_4.port;
     Switch_2_6_i0.down_port[5] <--> Link_1Gbps <--> Server_2_6_5.port;
     Switch_2_6_i0.down_port[6] <--> Link_1Gbps <--> Server_2_6_6.port;
     Switch_2_6_i0.down_port[7] <--> Link_1Gbps <--> Server_2_6_7.port;
     Switch_2_7_i0.down_port[0] <--> Link_1Gbps <--> Server_2_7_0.port;
     Switch_2_7_i0.down_port[1] <--> Link_1Gbps <--> Server_2_7_1.port;
     Switch_2_7_i0.down_port[2] <--> Link_1Gbps <--> Server_2_7_2.port;
     Switch_2_7_i0.down_port[3] <--> Link_1Gbps <--> Server_2_7_3.port;
     Switch_2_7_i0.down_port[4] <--> Link_1Gbps <--> Server_2_7_4.port;
     Switch_2_7_i0.down_port[5] <--> Link_1Gbps <--> Server_2_7_5.port;
     Switch_2_7_i0.down_port[6] <--> Link_1Gbps <--> Server_2_7_6.port;
     Switch_2_7_i0.down_port[7] <--> Link_1Gbps <--> Server_2_7_7.port;
     Switch_2_i0.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i0.up_port[0];
     Switch_2_i0.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i0.up_port[0];
     Switch_2_i0.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i0.up_port[0];
     Switch_2_i0.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i0.up_port[0];
     Switch_2_i0.down_port[4] <--> Link_1Gbps <--> Switch_2_4_i0.up_port[0];
     Switch_2_i0.down_port[5] <--> Link_1Gbps <--> Switch_2_5_i0.up_port[0];
     Switch_2_i0.down_port[6] <--> Link_1Gbps <--> Switch_2_6_i0.up_port[0];
     Switch_2_i0.down_port[7] <--> Link_1Gbps <--> Switch_2_7_i0.up_port[0];
     Switch_2_i1.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i0.up_port[1];
     Switch_2_i1.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i0.up_port[1];
     Switch_2_i1.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i0.up_port[1];
     Switch_2_i1.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i0.up_port[1];
     Switch_2_i1.down_port[4] <--> Link_1Gbps <--> Switch_2_4_i0.up_port[1];
     Switch_2_i1.down_port[5] <--> Link_1Gbps <--> Switch_2_5_i0.up_port[1];
     Switch_2_i1.down_port[6] <--> Link_1Gbps <--> Switch_2_6_i0.up_port[1];
     Switch_2_i1.down_port[7] <--> Link_1Gbps <--> Switch_2_7_i0.up_port[1];
     Switch_2_i2.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i0.up_port[2];
     Switch_2_i2.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i0.up_port[2];
     Switch_2_i2.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i0.up_port[2];
     Switch_2_i2.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i0.up_port[2];
     Switch_2_i2.down_port[4] <--> Link_1Gbps <--> Switch_2_4_i0.up_port[2];
     Switch_2_i2.down_port[5] <--> Link_1Gbps <--> Switch_2_5_i0.up_port[2];
     Switch_2_i2.down_port[6] <--> Link_1Gbps <--> Switch_2_6_i0.up_port[2];
     Switch_2_i2.down_port[7] <--> Link_1Gbps <--> Switch_2_7_i0.up_port[2];
     Switch_2_i3.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i0.up_port[3];
     Switch_2_i3.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i0.up_port[3];
     Switch_2_i3.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i0.up_port[3];
     Switch_2_i3.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i0.up_port[3];
     Switch_2_i3.down_port[4] <--> Link_1Gbps <--> Switch_2_4_i0.up_port[3];
     Switch_2_i3.down_port[5] <--> Link_1Gbps <--> Switch_2_5_i0.up_port[3];
     Switch_2_i3.down_port[6] <--> Link_1Gbps <--> Switch_2_6_i0.up_port[3];
     Switch_2_i3.down_port[7] <--> Link_1Gbps <--> Switch_2_7_i0.up_port[3];
     Switch_2_i4.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i0.up_port[4];
     Switch_2_i4.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i0.up_port[4];
     Switch_2_i4.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i0.up_port[4];
     Switch_2_i4.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i0.up_port[4];
     Switch_2_i4.down_port[4] <--> Link_1Gbps <--> Switch_2_4_i0.up_port[4];
     Switch_2_i4.down_port[5] <--> Link_1Gbps <--> Switch_2_5_i0.up_port[4];
     Switch_2_i4.down_port[6] <--> Link_1Gbps <--> Switch_2_6_i0.up_port[4];
     Switch_2_i4.down_port[7] <--> Link_1Gbps <--> Switch_2_7_i0.up_port[4];
     Switch_2_i5.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i0.up_port[5];
     Switch_2_i5.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i0.up_port[5];
     Switch_2_i5.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i0.up_port[5];
     Switch_2_i5.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i0.up_port[5];
     Switch_2_i5.down_port[4] <--> Link_1Gbps <--> Switch_2_4_i0.up_port[5];
     Switch_2_i5.down_port[5] <--> Link_1Gbps <--> Switch_2_5_i0.up_port[5];
     Switch_2_i5.down_port[6] <--> Link_1Gbps <--> Switch_2_6_i0.up_port[5];
     Switch_2_i5.down_port[7] <--> Link_1Gbps <--> Switch_2_7_i0.up_port[5];
     Switch_2_i6.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i0.up_port[6];
     Switch_2_i6.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i0.up_port[6];
     Switch_2_i6.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i0.up_port[6];
     Switch_2_i6.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i0.up_port[6];
     Switch_2_i6.down_port[4] <--> Link_1Gbps <--> Switch_2_4_i0.up_port[6];
     Switch_2_i6.down_port[5] <--> Link_1Gbps <--> Switch_2_5_i0.up_port[6];
     Switch_2_i6.down_port[6] <--> Link_1Gbps <--> Switch_2_6_i0.up_port[6];
     Switch_2_i6.down_port[7] <--> Link_1Gbps <--> Switch_2_7_i0.up_port[6];
     Switch_2_i7.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i0.up_port[7];
     Switch_2_i7.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i0.up_port[7];
     Switch_2_i7.down_port[2] <--> Link_1Gbps <--> Switch_2_2_i0.up_port[7];
     Switch_2_i7.down_port[3] <--> Link_1Gbps <--> Switch_2_3_i0.up_port[7];
     Switch_2_i7.down_port[4] <--> Link_1Gbps <--> Switch_2_4_i0.up_port[7];
     Switch_2_i7.down_port[5] <--> Link_1Gbps <--> Switch_2_5_i0.up_port[7];
     Switch_2_i7.down_port[6] <--> Link_1Gbps <--> Switch_2_6_i0.up_port[7];
     Switch_2_i7.down_port[7] <--> Link_1Gbps <--> Switch_2_7_i0.up_port[7];
     Switch_3_0_i0.down_port[0] <--> Link_1Gbps <--> Server_3_0_0.port;
     Switch_3_0_i0.down_port[1] <--> Link_1Gbps <--> Server_3_0_1.port;
     Switch_3_0_i0.down_port[2] <--> Link_1Gbps <--> Server_3_0_2.port;
     Switch_3_0_i0.down_port[3] <--> Link_1Gbps <--> Server_3_0_3.port;
     Switch_3_0_i0.down_port[4] <--> Link_1Gbps <--> Server_3_0_4.port;
     Switch_3_0_i0.down_port[5] <--> Link_1Gbps <--> Server_3_0_5.port;
     Switch_3_0_i0.down_port[6] <--> Link_1Gbps <--> Server_3_0_6.port;
     Switch_3_0_i0.down_port[7] <--> Link_1Gbps <--> Server_3_0_7.port;
     Switch_3_1_i0.down_port[0] <--> Link_1Gbps <--> Server_3_1_0.port;
     Switch_3_1_i0.down_port[1] <--> Link_1Gbps <--> Server_3_1_1.port;
     Switch_3_1_i0.down_port[2] <--> Link_1Gbps <--> Server_3_1_2.port;
     Switch_3_1_i0.down_port[3] <--> Link_1Gbps <--> Server_3_1_3.port;
     Switch_3_1_i0.down_port[4] <--> Link_1Gbps <--> Server_3_1_4.port;
     Switch_3_1_i0.down_port[5] <--> Link_1Gbps <--> Server_3_1_5.port;
     Switch_3_1_i0.down_port[6] <--> Link_1Gbps <--> Server_3_1_6.port;
     Switch_3_1_i0.down_port[7] <--> Link_1Gbps <--> Server_3_1_7.port;
     Switch_3_2_i0.down_port[0] <--> Link_1Gbps <--> Server_3_2_0.port;
     Switch_3_2_i0.down_port[1] <--> Link_1Gbps <--> Server_3_2_1.port;
     Switch_3_2_i0.down_port[2] <--> Link_1Gbps <--> Server_3_2_2.port;
     Switch_3_2_i0.down_port[3] <--> Link_1Gbps <--> Server_3_2_3.port;
     Switch_3_2_i0.down_port[4] <--> Link_1Gbps <--> Server_3_2_4.port;
     Switch_3_2_i0.down_port[5] <--> Link_1Gbps <--> Server_3_2_5.port;
     Switch_3_2_i0.down_port[6] <--> Link_1Gbps <--> Server_3_2_6.port;
     Switch_3_2_i0.down_port[7] <--> Link_1Gbps <--> Server_3_2_7.port;
     Switch_3_3_i0.down_port[0] <--> Link_1Gbps <--> Server_3_3_0.port;
     Switch_3_3_i0.down_port[1] <--> Link_1Gbps <--> Server_3_3_1.port;
     Switch_3_3_i0.down_port[2] <--> Link_1Gbps <--> Server_3_3_2.port;
     Switch_3_3_i0.down_port[3] <--> Link_1Gbps <--> Server_3_3_3.port;
     Switch_3_3_i0.down_port[4] <--> Link_1Gbps <--> Server_3_3_4.port;
     Switch_3_3_i0.down_port[5] <--> Link_1Gbps <--> Server_3_3_5.port;
     Switch_3_3_i0.down_port[6] <--> Link_1Gbps <--> Server_3_3_6.port;
     Switch_3_3_i0.down_port[7] <--> Link_1Gbps <--> Server_3_3_7.port;
     Switch_3_4_i0.down_port[0] <--> Link_1Gbps <--> Server_3_4_0.port;
     Switch_3_4_i0.down_port[1] <--> Link_1Gbps <--> Server_3_4_1.port;
     Switch_3_4_i0.down_port[2] <--> Link_1Gbps <--> Server_3_4_2.port;
     Switch_3_4_i0.down_port[3] <--> Link_1Gbps <--> Server_3_4_3.port;
     Switch_3_4_i0.down_port[4] <--> Link_1Gbps <--> Server_3_4_4.port;
     Switch_3_4_i0.down_port[5] <--> Link_1Gbps <--> Server_3_4_5.port;
     Switch_3_4_i0.down_port[6] <--> Link_1Gbps <--> Server_3_4_6.port;
     Switch_3_4_i0.down_port[7] <--> Link_1Gbps <--> Server_3_4_7.port;
     Switch_3_5_i0.down_port[0] <--> Link_1Gbps <--> Server_3_5_0.port;
     Switch_3_5_i0.down_port[1] <--> Link_1Gbps <--> Server_3_5_1.port;
     Switch_3_5_i0.down_port[2] <--> Link_1Gbps <--> Server_3_5_2.port;
     Switch_3_5_i0.down_port[3] <--> Link_1Gbps <--> Server_3_5_3.port;
     Switch_3_5_i0.down_port[4] <--> Link_1Gbps <--> Server_3_5_4.port;
     Switch_3_5_i0.down_port[5] <--> Link_1Gbps <--> Server_3_5_5.port;
     Switch_3_5_i0.down_port[6] <--> Link_1Gbps <--> Server_3_5_6.port;
     Switch_3_5_i0.down_port[7] <--> Link_1Gbps <--> Server_3_5_7.port;
     Switch_3_6_i0.down_port[0] <--> Link_1Gbps <--> Server_3_6_0.port;
     Switch_3_6_i0.down_port[1] <--> Link_1Gbps <--> Server_3_6_1.port;
     Switch_3_6_i0.down_port[2] <--> Link_1Gbps <--> Server_3_6_2.port;
     Switch_3_6_i0.down_port[3] <--> Link_1Gbps <--> Server_3_6_3.port;
     Switch_3_6_i0.down_port[4] <--> Link_1Gbps <--> Server_3_6_4.port;
     Switch_3_6_i0.down_port[5] <--> Link_1Gbps <--> Server_3_6_5.port;
     Switch_3_6_i0.down_port[6] <--> Link_1Gbps <--> Server_3_6_6.port;
     Switch_3_6_i0.down_port[7] <--> Link_1Gbps <--> Server_3_6_7.port;
     Switch_3_7_i0.down_port[0] <--> Link_1Gbps <--> Server_3_7_0.port;
     Switch_3_7_i0.down_port[1] <--> Link_1Gbps <--> Server_3_7_1.port;
     Switch_3_7_i0.down_port[2] <--> Link_1Gbps <--> Server_3_7_2.port;
     Switch_3_7_i0.down_port[3] <--> Link_1Gbps <--> Server_3_7_3.port;
     Switch_3_7_i0.down_port[4] <--> Link_1Gbps <--> Server_3_7_4.port;
     Switch_3_7_i0.down_port[5] <--> Link_1Gbps <--> Server_3_7_5.port;
     Switch_3_7_i0.down_port[6] <--> Link_1Gbps <--> Server_3_7_6.port;
     Switch_3_7_i0.down_port[7] <--> Link_1Gbps <--> Server_3_7_7.port;
     Switch_3_i0.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i0.up_port[0];
     Switch_3_i0.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i0.up_port[0];
     Switch_3_i0.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i0.up_port[0];
     Switch_3_i0.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i0.up_port[0];
     Switch_3_i0.down_port[4] <--> Link_1Gbps <--> Switch_3_4_i0.up_port[0];
     Switch_3_i0.down_port[5] <--> Link_1Gbps <--> Switch_3_5_i0.up_port[0];
     Switch_3_i0.down_port[6] <--> Link_1Gbps <--> Switch_3_6_i0.up_port[0];
     Switch_3_i0.down_port[7] <--> Link_1Gbps <--> Switch_3_7_i0.up_port[0];
     Switch_3_i1.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i0.up_port[1];
     Switch_3_i1.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i0.up_port[1];
     Switch_3_i1.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i0.up_port[1];
     Switch_3_i1.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i0.up_port[1];
     Switch_3_i1.down_port[4] <--> Link_1Gbps <--> Switch_3_4_i0.up_port[1];
     Switch_3_i1.down_port[5] <--> Link_1Gbps <--> Switch_3_5_i0.up_port[1];
     Switch_3_i1.down_port[6] <--> Link_1Gbps <--> Switch_3_6_i0.up_port[1];
     Switch_3_i1.down_port[7] <--> Link_1Gbps <--> Switch_3_7_i0.up_port[1];
     Switch_3_i2.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i0.up_port[2];
     Switch_3_i2.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i0.up_port[2];
     Switch_3_i2.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i0.up_port[2];
     Switch_3_i2.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i0.up_port[2];
     Switch_3_i2.down_port[4] <--> Link_1Gbps <--> Switch_3_4_i0.up_port[2];
     Switch_3_i2.down_port[5] <--> Link_1Gbps <--> Switch_3_5_i0.up_port[2];
     Switch_3_i2.down_port[6] <--> Link_1Gbps <--> Switch_3_6_i0.up_port[2];
     Switch_3_i2.down_port[7] <--> Link_1Gbps <--> Switch_3_7_i0.up_port[2];
     Switch_3_i3.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i0.up_port[3];
     Switch_3_i3.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i0.up_port[3];
     Switch_3_i3.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i0.up_port[3];
     Switch_3_i3.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i0.up_port[3];
     Switch_3_i3.down_port[4] <--> Link_1Gbps <--> Switch_3_4_i0.up_port[3];
     Switch_3_i3.down_port[5] <--> Link_1Gbps <--> Switch_3_5_i0.up_port[3];
     Switch_3_i3.down_port[6] <--> Link_1Gbps <--> Switch_3_6_i0.up_port[3];
     Switch_3_i3.down_port[7] <--> Link_1Gbps <--> Switch_3_7_i0.up_port[3];
     Switch_3_i4.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i0.up_port[4];
     Switch_3_i4.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i0.up_port[4];
     Switch_3_i4.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i0.up_port[4];
     Switch_3_i4.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i0.up_port[4];
     Switch_3_i4.down_port[4] <--> Link_1Gbps <--> Switch_3_4_i0.up_port[4];
     Switch_3_i4.down_port[5] <--> Link_1Gbps <--> Switch_3_5_i0.up_port[4];
     Switch_3_i4.down_port[6] <--> Link_1Gbps <--> Switch_3_6_i0.up_port[4];
     Switch_3_i4.down_port[7] <--> Link_1Gbps <--> Switch_3_7_i0.up_port[4];
     Switch_3_i5.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i0.up_port[5];
     Switch_3_i5.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i0.up_port[5];
     Switch_3_i5.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i0.up_port[5];
     Switch_3_i5.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i0.up_port[5];
     Switch_3_i5.down_port[4] <--> Link_1Gbps <--> Switch_3_4_i0.up_port[5];
     Switch_3_i5.down_port[5] <--> Link_1Gbps <--> Switch_3_5_i0.up_port[5];
     Switch_3_i5.down_port[6] <--> Link_1Gbps <--> Switch_3_6_i0.up_port[5];
     Switch_3_i5.down_port[7] <--> Link_1Gbps <--> Switch_3_7_i0.up_port[5];
     Switch_3_i6.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i0.up_port[6];
     Switch_3_i6.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i0.up_port[6];
     Switch_3_i6.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i0.up_port[6];
     Switch_3_i6.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i0.up_port[6];
     Switch_3_i6.down_port[4] <--> Link_1Gbps <--> Switch_3_4_i0.up_port[6];
     Switch_3_i6.down_port[5] <--> Link_1Gbps <--> Switch_3_5_i0.up_port[6];
     Switch_3_i6.down_port[6] <--> Link_1Gbps <--> Switch_3_6_i0.up_port[6];
     Switch_3_i6.down_port[7] <--> Link_1Gbps <--> Switch_3_7_i0.up_port[6];
     Switch_3_i7.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i0.up_port[7];
     Switch_3_i7.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i0.up_port[7];
     Switch_3_i7.down_port[2] <--> Link_1Gbps <--> Switch_3_2_i0.up_port[7];
     Switch_3_i7.down_port[3] <--> Link_1Gbps <--> Switch_3_3_i0.up_port[7];
     Switch_3_i7.down_port[4] <--> Link_1Gbps <--> Switch_3_4_i0.up_port[7];
     Switch_3_i7.down_port[5] <--> Link_1Gbps <--> Switch_3_5_i0.up_port[7];
     Switch_3_i7.down_port[6] <--> Link_1Gbps <--> Switch_3_6_i0.up_port[7];
     Switch_3_i7.down_port[7] <--> Link_1Gbps <--> Switch_3_7_i0.up_port[7];
     Switch_4_0_i0.down_port[0] <--> Link_1Gbps <--> Server_4_0_0.port;
     Switch_4_0_i0.down_port[1] <--> Link_1Gbps <--> Server_4_0_1.port;
     Switch_4_0_i0.down_port[2] <--> Link_1Gbps <--> Server_4_0_2.port;
     Switch_4_0_i0.down_port[3] <--> Link_1Gbps <--> Server_4_0_3.port;
     Switch_4_0_i0.down_port[4] <--> Link_1Gbps <--> Server_4_0_4.port;
     Switch_4_0_i0.down_port[5] <--> Link_1Gbps <--> Server_4_0_5.port;
     Switch_4_0_i0.down_port[6] <--> Link_1Gbps <--> Server_4_0_6.port;
     Switch_4_0_i0.down_port[7] <--> Link_1Gbps <--> Server_4_0_7.port;
     Switch_4_1_i0.down_port[0] <--> Link_1Gbps <--> Server_4_1_0.port;
     Switch_4_1_i0.down_port[1] <--> Link_1Gbps <--> Server_4_1_1.port;
     Switch_4_1_i0.down_port[2] <--> Link_1Gbps <--> Server_4_1_2.port;
     Switch_4_1_i0.down_port[3] <--> Link_1Gbps <--> Server_4_1_3.port;
     Switch_4_1_i0.down_port[4] <--> Link_1Gbps <--> Server_4_1_4.port;
     Switch_4_1_i0.down_port[5] <--> Link_1Gbps <--> Server_4_1_5.port;
     Switch_4_1_i0.down_port[6] <--> Link_1Gbps <--> Server_4_1_6.port;
     Switch_4_1_i0.down_port[7] <--> Link_1Gbps <--> Server_4_1_7.port;
     Switch_4_2_i0.down_port[0] <--> Link_1Gbps <--> Server_4_2_0.port;
     Switch_4_2_i0.down_port[1] <--> Link_1Gbps <--> Server_4_2_1.port;
     Switch_4_2_i0.down_port[2] <--> Link_1Gbps <--> Server_4_2_2.port;
     Switch_4_2_i0.down_port[3] <--> Link_1Gbps <--> Server_4_2_3.port;
     Switch_4_2_i0.down_port[4] <--> Link_1Gbps <--> Server_4_2_4.port;
     Switch_4_2_i0.down_port[5] <--> Link_1Gbps <--> Server_4_2_5.port;
     Switch_4_2_i0.down_port[6] <--> Link_1Gbps <--> Server_4_2_6.port;
     Switch_4_2_i0.down_port[7] <--> Link_1Gbps <--> Server_4_2_7.port;
     Switch_4_3_i0.down_port[0] <--> Link_1Gbps <--> Server_4_3_0.port;
     Switch_4_3_i0.down_port[1] <--> Link_1Gbps <--> Server_4_3_1.port;
     Switch_4_3_i0.down_port[2] <--> Link_1Gbps <--> Server_4_3_2.port;
     Switch_4_3_i0.down_port[3] <--> Link_1Gbps <--> Server_4_3_3.port;
     Switch_4_3_i0.down_port[4] <--> Link_1Gbps <--> Server_4_3_4.port;
     Switch_4_3_i0.down_port[5] <--> Link_1Gbps <--> Server_4_3_5.port;
     Switch_4_3_i0.down_port[6] <--> Link_1Gbps <--> Server_4_3_6.port;
     Switch_4_3_i0.down_port[7] <--> Link_1Gbps <--> Server_4_3_7.port;
     Switch_4_4_i0.down_port[0] <--> Link_1Gbps <--> Server_4_4_0.port;
     Switch_4_4_i0.down_port[1] <--> Link_1Gbps <--> Server_4_4_1.port;
     Switch_4_4_i0.down_port[2] <--> Link_1Gbps <--> Server_4_4_2.port;
     Switch_4_4_i0.down_port[3] <--> Link_1Gbps <--> Server_4_4_3.port;
     Switch_4_4_i0.down_port[4] <--> Link_1Gbps <--> Server_4_4_4.port;
     Switch_4_4_i0.down_port[5] <--> Link_1Gbps <--> Server_4_4_5.port;
     Switch_4_4_i0.down_port[6] <--> Link_1Gbps <--> Server_4_4_6.port;
     Switch_4_4_i0.down_port[7] <--> Link_1Gbps <--> Server_4_4_7.port;
     Switch_4_5_i0.down_port[0] <--> Link_1Gbps <--> Server_4_5_0.port;
     Switch_4_5_i0.down_port[1] <--> Link_1Gbps <--> Server_4_5_1.port;
     Switch_4_5_i0.down_port[2] <--> Link_1Gbps <--> Server_4_5_2.port;
     Switch_4_5_i0.down_port[3] <--> Link_1Gbps <--> Server_4_5_3.port;
     Switch_4_5_i0.down_port[4] <--> Link_1Gbps <--> Server_4_5_4.port;
     Switch_4_5_i0.down_port[5] <--> Link_1Gbps <--> Server_4_5_5.port;
     Switch_4_5_i0.down_port[6] <--> Link_1Gbps <--> Server_4_5_6.port;
     Switch_4_5_i0.down_port[7] <--> Link_1Gbps <--> Server_4_5_7.port;
     Switch_4_6_i0.down_port[0] <--> Link_1Gbps <--> Server_4_6_0.port;
     Switch_4_6_i0.down_port[1] <--> Link_1Gbps <--> Server_4_6_1.port;
     Switch_4_6_i0.down_port[2] <--> Link_1Gbps <--> Server_4_6_2.port;
     Switch_4_6_i0.down_port[3] <--> Link_1Gbps <--> Server_4_6_3.port;
     Switch_4_6_i0.down_port[4] <--> Link_1Gbps <--> Server_4_6_4.port;
     Switch_4_6_i0.down_port[5] <--> Link_1Gbps <--> Server_4_6_5.port;
     Switch_4_6_i0.down_port[6] <--> Link_1Gbps <--> Server_4_6_6.port;
     Switch_4_6_i0.down_port[7] <--> Link_1Gbps <--> Server_4_6_7.port;
     Switch_4_7_i0.down_port[0] <--> Link_1Gbps <--> Server_4_7_0.port;
     Switch_4_7_i0.down_port[1] <--> Link_1Gbps <--> Server_4_7_1.port;
     Switch_4_7_i0.down_port[2] <--> Link_1Gbps <--> Server_4_7_2.port;
     Switch_4_7_i0.down_port[3] <--> Link_1Gbps <--> Server_4_7_3.port;
     Switch_4_7_i0.down_port[4] <--> Link_1Gbps <--> Server_4_7_4.port;
     Switch_4_7_i0.down_port[5] <--> Link_1Gbps <--> Server_4_7_5.port;
     Switch_4_7_i0.down_port[6] <--> Link_1Gbps <--> Server_4_7_6.port;
     Switch_4_7_i0.down_port[7] <--> Link_1Gbps <--> Server_4_7_7.port;
     Switch_4_i0.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i0.up_port[0];
     Switch_4_i0.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i0.up_port[0];
     Switch_4_i0.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i0.up_port[0];
     Switch_4_i0.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i0.up_port[0];
     Switch_4_i0.down_port[4] <--> Link_1Gbps <--> Switch_4_4_i0.up_port[0];
     Switch_4_i0.down_port[5] <--> Link_1Gbps <--> Switch_4_5_i0.up_port[0];
     Switch_4_i0.down_port[6] <--> Link_1Gbps <--> Switch_4_6_i0.up_port[0];
     Switch_4_i0.down_port[7] <--> Link_1Gbps <--> Switch_4_7_i0.up_port[0];
     Switch_4_i1.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i0.up_port[1];
     Switch_4_i1.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i0.up_port[1];
     Switch_4_i1.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i0.up_port[1];
     Switch_4_i1.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i0.up_port[1];
     Switch_4_i1.down_port[4] <--> Link_1Gbps <--> Switch_4_4_i0.up_port[1];
     Switch_4_i1.down_port[5] <--> Link_1Gbps <--> Switch_4_5_i0.up_port[1];
     Switch_4_i1.down_port[6] <--> Link_1Gbps <--> Switch_4_6_i0.up_port[1];
     Switch_4_i1.down_port[7] <--> Link_1Gbps <--> Switch_4_7_i0.up_port[1];
     Switch_4_i2.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i0.up_port[2];
     Switch_4_i2.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i0.up_port[2];
     Switch_4_i2.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i0.up_port[2];
     Switch_4_i2.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i0.up_port[2];
     Switch_4_i2.down_port[4] <--> Link_1Gbps <--> Switch_4_4_i0.up_port[2];
     Switch_4_i2.down_port[5] <--> Link_1Gbps <--> Switch_4_5_i0.up_port[2];
     Switch_4_i2.down_port[6] <--> Link_1Gbps <--> Switch_4_6_i0.up_port[2];
     Switch_4_i2.down_port[7] <--> Link_1Gbps <--> Switch_4_7_i0.up_port[2];
     Switch_4_i3.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i0.up_port[3];
     Switch_4_i3.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i0.up_port[3];
     Switch_4_i3.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i0.up_port[3];
     Switch_4_i3.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i0.up_port[3];
     Switch_4_i3.down_port[4] <--> Link_1Gbps <--> Switch_4_4_i0.up_port[3];
     Switch_4_i3.down_port[5] <--> Link_1Gbps <--> Switch_4_5_i0.up_port[3];
     Switch_4_i3.down_port[6] <--> Link_1Gbps <--> Switch_4_6_i0.up_port[3];
     Switch_4_i3.down_port[7] <--> Link_1Gbps <--> Switch_4_7_i0.up_port[3];
     Switch_4_i4.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i0.up_port[4];
     Switch_4_i4.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i0.up_port[4];
     Switch_4_i4.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i0.up_port[4];
     Switch_4_i4.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i0.up_port[4];
     Switch_4_i4.down_port[4] <--> Link_1Gbps <--> Switch_4_4_i0.up_port[4];
     Switch_4_i4.down_port[5] <--> Link_1Gbps <--> Switch_4_5_i0.up_port[4];
     Switch_4_i4.down_port[6] <--> Link_1Gbps <--> Switch_4_6_i0.up_port[4];
     Switch_4_i4.down_port[7] <--> Link_1Gbps <--> Switch_4_7_i0.up_port[4];
     Switch_4_i5.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i0.up_port[5];
     Switch_4_i5.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i0.up_port[5];
     Switch_4_i5.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i0.up_port[5];
     Switch_4_i5.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i0.up_port[5];
     Switch_4_i5.down_port[4] <--> Link_1Gbps <--> Switch_4_4_i0.up_port[5];
     Switch_4_i5.down_port[5] <--> Link_1Gbps <--> Switch_4_5_i0.up_port[5];
     Switch_4_i5.down_port[6] <--> Link_1Gbps <--> Switch_4_6_i0.up_port[5];
     Switch_4_i5.down_port[7] <--> Link_1Gbps <--> Switch_4_7_i0.up_port[5];
     Switch_4_i6.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i0.up_port[6];
     Switch_4_i6.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i0.up_port[6];
     Switch_4_i6.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i0.up_port[6];
     Switch_4_i6.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i0.up_port[6];
     Switch_4_i6.down_port[4] <--> Link_1Gbps <--> Switch_4_4_i0.up_port[6];
     Switch_4_i6.down_port[5] <--> Link_1Gbps <--> Switch_4_5_i0.up_port[6];
     Switch_4_i6.down_port[6] <--> Link_1Gbps <--> Switch_4_6_i0.up_port[6];
     Switch_4_i6.down_port[7] <--> Link_1Gbps <--> Switch_4_7_i0.up_port[6];
     Switch_4_i7.down_port[0] <--> Link_1Gbps <--> Switch_4_0_i0.up_port[7];
     Switch_4_i7.down_port[1] <--> Link_1Gbps <--> Switch_4_1_i0.up_port[7];
     Switch_4_i7.down_port[2] <--> Link_1Gbps <--> Switch_4_2_i0.up_port[7];
     Switch_4_i7.down_port[3] <--> Link_1Gbps <--> Switch_4_3_i0.up_port[7];
     Switch_4_i7.down_port[4] <--> Link_1Gbps <--> Switch_4_4_i0.up_port[7];
     Switch_4_i7.down_port[5] <--> Link_1Gbps <--> Switch_4_5_i0.up_port[7];
     Switch_4_i7.down_port[6] <--> Link_1Gbps <--> Switch_4_6_i0.up_port[7];
     Switch_4_i7.down_port[7] <--> Link_1Gbps <--> Switch_4_7_i0.up_port[7];
     Switch_5_0_i0.down_port[0] <--> Link_1Gbps <--> Server_5_0_0.port;
     Switch_5_0_i0.down_port[1] <--> Link_1Gbps <--> Server_5_0_1.port;
     Switch_5_0_i0.down_port[2] <--> Link_1Gbps <--> Server_5_0_2.port;
     Switch_5_0_i0.down_port[3] <--> Link_1Gbps <--> Server_5_0_3.port;
     Switch_5_0_i0.down_port[4] <--> Link_1Gbps <--> Server_5_0_4.port;
     Switch_5_0_i0.down_port[5] <--> Link_1Gbps <--> Server_5_0_5.port;
     Switch_5_0_i0.down_port[6] <--> Link_1Gbps <--> Server_5_0_6.port;
     Switch_5_0_i0.down_port[7] <--> Link_1Gbps <--> Server_5_0_7.port;
     Switch_5_1_i0.down_port[0] <--> Link_1Gbps <--> Server_5_1_0.port;
     Switch_5_1_i0.down_port[1] <--> Link_1Gbps <--> Server_5_1_1.port;
     Switch_5_1_i0.down_port[2] <--> Link_1Gbps <--> Server_5_1_2.port;
     Switch_5_1_i0.down_port[3] <--> Link_1Gbps <--> Server_5_1_3.port;
     Switch_5_1_i0.down_port[4] <--> Link_1Gbps <--> Server_5_1_4.port;
     Switch_5_1_i0.down_port[5] <--> Link_1Gbps <--> Server_5_1_5.port;
     Switch_5_1_i0.down_port[6] <--> Link_1Gbps <--> Server_5_1_6.port;
     Switch_5_1_i0.down_port[7] <--> Link_1Gbps <--> Server_5_1_7.port;
     Switch_5_2_i0.down_port[0] <--> Link_1Gbps <--> Server_5_2_0.port;
     Switch_5_2_i0.down_port[1] <--> Link_1Gbps <--> Server_5_2_1.port;
     Switch_5_2_i0.down_port[2] <--> Link_1Gbps <--> Server_5_2_2.port;
     Switch_5_2_i0.down_port[3] <--> Link_1Gbps <--> Server_5_2_3.port;
     Switch_5_2_i0.down_port[4] <--> Link_1Gbps <--> Server_5_2_4.port;
     Switch_5_2_i0.down_port[5] <--> Link_1Gbps <--> Server_5_2_5.port;
     Switch_5_2_i0.down_port[6] <--> Link_1Gbps <--> Server_5_2_6.port;
     Switch_5_2_i0.down_port[7] <--> Link_1Gbps <--> Server_5_2_7.port;
     Switch_5_3_i0.down_port[0] <--> Link_1Gbps <--> Server_5_3_0.port;
     Switch_5_3_i0.down_port[1] <--> Link_1Gbps <--> Server_5_3_1.port;
     Switch_5_3_i0.down_port[2] <--> Link_1Gbps <--> Server_5_3_2.port;
     Switch_5_3_i0.down_port[3] <--> Link_1Gbps <--> Server_5_3_3.port;
     Switch_5_3_i0.down_port[4] <--> Link_1Gbps <--> Server_5_3_4.port;
     Switch_5_3_i0.down_port[5] <--> Link_1Gbps <--> Server_5_3_5.port;
     Switch_5_3_i0.down_port[6] <--> Link_1Gbps <--> Server_5_3_6.port;
     Switch_5_3_i0.down_port[7] <--> Link_1Gbps <--> Server_5_3_7.port;
     Switch_5_4_i0.down_port[0] <--> Link_1Gbps <--> Server_5_4_0.port;
     Switch_5_4_i0.down_port[1] <--> Link_1Gbps <--> Server_5_4_1.port;
     Switch_5_4_i0.down_port[2] <--> Link_1Gbps <--> Server_5_4_2.port;
     Switch_5_4_i0.down_port[3] <--> Link_1Gbps <--> Server_5_4_3.port;
     Switch_5_4_i0.down_port[4] <--> Link_1Gbps <--> Server_5_4_4.port;
     Switch_5_4_i0.down_port[5] <--> Link_1Gbps <--> Server_5_4_5.port;
     Switch_5_4_i0.down_port[6] <--> Link_1Gbps <--> Server_5_4_6.port;
     Switch_5_4_i0.down_port[7] <--> Link_1Gbps <--> Server_5_4_7.port;
     Switch_5_5_i0.down_port[0] <--> Link_1Gbps <--> Server_5_5_0.port;
     Switch_5_5_i0.down_port[1] <--> Link_1Gbps <--> Server_5_5_1.port;
     Switch_5_5_i0.down_port[2] <--> Link_1Gbps <--> Server_5_5_2.port;
     Switch_5_5_i0.down_port[3] <--> Link_1Gbps <--> Server_5_5_3.port;
     Switch_5_5_i0.down_port[4] <--> Link_1Gbps <--> Server_5_5_4.port;
     Switch_5_5_i0.down_port[5] <--> Link_1Gbps <--> Server_5_5_5.port;
     Switch_5_5_i0.down_port[6] <--> Link_1Gbps <--> Server_5_5_6.port;
     Switch_5_5_i0.down_port[7] <--> Link_1Gbps <--> Server_5_5_7.port;
     Switch_5_6_i0.down_port[0] <--> Link_1Gbps <--> Server_5_6_0.port;
     Switch_5_6_i0.down_port[1] <--> Link_1Gbps <--> Server_5_6_1.port;
     Switch_5_6_i0.down_port[2] <--> Link_1Gbps <--> Server_5_6_2.port;
     Switch_5_6_i0.down_port[3] <--> Link_1Gbps <--> Server_5_6_3.port;
     Switch_5_6_i0.down_port[4] <--> Link_1Gbps <--> Server_5_6_4.port;
     Switch_5_6_i0.down_port[5] <--> Link_1Gbps <--> Server_5_6_5.port;
     Switch_5_6_i0.down_port[6] <--> Link_1Gbps <--> Server_5_6_6.port;
     Switch_5_6_i0.down_port[7] <--> Link_1Gbps <--> Server_5_6_7.port;
     Switch_5_7_i0.down_port[0] <--> Link_1Gbps <--> Server_5_7_0.port;
     Switch_5_7_i0.down_port[1] <--> Link_1Gbps <--> Server_5_7_1.port;
     Switch_5_7_i0.down_port[2] <--> Link_1Gbps <--> Server_5_7_2.port;
     Switch_5_7_i0.down_port[3] <--> Link_1Gbps <--> Server_5_7_3.port;
     Switch_5_7_i0.down_port[4] <--> Link_1Gbps <--> Server_5_7_4.port;
     Switch_5_7_i0.down_port[5] <--> Link_1Gbps <--> Server_5_7_5.port;
     Switch_5_7_i0.down_port[6] <--> Link_1Gbps <--> Server_5_7_6.port;
     Switch_5_7_i0.down_port[7] <--> Link_1Gbps <--> Server_5_7_7.port;
     Switch_5_i0.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i0.up_port[0];
     Switch_5_i0.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i0.up_port[0];
     Switch_5_i0.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i0.up_port[0];
     Switch_5_i0.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i0.up_port[0];
     Switch_5_i0.down_port[4] <--> Link_1Gbps <--> Switch_5_4_i0.up_port[0];
     Switch_5_i0.down_port[5] <--> Link_1Gbps <--> Switch_5_5_i0.up_port[0];
     Switch_5_i0.down_port[6] <--> Link_1Gbps <--> Switch_5_6_i0.up_port[0];
     Switch_5_i0.down_port[7] <--> Link_1Gbps <--> Switch_5_7_i0.up_port[0];
     Switch_5_i1.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i0.up_port[1];
     Switch_5_i1.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i0.up_port[1];
     Switch_5_i1.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i0.up_port[1];
     Switch_5_i1.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i0.up_port[1];
     Switch_5_i1.down_port[4] <--> Link_1Gbps <--> Switch_5_4_i0.up_port[1];
     Switch_5_i1.down_port[5] <--> Link_1Gbps <--> Switch_5_5_i0.up_port[1];
     Switch_5_i1.down_port[6] <--> Link_1Gbps <--> Switch_5_6_i0.up_port[1];
     Switch_5_i1.down_port[7] <--> Link_1Gbps <--> Switch_5_7_i0.up_port[1];
     Switch_5_i2.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i0.up_port[2];
     Switch_5_i2.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i0.up_port[2];
     Switch_5_i2.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i0.up_port[2];
     Switch_5_i2.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i0.up_port[2];
     Switch_5_i2.down_port[4] <--> Link_1Gbps <--> Switch_5_4_i0.up_port[2];
     Switch_5_i2.down_port[5] <--> Link_1Gbps <--> Switch_5_5_i0.up_port[2];
     Switch_5_i2.down_port[6] <--> Link_1Gbps <--> Switch_5_6_i0.up_port[2];
     Switch_5_i2.down_port[7] <--> Link_1Gbps <--> Switch_5_7_i0.up_port[2];
     Switch_5_i3.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i0.up_port[3];
     Switch_5_i3.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i0.up_port[3];
     Switch_5_i3.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i0.up_port[3];
     Switch_5_i3.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i0.up_port[3];
     Switch_5_i3.down_port[4] <--> Link_1Gbps <--> Switch_5_4_i0.up_port[3];
     Switch_5_i3.down_port[5] <--> Link_1Gbps <--> Switch_5_5_i0.up_port[3];
     Switch_5_i3.down_port[6] <--> Link_1Gbps <--> Switch_5_6_i0.up_port[3];
     Switch_5_i3.down_port[7] <--> Link_1Gbps <--> Switch_5_7_i0.up_port[3];
     Switch_5_i4.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i0.up_port[4];
     Switch_5_i4.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i0.up_port[4];
     Switch_5_i4.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i0.up_port[4];
     Switch_5_i4.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i0.up_port[4];
     Switch_5_i4.down_port[4] <--> Link_1Gbps <--> Switch_5_4_i0.up_port[4];
     Switch_5_i4.down_port[5] <--> Link_1Gbps <--> Switch_5_5_i0.up_port[4];
     Switch_5_i4.down_port[6] <--> Link_1Gbps <--> Switch_5_6_i0.up_port[4];
     Switch_5_i4.down_port[7] <--> Link_1Gbps <--> Switch_5_7_i0.up_port[4];
     Switch_5_i5.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i0.up_port[5];
     Switch_5_i5.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i0.up_port[5];
     Switch_5_i5.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i0.up_port[5];
     Switch_5_i5.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i0.up_port[5];
     Switch_5_i5.down_port[4] <--> Link_1Gbps <--> Switch_5_4_i0.up_port[5];
     Switch_5_i5.down_port[5] <--> Link_1Gbps <--> Switch_5_5_i0.up_port[5];
     Switch_5_i5.down_port[6] <--> Link_1Gbps <--> Switch_5_6_i0.up_port[5];
     Switch_5_i5.down_port[7] <--> Link_1Gbps <--> Switch_5_7_i0.up_port[5];
     Switch_5_i6.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i0.up_port[6];
     Switch_5_i6.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i0.up_port[6];
     Switch_5_i6.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i0.up_port[6];
     Switch_5_i6.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i0.up_port[6];
     Switch_5_i6.down_port[4] <--> Link_1Gbps <--> Switch_5_4_i0.up_port[6];
     Switch_5_i6.down_port[5] <--> Link_1Gbps <--> Switch_5_5_i0.up_port[6];
     Switch_5_i6.down_port[6] <--> Link_1Gbps <--> Switch_5_6_i0.up_port[6];
     Switch_5_i6.down_port[7] <--> Link_1Gbps <--> Switch_5_7_i0.up_port[6];
     Switch_5_i7.down_port[0] <--> Link_1Gbps <--> Switch_5_0_i0.up_port[7];
     Switch_5_i7.down_port[1] <--> Link_1Gbps <--> Switch_5_1_i0.up_port[7];
     Switch_5_i7.down_port[2] <--> Link_1Gbps <--> Switch_5_2_i0.up_port[7];
     Switch_5_i7.down_port[3] <--> Link_1Gbps <--> Switch_5_3_i0.up_port[7];
     Switch_5_i7.down_port[4] <--> Link_1Gbps <--> Switch_5_4_i0.up_port[7];
     Switch_5_i7.down_port[5] <--> Link_1Gbps <--> Switch_5_5_i0.up_port[7];
     Switch_5_i7.down_port[6] <--> Link_1Gbps <--> Switch_5_6_i0.up_port[7];
     Switch_5_i7.down_port[7] <--> Link_1Gbps <--> Switch_5_7_i0.up_port[7];
     Switch_6_0_i0.down_port[0] <--> Link_1Gbps <--> Server_6_0_0.port;
     Switch_6_0_i0.down_port[1] <--> Link_1Gbps <--> Server_6_0_1.port;
     Switch_6_0_i0.down_port[2] <--> Link_1Gbps <--> Server_6_0_2.port;
     Switch_6_0_i0.down_port[3] <--> Link_1Gbps <--> Server_6_0_3.port;
     Switch_6_0_i0.down_port[4] <--> Link_1Gbps <--> Server_6_0_4.port;
     Switch_6_0_i0.down_port[5] <--> Link_1Gbps <--> Server_6_0_5.port;
     Switch_6_0_i0.down_port[6] <--> Link_1Gbps <--> Server_6_0_6.port;
     Switch_6_0_i0.down_port[7] <--> Link_1Gbps <--> Server_6_0_7.port;
     Switch_6_1_i0.down_port[0] <--> Link_1Gbps <--> Server_6_1_0.port;
     Switch_6_1_i0.down_port[1] <--> Link_1Gbps <--> Server_6_1_1.port;
     Switch_6_1_i0.down_port[2] <--> Link_1Gbps <--> Server_6_1_2.port;
     Switch_6_1_i0.down_port[3] <--> Link_1Gbps <--> Server_6_1_3.port;
     Switch_6_1_i0.down_port[4] <--> Link_1Gbps <--> Server_6_1_4.port;
     Switch_6_1_i0.down_port[5] <--> Link_1Gbps <--> Server_6_1_5.port;
     Switch_6_1_i0.down_port[6] <--> Link_1Gbps <--> Server_6_1_6.port;
     Switch_6_1_i0.down_port[7] <--> Link_1Gbps <--> Server_6_1_7.port;
     Switch_6_2_i0.down_port[0] <--> Link_1Gbps <--> Server_6_2_0.port;
     Switch_6_2_i0.down_port[1] <--> Link_1Gbps <--> Server_6_2_1.port;
     Switch_6_2_i0.down_port[2] <--> Link_1Gbps <--> Server_6_2_2.port;
     Switch_6_2_i0.down_port[3] <--> Link_1Gbps <--> Server_6_2_3.port;
     Switch_6_2_i0.down_port[4] <--> Link_1Gbps <--> Server_6_2_4.port;
     Switch_6_2_i0.down_port[5] <--> Link_1Gbps <--> Server_6_2_5.port;
     Switch_6_2_i0.down_port[6] <--> Link_1Gbps <--> Server_6_2_6.port;
     Switch_6_2_i0.down_port[7] <--> Link_1Gbps <--> Server_6_2_7.port;
     Switch_6_3_i0.down_port[0] <--> Link_1Gbps <--> Server_6_3_0.port;
     Switch_6_3_i0.down_port[1] <--> Link_1Gbps <--> Server_6_3_1.port;
     Switch_6_3_i0.down_port[2] <--> Link_1Gbps <--> Server_6_3_2.port;
     Switch_6_3_i0.down_port[3] <--> Link_1Gbps <--> Server_6_3_3.port;
     Switch_6_3_i0.down_port[4] <--> Link_1Gbps <--> Server_6_3_4.port;
     Switch_6_3_i0.down_port[5] <--> Link_1Gbps <--> Server_6_3_5.port;
     Switch_6_3_i0.down_port[6] <--> Link_1Gbps <--> Server_6_3_6.port;
     Switch_6_3_i0.down_port[7] <--> Link_1Gbps <--> Server_6_3_7.port;
     Switch_6_4_i0.down_port[0] <--> Link_1Gbps <--> Server_6_4_0.port;
     Switch_6_4_i0.down_port[1] <--> Link_1Gbps <--> Server_6_4_1.port;
     Switch_6_4_i0.down_port[2] <--> Link_1Gbps <--> Server_6_4_2.port;
     Switch_6_4_i0.down_port[3] <--> Link_1Gbps <--> Server_6_4_3.port;
     Switch_6_4_i0.down_port[4] <--> Link_1Gbps <--> Server_6_4_4.port;
     Switch_6_4_i0.down_port[5] <--> Link_1Gbps <--> Server_6_4_5.port;
     Switch_6_4_i0.down_port[6] <--> Link_1Gbps <--> Server_6_4_6.port;
     Switch_6_4_i0.down_port[7] <--> Link_1Gbps <--> Server_6_4_7.port;
     Switch_6_5_i0.down_port[0] <--> Link_1Gbps <--> Server_6_5_0.port;
     Switch_6_5_i0.down_port[1] <--> Link_1Gbps <--> Server_6_5_1.port;
     Switch_6_5_i0.down_port[2] <--> Link_1Gbps <--> Server_6_5_2.port;
     Switch_6_5_i0.down_port[3] <--> Link_1Gbps <--> Server_6_5_3.port;
     Switch_6_5_i0.down_port[4] <--> Link_1Gbps <--> Server_6_5_4.port;
     Switch_6_5_i0.down_port[5] <--> Link_1Gbps <--> Server_6_5_5.port;
     Switch_6_5_i0.down_port[6] <--> Link_1Gbps <--> Server_6_5_6.port;
     Switch_6_5_i0.down_port[7] <--> Link_1Gbps <--> Server_6_5_7.port;
     Switch_6_6_i0.down_port[0] <--> Link_1Gbps <--> Server_6_6_0.port;
     Switch_6_6_i0.down_port[1] <--> Link_1Gbps <--> Server_6_6_1.port;
     Switch_6_6_i0.down_port[2] <--> Link_1Gbps <--> Server_6_6_2.port;
     Switch_6_6_i0.down_port[3] <--> Link_1Gbps <--> Server_6_6_3.port;
     Switch_6_6_i0.down_port[4] <--> Link_1Gbps <--> Server_6_6_4.port;
     Switch_6_6_i0.down_port[5] <--> Link_1Gbps <--> Server_6_6_5.port;
     Switch_6_6_i0.down_port[6] <--> Link_1Gbps <--> Server_6_6_6.port;
     Switch_6_6_i0.down_port[7] <--> Link_1Gbps <--> Server_6_6_7.port;
     Switch_6_7_i0.down_port[0] <--> Link_1Gbps <--> Server_6_7_0.port;
     Switch_6_7_i0.down_port[1] <--> Link_1Gbps <--> Server_6_7_1.port;
     Switch_6_7_i0.down_port[2] <--> Link_1Gbps <--> Server_6_7_2.port;
     Switch_6_7_i0.down_port[3] <--> Link_1Gbps <--> Server_6_7_3.port;
     Switch_6_7_i0.down_port[4] <--> Link_1Gbps <--> Server_6_7_4.port;
     Switch_6_7_i0.down_port[5] <--> Link_1Gbps <--> Server_6_7_5.port;
     Switch_6_7_i0.down_port[6] <--> Link_1Gbps <--> Server_6_7_6.port;
     Switch_6_7_i0.down_port[7] <--> Link_1Gbps <--> Server_6_7_7.port;
     Switch_6_i0.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i0.up_port[0];
     Switch_6_i0.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i0.up_port[0];
     Switch_6_i0.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i0.up_port[0];
     Switch_6_i0.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i0.up_port[0];
     Switch_6_i0.down_port[4] <--> Link_1Gbps <--> Switch_6_4_i0.up_port[0];
     Switch_6_i0.down_port[5] <--> Link_1Gbps <--> Switch_6_5_i0.up_port[0];
     Switch_6_i0.down_port[6] <--> Link_1Gbps <--> Switch_6_6_i0.up_port[0];
     Switch_6_i0.down_port[7] <--> Link_1Gbps <--> Switch_6_7_i0.up_port[0];
     Switch_6_i1.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i0.up_port[1];
     Switch_6_i1.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i0.up_port[1];
     Switch_6_i1.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i0.up_port[1];
     Switch_6_i1.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i0.up_port[1];
     Switch_6_i1.down_port[4] <--> Link_1Gbps <--> Switch_6_4_i0.up_port[1];
     Switch_6_i1.down_port[5] <--> Link_1Gbps <--> Switch_6_5_i0.up_port[1];
     Switch_6_i1.down_port[6] <--> Link_1Gbps <--> Switch_6_6_i0.up_port[1];
     Switch_6_i1.down_port[7] <--> Link_1Gbps <--> Switch_6_7_i0.up_port[1];
     Switch_6_i2.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i0.up_port[2];
     Switch_6_i2.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i0.up_port[2];
     Switch_6_i2.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i0.up_port[2];
     Switch_6_i2.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i0.up_port[2];
     Switch_6_i2.down_port[4] <--> Link_1Gbps <--> Switch_6_4_i0.up_port[2];
     Switch_6_i2.down_port[5] <--> Link_1Gbps <--> Switch_6_5_i0.up_port[2];
     Switch_6_i2.down_port[6] <--> Link_1Gbps <--> Switch_6_6_i0.up_port[2];
     Switch_6_i2.down_port[7] <--> Link_1Gbps <--> Switch_6_7_i0.up_port[2];
     Switch_6_i3.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i0.up_port[3];
     Switch_6_i3.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i0.up_port[3];
     Switch_6_i3.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i0.up_port[3];
     Switch_6_i3.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i0.up_port[3];
     Switch_6_i3.down_port[4] <--> Link_1Gbps <--> Switch_6_4_i0.up_port[3];
     Switch_6_i3.down_port[5] <--> Link_1Gbps <--> Switch_6_5_i0.up_port[3];
     Switch_6_i3.down_port[6] <--> Link_1Gbps <--> Switch_6_6_i0.up_port[3];
     Switch_6_i3.down_port[7] <--> Link_1Gbps <--> Switch_6_7_i0.up_port[3];
     Switch_6_i4.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i0.up_port[4];
     Switch_6_i4.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i0.up_port[4];
     Switch_6_i4.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i0.up_port[4];
     Switch_6_i4.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i0.up_port[4];
     Switch_6_i4.down_port[4] <--> Link_1Gbps <--> Switch_6_4_i0.up_port[4];
     Switch_6_i4.down_port[5] <--> Link_1Gbps <--> Switch_6_5_i0.up_port[4];
     Switch_6_i4.down_port[6] <--> Link_1Gbps <--> Switch_6_6_i0.up_port[4];
     Switch_6_i4.down_port[7] <--> Link_1Gbps <--> Switch_6_7_i0.up_port[4];
     Switch_6_i5.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i0.up_port[5];
     Switch_6_i5.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i0.up_port[5];
     Switch_6_i5.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i0.up_port[5];
     Switch_6_i5.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i0.up_port[5];
     Switch_6_i5.down_port[4] <--> Link_1Gbps <--> Switch_6_4_i0.up_port[5];
     Switch_6_i5.down_port[5] <--> Link_1Gbps <--> Switch_6_5_i0.up_port[5];
     Switch_6_i5.down_port[6] <--> Link_1Gbps <--> Switch_6_6_i0.up_port[5];
     Switch_6_i5.down_port[7] <--> Link_1Gbps <--> Switch_6_7_i0.up_port[5];
     Switch_6_i6.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i0.up_port[6];
     Switch_6_i6.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i0.up_port[6];
     Switch_6_i6.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i0.up_port[6];
     Switch_6_i6.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i0.up_port[6];
     Switch_6_i6.down_port[4] <--> Link_1Gbps <--> Switch_6_4_i0.up_port[6];
     Switch_6_i6.down_port[5] <--> Link_1Gbps <--> Switch_6_5_i0.up_port[6];
     Switch_6_i6.down_port[6] <--> Link_1Gbps <--> Switch_6_6_i0.up_port[6];
     Switch_6_i6.down_port[7] <--> Link_1Gbps <--> Switch_6_7_i0.up_port[6];
     Switch_6_i7.down_port[0] <--> Link_1Gbps <--> Switch_6_0_i0.up_port[7];
     Switch_6_i7.down_port[1] <--> Link_1Gbps <--> Switch_6_1_i0.up_port[7];
     Switch_6_i7.down_port[2] <--> Link_1Gbps <--> Switch_6_2_i0.up_port[7];
     Switch_6_i7.down_port[3] <--> Link_1Gbps <--> Switch_6_3_i0.up_port[7];
     Switch_6_i7.down_port[4] <--> Link_1Gbps <--> Switch_6_4_i0.up_port[7];
     Switch_6_i7.down_port[5] <--> Link_1Gbps <--> Switch_6_5_i0.up_port[7];
     Switch_6_i7.down_port[6] <--> Link_1Gbps <--> Switch_6_6_i0.up_port[7];
     Switch_6_i7.down_port[7] <--> Link_1Gbps <--> Switch_6_7_i0.up_port[7];
     Switch_7_0_i0.down_port[0] <--> Link_1Gbps <--> Server_7_0_0.port;
     Switch_7_0_i0.down_port[1] <--> Link_1Gbps <--> Server_7_0_1.port;
     Switch_7_0_i0.down_port[2] <--> Link_1Gbps <--> Server_7_0_2.port;
     Switch_7_0_i0.down_port[3] <--> Link_1Gbps <--> Server_7_0_3.port;
     Switch_7_0_i0.down_port[4] <--> Link_1Gbps <--> Server_7_0_4.port;
     Switch_7_0_i0.down_port[5] <--> Link_1Gbps <--> Server_7_0_5.port;
     Switch_7_0_i0.down_port[6] <--> Link_1Gbps <--> Server_7_0_6.port;
     Switch_7_0_i0.down_port[7] <--> Link_1Gbps <--> Server_7_0_7.port;
     Switch_7_1_i0.down_port[0] <--> Link_1Gbps <--> Server_7_1_0.port;
     Switch_7_1_i0.down_port[1] <--> Link_1Gbps <--> Server_7_1_1.port;
     Switch_7_1_i0.down_port[2] <--> Link_1Gbps <--> Server_7_1_2.port;
     Switch_7_1_i0.down_port[3] <--> Link_1Gbps <--> Server_7_1_3.port;
     Switch_7_1_i0.down_port[4] <--> Link_1Gbps <--> Server_7_1_4.port;
     Switch_7_1_i0.down_port[5] <--> Link_1Gbps <--> Server_7_1_5.port;
     Switch_7_1_i0.down_port[6] <--> Link_1Gbps <--> Server_7_1_6.port;
     Switch_7_1_i0.down_port[7] <--> Link_1Gbps <--> Server_7_1_7.port;
     Switch_7_2_i0.down_port[0] <--> Link_1Gbps <--> Server_7_2_0.port;
     Switch_7_2_i0.down_port[1] <--> Link_1Gbps <--> Server_7_2_1.port;
     Switch_7_2_i0.down_port[2] <--> Link_1Gbps <--> Server_7_2_2.port;
     Switch_7_2_i0.down_port[3] <--> Link_1Gbps <--> Server_7_2_3.port;
     Switch_7_2_i0.down_port[4] <--> Link_1Gbps <--> Server_7_2_4.port;
     Switch_7_2_i0.down_port[5] <--> Link_1Gbps <--> Server_7_2_5.port;
     Switch_7_2_i0.down_port[6] <--> Link_1Gbps <--> Server_7_2_6.port;
     Switch_7_2_i0.down_port[7] <--> Link_1Gbps <--> Server_7_2_7.port;
     Switch_7_3_i0.down_port[0] <--> Link_1Gbps <--> Server_7_3_0.port;
     Switch_7_3_i0.down_port[1] <--> Link_1Gbps <--> Server_7_3_1.port;
     Switch_7_3_i0.down_port[2] <--> Link_1Gbps <--> Server_7_3_2.port;
     Switch_7_3_i0.down_port[3] <--> Link_1Gbps <--> Server_7_3_3.port;
     Switch_7_3_i0.down_port[4] <--> Link_1Gbps <--> Server_7_3_4.port;
     Switch_7_3_i0.down_port[5] <--> Link_1Gbps <--> Server_7_3_5.port;
     Switch_7_3_i0.down_port[6] <--> Link_1Gbps <--> Server_7_3_6.port;
     Switch_7_3_i0.down_port[7] <--> Link_1Gbps <--> Server_7_3_7.port;
     Switch_7_4_i0.down_port[0] <--> Link_1Gbps <--> Server_7_4_0.port;
     Switch_7_4_i0.down_port[1] <--> Link_1Gbps <--> Server_7_4_1.port;
     Switch_7_4_i0.down_port[2] <--> Link_1Gbps <--> Server_7_4_2.port;
     Switch_7_4_i0.down_port[3] <--> Link_1Gbps <--> Server_7_4_3.port;
     Switch_7_4_i0.down_port[4] <--> Link_1Gbps <--> Server_7_4_4.port;
     Switch_7_4_i0.down_port[5] <--> Link_1Gbps <--> Server_7_4_5.port;
     Switch_7_4_i0.down_port[6] <--> Link_1Gbps <--> Server_7_4_6.port;
     Switch_7_4_i0.down_port[7] <--> Link_1Gbps <--> Server_7_4_7.port;
     Switch_7_5_i0.down_port[0] <--> Link_1Gbps <--> Server_7_5_0.port;
     Switch_7_5_i0.down_port[1] <--> Link_1Gbps <--> Server_7_5_1.port;
     Switch_7_5_i0.down_port[2] <--> Link_1Gbps <--> Server_7_5_2.port;
     Switch_7_5_i0.down_port[3] <--> Link_1Gbps <--> Server_7_5_3.port;
     Switch_7_5_i0.down_port[4] <--> Link_1Gbps <--> Server_7_5_4.port;
     Switch_7_5_i0.down_port[5] <--> Link_1Gbps <--> Server_7_5_5.port;
     Switch_7_5_i0.down_port[6] <--> Link_1Gbps <--> Server_7_5_6.port;
     Switch_7_5_i0.down_port[7] <--> Link_1Gbps <--> Server_7_5_7.port;
     Switch_7_6_i0.down_port[0] <--> Link_1Gbps <--> Server_7_6_0.port;
     Switch_7_6_i0.down_port[1] <--> Link_1Gbps <--> Server_7_6_1.port;
     Switch_7_6_i0.down_port[2] <--> Link_1Gbps <--> Server_7_6_2.port;
     Switch_7_6_i0.down_port[3] <--> Link_1Gbps <--> Server_7_6_3.port;
     Switch_7_6_i0.down_port[4] <--> Link_1Gbps <--> Server_7_6_4.port;
     Switch_7_6_i0.down_port[5] <--> Link_1Gbps <--> Server_7_6_5.port;
     Switch_7_6_i0.down_port[6] <--> Link_1Gbps <--> Server_7_6_6.port;
     Switch_7_6_i0.down_port[7] <--> Link_1Gbps <--> Server_7_6_7.port;
     Switch_7_7_i0.down_port[0] <--> Link_1Gbps <--> Server_7_7_0.port;
     Switch_7_7_i0.down_port[1] <--> Link_1Gbps <--> Server_7_7_1.port;
     Switch_7_7_i0.down_port[2] <--> Link_1Gbps <--> Server_7_7_2.port;
     Switch_7_7_i0.down_port[3] <--> Link_1Gbps <--> Server_7_7_3.port;
     Switch_7_7_i0.down_port[4] <--> Link_1Gbps <--> Server_7_7_4.port;
     Switch_7_7_i0.down_port[5] <--> Link_1Gbps <--> Server_7_7_5.port;
     Switch_7_7_i0.down_port[6] <--> Link_1Gbps <--> Server_7_7_6.port;
     Switch_7_7_i0.down_port[7] <--> Link_1Gbps <--> Server_7_7_7.port;
     Switch_7_i0.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i0.up_port[0];
     Switch_7_i0.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i0.up_port[0];
     Switch_7_i0.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i0.up_port[0];
     Switch_7_i0.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i0.up_port[0];
     Switch_7_i0.down_port[4] <--> Link_1Gbps <--> Switch_7_4_i0.up_port[0];
     Switch_7_i0.down_port[5] <--> Link_1Gbps <--> Switch_7_5_i0.up_port[0];
     Switch_7_i0.down_port[6] <--> Link_1Gbps <--> Switch_7_6_i0.up_port[0];
     Switch_7_i0.down_port[7] <--> Link_1Gbps <--> Switch_7_7_i0.up_port[0];
     Switch_7_i1.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i0.up_port[1];
     Switch_7_i1.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i0.up_port[1];
     Switch_7_i1.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i0.up_port[1];
     Switch_7_i1.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i0.up_port[1];
     Switch_7_i1.down_port[4] <--> Link_1Gbps <--> Switch_7_4_i0.up_port[1];
     Switch_7_i1.down_port[5] <--> Link_1Gbps <--> Switch_7_5_i0.up_port[1];
     Switch_7_i1.down_port[6] <--> Link_1Gbps <--> Switch_7_6_i0.up_port[1];
     Switch_7_i1.down_port[7] <--> Link_1Gbps <--> Switch_7_7_i0.up_port[1];
     Switch_7_i2.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i0.up_port[2];
     Switch_7_i2.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i0.up_port[2];
     Switch_7_i2.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i0.up_port[2];
     Switch_7_i2.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i0.up_port[2];
     Switch_7_i2.down_port[4] <--> Link_1Gbps <--> Switch_7_4_i0.up_port[2];
     Switch_7_i2.down_port[5] <--> Link_1Gbps <--> Switch_7_5_i0.up_port[2];
     Switch_7_i2.down_port[6] <--> Link_1Gbps <--> Switch_7_6_i0.up_port[2];
     Switch_7_i2.down_port[7] <--> Link_1Gbps <--> Switch_7_7_i0.up_port[2];
     Switch_7_i3.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i0.up_port[3];
     Switch_7_i3.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i0.up_port[3];
     Switch_7_i3.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i0.up_port[3];
     Switch_7_i3.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i0.up_port[3];
     Switch_7_i3.down_port[4] <--> Link_1Gbps <--> Switch_7_4_i0.up_port[3];
     Switch_7_i3.down_port[5] <--> Link_1Gbps <--> Switch_7_5_i0.up_port[3];
     Switch_7_i3.down_port[6] <--> Link_1Gbps <--> Switch_7_6_i0.up_port[3];
     Switch_7_i3.down_port[7] <--> Link_1Gbps <--> Switch_7_7_i0.up_port[3];
     Switch_7_i4.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i0.up_port[4];
     Switch_7_i4.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i0.up_port[4];
     Switch_7_i4.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i0.up_port[4];
     Switch_7_i4.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i0.up_port[4];
     Switch_7_i4.down_port[4] <--> Link_1Gbps <--> Switch_7_4_i0.up_port[4];
     Switch_7_i4.down_port[5] <--> Link_1Gbps <--> Switch_7_5_i0.up_port[4];
     Switch_7_i4.down_port[6] <--> Link_1Gbps <--> Switch_7_6_i0.up_port[4];
     Switch_7_i4.down_port[7] <--> Link_1Gbps <--> Switch_7_7_i0.up_port[4];
     Switch_7_i5.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i0.up_port[5];
     Switch_7_i5.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i0.up_port[5];
     Switch_7_i5.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i0.up_port[5];
     Switch_7_i5.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i0.up_port[5];
     Switch_7_i5.down_port[4] <--> Link_1Gbps <--> Switch_7_4_i0.up_port[5];
     Switch_7_i5.down_port[5] <--> Link_1Gbps <--> Switch_7_5_i0.up_port[5];
     Switch_7_i5.down_port[6] <--> Link_1Gbps <--> Switch_7_6_i0.up_port[5];
     Switch_7_i5.down_port[7] <--> Link_1Gbps <--> Switch_7_7_i0.up_port[5];
     Switch_7_i6.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i0.up_port[6];
     Switch_7_i6.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i0.up_port[6];
     Switch_7_i6.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i0.up_port[6];
     Switch_7_i6.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i0.up_port[6];
     Switch_7_i6.down_port[4] <--> Link_1Gbps <--> Switch_7_4_i0.up_port[6];
     Switch_7_i6.down_port[5] <--> Link_1Gbps <--> Switch_7_5_i0.up_port[6];
     Switch_7_i6.down_port[6] <--> Link_1Gbps <--> Switch_7_6_i0.up_port[6];
     Switch_7_i6.down_port[7] <--> Link_1Gbps <--> Switch_7_7_i0.up_port[6];
     Switch_7_i7.down_port[0] <--> Link_1Gbps <--> Switch_7_0_i0.up_port[7];
     Switch_7_i7.down_port[1] <--> Link_1Gbps <--> Switch_7_1_i0.up_port[7];
     Switch_7_i7.down_port[2] <--> Link_1Gbps <--> Switch_7_2_i0.up_port[7];
     Switch_7_i7.down_port[3] <--> Link_1Gbps <--> Switch_7_3_i0.up_port[7];
     Switch_7_i7.down_port[4] <--> Link_1Gbps <--> Switch_7_4_i0.up_port[7];
     Switch_7_i7.down_port[5] <--> Link_1Gbps <--> Switch_7_5_i0.up_port[7];
     Switch_7_i7.down_port[6] <--> Link_1Gbps <--> Switch_7_6_i0.up_port[7];
     Switch_7_i7.down_port[7] <--> Link_1Gbps <--> Switch_7_7_i0.up_port[7];
     Switch_8_0_i0.down_port[0] <--> Link_1Gbps <--> Server_8_0_0.port;
     Switch_8_0_i0.down_port[1] <--> Link_1Gbps <--> Server_8_0_1.port;
     Switch_8_0_i0.down_port[2] <--> Link_1Gbps <--> Server_8_0_2.port;
     Switch_8_0_i0.down_port[3] <--> Link_1Gbps <--> Server_8_0_3.port;
     Switch_8_0_i0.down_port[4] <--> Link_1Gbps <--> Server_8_0_4.port;
     Switch_8_0_i0.down_port[5] <--> Link_1Gbps <--> Server_8_0_5.port;
     Switch_8_0_i0.down_port[6] <--> Link_1Gbps <--> Server_8_0_6.port;
     Switch_8_0_i0.down_port[7] <--> Link_1Gbps <--> Server_8_0_7.port;
     Switch_8_1_i0.down_port[0] <--> Link_1Gbps <--> Server_8_1_0.port;
     Switch_8_1_i0.down_port[1] <--> Link_1Gbps <--> Server_8_1_1.port;
     Switch_8_1_i0.down_port[2] <--> Link_1Gbps <--> Server_8_1_2.port;
     Switch_8_1_i0.down_port[3] <--> Link_1Gbps <--> Server_8_1_3.port;
     Switch_8_1_i0.down_port[4] <--> Link_1Gbps <--> Server_8_1_4.port;
     Switch_8_1_i0.down_port[5] <--> Link_1Gbps <--> Server_8_1_5.port;
     Switch_8_1_i0.down_port[6] <--> Link_1Gbps <--> Server_8_1_6.port;
     Switch_8_1_i0.down_port[7] <--> Link_1Gbps <--> Server_8_1_7.port;
     Switch_8_2_i0.down_port[0] <--> Link_1Gbps <--> Server_8_2_0.port;
     Switch_8_2_i0.down_port[1] <--> Link_1Gbps <--> Server_8_2_1.port;
     Switch_8_2_i0.down_port[2] <--> Link_1Gbps <--> Server_8_2_2.port;
     Switch_8_2_i0.down_port[3] <--> Link_1Gbps <--> Server_8_2_3.port;
     Switch_8_2_i0.down_port[4] <--> Link_1Gbps <--> Server_8_2_4.port;
     Switch_8_2_i0.down_port[5] <--> Link_1Gbps <--> Server_8_2_5.port;
     Switch_8_2_i0.down_port[6] <--> Link_1Gbps <--> Server_8_2_6.port;
     Switch_8_2_i0.down_port[7] <--> Link_1Gbps <--> Server_8_2_7.port;
     Switch_8_3_i0.down_port[0] <--> Link_1Gbps <--> Server_8_3_0.port;
     Switch_8_3_i0.down_port[1] <--> Link_1Gbps <--> Server_8_3_1.port;
     Switch_8_3_i0.down_port[2] <--> Link_1Gbps <--> Server_8_3_2.port;
     Switch_8_3_i0.down_port[3] <--> Link_1Gbps <--> Server_8_3_3.port;
     Switch_8_3_i0.down_port[4] <--> Link_1Gbps <--> Server_8_3_4.port;
     Switch_8_3_i0.down_port[5] <--> Link_1Gbps <--> Server_8_3_5.port;
     Switch_8_3_i0.down_port[6] <--> Link_1Gbps <--> Server_8_3_6.port;
     Switch_8_3_i0.down_port[7] <--> Link_1Gbps <--> Server_8_3_7.port;
     Switch_8_4_i0.down_port[0] <--> Link_1Gbps <--> Server_8_4_0.port;
     Switch_8_4_i0.down_port[1] <--> Link_1Gbps <--> Server_8_4_1.port;
     Switch_8_4_i0.down_port[2] <--> Link_1Gbps <--> Server_8_4_2.port;
     Switch_8_4_i0.down_port[3] <--> Link_1Gbps <--> Server_8_4_3.port;
     Switch_8_4_i0.down_port[4] <--> Link_1Gbps <--> Server_8_4_4.port;
     Switch_8_4_i0.down_port[5] <--> Link_1Gbps <--> Server_8_4_5.port;
     Switch_8_4_i0.down_port[6] <--> Link_1Gbps <--> Server_8_4_6.port;
     Switch_8_4_i0.down_port[7] <--> Link_1Gbps <--> Server_8_4_7.port;
     Switch_8_5_i0.down_port[0] <--> Link_1Gbps <--> Server_8_5_0.port;
     Switch_8_5_i0.down_port[1] <--> Link_1Gbps <--> Server_8_5_1.port;
     Switch_8_5_i0.down_port[2] <--> Link_1Gbps <--> Server_8_5_2.port;
     Switch_8_5_i0.down_port[3] <--> Link_1Gbps <--> Server_8_5_3.port;
     Switch_8_5_i0.down_port[4] <--> Link_1Gbps <--> Server_8_5_4.port;
     Switch_8_5_i0.down_port[5] <--> Link_1Gbps <--> Server_8_5_5.port;
     Switch_8_5_i0.down_port[6] <--> Link_1Gbps <--> Server_8_5_6.port;
     Switch_8_5_i0.down_port[7] <--> Link_1Gbps <--> Server_8_5_7.port;
     Switch_8_6_i0.down_port[0] <--> Link_1Gbps <--> Server_8_6_0.port;
     Switch_8_6_i0.down_port[1] <--> Link_1Gbps <--> Server_8_6_1.port;
     Switch_8_6_i0.down_port[2] <--> Link_1Gbps <--> Server_8_6_2.port;
     Switch_8_6_i0.down_port[3] <--> Link_1Gbps <--> Server_8_6_3.port;
     Switch_8_6_i0.down_port[4] <--> Link_1Gbps <--> Server_8_6_4.port;
     Switch_8_6_i0.down_port[5] <--> Link_1Gbps <--> Server_8_6_5.port;
     Switch_8_6_i0.down_port[6] <--> Link_1Gbps <--> Server_8_6_6.port;
     Switch_8_6_i0.down_port[7] <--> Link_1Gbps <--> Server_8_6_7.port;
     Switch_8_7_i0.down_port[0] <--> Link_1Gbps <--> Server_8_7_0.port;
     Switch_8_7_i0.down_port[1] <--> Link_1Gbps <--> Server_8_7_1.port;
     Switch_8_7_i0.down_port[2] <--> Link_1Gbps <--> Server_8_7_2.port;
     Switch_8_7_i0.down_port[3] <--> Link_1Gbps <--> Server_8_7_3.port;
     Switch_8_7_i0.down_port[4] <--> Link_1Gbps <--> Server_8_7_4.port;
     Switch_8_7_i0.down_port[5] <--> Link_1Gbps <--> Server_8_7_5.port;
     Switch_8_7_i0.down_port[6] <--> Link_1Gbps <--> Server_8_7_6.port;
     Switch_8_7_i0.down_port[7] <--> Link_1Gbps <--> Server_8_7_7.port;
     Switch_8_i0.down_port[0] <--> Link_1Gbps <--> Switch_8_0_i0.up_port[0];
     Switch_8_i0.down_port[1] <--> Link_1Gbps <--> Switch_8_1_i0.up_port[0];
     Switch_8_i0.down_port[2] <--> Link_1Gbps <--> Switch_8_2_i0.up_port[0];
     Switch_8_i0.down_port[3] <--> Link_1Gbps <--> Switch_8_3_i0.up_port[0];
     Switch_8_i0.down_port[4] <--> Link_1Gbps <--> Switch_8_4_i0.up_port[0];
     Switch_8_i0.down_port[5] <--> Link_1Gbps <--> Switch_8_5_i0.up_port[0];
     Switch_8_i0.down_port[6] <--> Link_1Gbps <--> Switch_8_6_i0.up_port[0];
     Switch_8_i0.down_port[7] <--> Link_1Gbps <--> Switch_8_7_i0.up_port[0];
     Switch_8_i1.down_port[0] <--> Link_1Gbps <--> Switch_8_0_i0.up_port[1];
     Switch_8_i1.down_port[1] <--> Link_1Gbps <--> Switch_8_1_i0.up_port[1];
     Switch_8_i1.down_port[2] <--> Link_1Gbps <--> Switch_8_2_i0.up_port[1];
     Switch_8_i1.down_port[3] <--> Link_1Gbps <--> Switch_8_3_i0.up_port[1];
     Switch_8_i1.down_port[4] <--> Link_1Gbps <--> Switch_8_4_i0.up_port[1];
     Switch_8_i1.down_port[5] <--> Link_1Gbps <--> Switch_8_5_i0.up_port[1];
     Switch_8_i1.down_port[6] <--> Link_1Gbps <--> Switch_8_6_i0.up_port[1];
     Switch_8_i1.down_port[7] <--> Link_1Gbps <--> Switch_8_7_i0.up_port[1];
     Switch_8_i2.down_port[0] <--> Link_1Gbps <--> Switch_8_0_i0.up_port[2];
     Switch_8_i2.down_port[1] <--> Link_1Gbps <--> Switch_8_1_i0.up_port[2];
     Switch_8_i2.down_port[2] <--> Link_1Gbps <--> Switch_8_2_i0.up_port[2];
     Switch_8_i2.down_port[3] <--> Link_1Gbps <--> Switch_8_3_i0.up_port[2];
     Switch_8_i2.down_port[4] <--> Link_1Gbps <--> Switch_8_4_i0.up_port[2];
     Switch_8_i2.down_port[5] <--> Link_1Gbps <--> Switch_8_5_i0.up_port[2];
     Switch_8_i2.down_port[6] <--> Link_1Gbps <--> Switch_8_6_i0.up_port[2];
     Switch_8_i2.down_port[7] <--> Link_1Gbps <--> Switch_8_7_i0.up_port[2];
     Switch_8_i3.down_port[0] <--> Link_1Gbps <--> Switch_8_0_i0.up_port[3];
     Switch_8_i3.down_port[1] <--> Link_1Gbps <--> Switch_8_1_i0.up_port[3];
     Switch_8_i3.down_port[2] <--> Link_1Gbps <--> Switch_8_2_i0.up_port[3];
     Switch_8_i3.down_port[3] <--> Link_1Gbps <--> Switch_8_3_i0.up_port[3];
     Switch_8_i3.down_port[4] <--> Link_1Gbps <--> Switch_8_4_i0.up_port[3];
     Switch_8_i3.down_port[5] <--> Link_1Gbps <--> Switch_8_5_i0.up_port[3];
     Switch_8_i3.down_port[6] <--> Link_1Gbps <--> Switch_8_6_i0.up_port[3];
     Switch_8_i3.down_port[7] <--> Link_1Gbps <--> Switch_8_7_i0.up_port[3];
     Switch_8_i4.down_port[0] <--> Link_1Gbps <--> Switch_8_0_i0.up_port[4];
     Switch_8_i4.down_port[1] <--> Link_1Gbps <--> Switch_8_1_i0.up_port[4];
     Switch_8_i4.down_port[2] <--> Link_1Gbps <--> Switch_8_2_i0.up_port[4];
     Switch_8_i4.down_port[3] <--> Link_1Gbps <--> Switch_8_3_i0.up_port[4];
     Switch_8_i4.down_port[4] <--> Link_1Gbps <--> Switch_8_4_i0.up_port[4];
     Switch_8_i4.down_port[5] <--> Link_1Gbps <--> Switch_8_5_i0.up_port[4];
     Switch_8_i4.down_port[6] <--> Link_1Gbps <--> Switch_8_6_i0.up_port[4];
     Switch_8_i4.down_port[7] <--> Link_1Gbps <--> Switch_8_7_i0.up_port[4];
     Switch_8_i5.down_port[0] <--> Link_1Gbps <--> Switch_8_0_i0.up_port[5];
     Switch_8_i5.down_port[1] <--> Link_1Gbps <--> Switch_8_1_i0.up_port[5];
     Switch_8_i5.down_port[2] <--> Link_1Gbps <--> Switch_8_2_i0.up_port[5];
     Switch_8_i5.down_port[3] <--> Link_1Gbps <--> Switch_8_3_i0.up_port[5];
     Switch_8_i5.down_port[4] <--> Link_1Gbps <--> Switch_8_4_i0.up_port[5];
     Switch_8_i5.down_port[5] <--> Link_1Gbps <--> Switch_8_5_i0.up_port[5];
     Switch_8_i5.down_port[6] <--> Link_1Gbps <--> Switch_8_6_i0.up_port[5];
     Switch_8_i5.down_port[7] <--> Link_1Gbps <--> Switch_8_7_i0.up_port[5];
     Switch_8_i6.down_port[0] <--> Link_1Gbps <--> Switch_8_0_i0.up_port[6];
     Switch_8_i6.down_port[1] <--> Link_1Gbps <--> Switch_8_1_i0.up_port[6];
     Switch_8_i6.down_port[2] <--> Link_1Gbps <--> Switch_8_2_i0.up_port[6];
     Switch_8_i6.down_port[3] <--> Link_1Gbps <--> Switch_8_3_i0.up_port[6];
     Switch_8_i6.down_port[4] <--> Link_1Gbps <--> Switch_8_4_i0.up_port[6];
     Switch_8_i6.down_port[5] <--> Link_1Gbps <--> Switch_8_5_i0.up_port[6];
     Switch_8_i6.down_port[6] <--> Link_1Gbps <--> Switch_8_6_i0.up_port[6];
     Switch_8_i6.down_port[7] <--> Link_1Gbps <--> Switch_8_7_i0.up_port[6];
     Switch_8_i7.down_port[0] <--> Link_1Gbps <--> Switch_8_0_i0.up_port[7];
     Switch_8_i7.down_port[1] <--> Link_1Gbps <--> Switch_8_1_i0.up_port[7];
     Switch_8_i7.down_port[2] <--> Link_1Gbps <--> Switch_8_2_i0.up_port[7];
     Switch_8_i7.down_port[3] <--> Link_1Gbps <--> Switch_8_3_i0.up_port[7];
     Switch_8_i7.down_port[4] <--> Link_1Gbps <--> Switch_8_4_i0.up_port[7];
     Switch_8_i7.down_port[5] <--> Link_1Gbps <--> Switch_8_5_i0.up_port[7];
     Switch_8_i7.down_port[6] <--> Link_1Gbps <--> Switch_8_6_i0.up_port[7];
     Switch_8_i7.down_port[7] <--> Link_1Gbps <--> Switch_8_7_i0.up_port[7];
     Switch_9_0_i0.down_port[0] <--> Link_1Gbps <--> Server_9_0_0.port;
     Switch_9_0_i0.down_port[1] <--> Link_1Gbps <--> Server_9_0_1.port;
     Switch_9_0_i0.down_port[2] <--> Link_1Gbps <--> Server_9_0_2.port;
     Switch_9_0_i0.down_port[3] <--> Link_1Gbps <--> Server_9_0_3.port;
     Switch_9_0_i0.down_port[4] <--> Link_1Gbps <--> Server_9_0_4.port;
     Switch_9_0_i0.down_port[5] <--> Link_1Gbps <--> Server_9_0_5.port;
     Switch_9_0_i0.down_port[6] <--> Link_1Gbps <--> Server_9_0_6.port;
     Switch_9_0_i0.down_port[7] <--> Link_1Gbps <--> Server_9_0_7.port;
     Switch_9_1_i0.down_port[0] <--> Link_1Gbps <--> Server_9_1_0.port;
     Switch_9_1_i0.down_port[1] <--> Link_1Gbps <--> Server_9_1_1.port;
     Switch_9_1_i0.down_port[2] <--> Link_1Gbps <--> Server_9_1_2.port;
     Switch_9_1_i0.down_port[3] <--> Link_1Gbps <--> Server_9_1_3.port;
     Switch_9_1_i0.down_port[4] <--> Link_1Gbps <--> Server_9_1_4.port;
     Switch_9_1_i0.down_port[5] <--> Link_1Gbps <--> Server_9_1_5.port;
     Switch_9_1_i0.down_port[6] <--> Link_1Gbps <--> Server_9_1_6.port;
     Switch_9_1_i0.down_port[7] <--> Link_1Gbps <--> Server_9_1_7.port;
     Switch_9_2_i0.down_port[0] <--> Link_1Gbps <--> Server_9_2_0.port;
     Switch_9_2_i0.down_port[1] <--> Link_1Gbps <--> Server_9_2_1.port;
     Switch_9_2_i0.down_port[2] <--> Link_1Gbps <--> Server_9_2_2.port;
     Switch_9_2_i0.down_port[3] <--> Link_1Gbps <--> Server_9_2_3.port;
     Switch_9_2_i0.down_port[4] <--> Link_1Gbps <--> Server_9_2_4.port;
     Switch_9_2_i0.down_port[5] <--> Link_1Gbps <--> Server_9_2_5.port;
     Switch_9_2_i0.down_port[6] <--> Link_1Gbps <--> Server_9_2_6.port;
     Switch_9_2_i0.down_port[7] <--> Link_1Gbps <--> Server_9_2_7.port;
     Switch_9_3_i0.down_port[0] <--> Link_1Gbps <--> Server_9_3_0.port;
     Switch_9_3_i0.down_port[1] <--> Link_1Gbps <--> Server_9_3_1.port;
     Switch_9_3_i0.down_port[2] <--> Link_1Gbps <--> Server_9_3_2.port;
     Switch_9_3_i0.down_port[3] <--> Link_1Gbps <--> Server_9_3_3.port;
     Switch_9_3_i0.down_port[4] <--> Link_1Gbps <--> Server_9_3_4.port;
     Switch_9_3_i0.down_port[5] <--> Link_1Gbps <--> Server_9_3_5.port;
     Switch_9_3_i0.down_port[6] <--> Link_1Gbps <--> Server_9_3_6.port;
     Switch_9_3_i0.down_port[7] <--> Link_1Gbps <--> Server_9_3_7.port;
     Switch_9_4_i0.down_port[0] <--> Link_1Gbps <--> Server_9_4_0.port;
     Switch_9_4_i0.down_port[1] <--> Link_1Gbps <--> Server_9_4_1.port;
     Switch_9_4_i0.down_port[2] <--> Link_1Gbps <--> Server_9_4_2.port;
     Switch_9_4_i0.down_port[3] <--> Link_1Gbps <--> Server_9_4_3.port;
     Switch_9_4_i0.down_port[4] <--> Link_1Gbps <--> Server_9_4_4.port;
     Switch_9_4_i0.down_port[5] <--> Link_1Gbps <--> Server_9_4_5.port;
     Switch_9_4_i0.down_port[6] <--> Link_1Gbps <--> Server_9_4_6.port;
     Switch_9_4_i0.down_port[7] <--> Link_1Gbps <--> Server_9_4_7.port;
     Switch_9_5_i0.down_port[0] <--> Link_1Gbps <--> Server_9_5_0.port;
     Switch_9_5_i0.down_port[1] <--> Link_1Gbps <--> Server_9_5_1.port;
     Switch_9_5_i0.down_port[2] <--> Link_1Gbps <--> Server_9_5_2.port;
     Switch_9_5_i0.down_port[3] <--> Link_1Gbps <--> Server_9_5_3.port;
     Switch_9_5_i0.down_port[4] <--> Link_1Gbps <--> Server_9_5_4.port;
     Switch_9_5_i0.down_port[5] <--> Link_1Gbps <--> Server_9_5_5.port;
     Switch_9_5_i0.down_port[6] <--> Link_1Gbps <--> Server_9_5_6.port;
     Switch_9_5_i0.down_port[7] <--> Link_1Gbps <--> Server_9_5_7.port;
     Switch_9_6_i0.down_port[0] <--> Link_1Gbps <--> Server_9_6_0.port;
     Switch_9_6_i0.down_port[1] <--> Link_1Gbps <--> Server_9_6_1.port;
     Switch_9_6_i0.down_port[2] <--> Link_1Gbps <--> Server_9_6_2.port;
     Switch_9_6_i0.down_port[3] <--> Link_1Gbps <--> Server_9_6_3.port;
     Switch_9_6_i0.down_port[4] <--> Link_1Gbps <--> Server_9_6_4.port;
     Switch_9_6_i0.down_port[5] <--> Link_1Gbps <--> Server_9_6_5.port;
     Switch_9_6_i0.down_port[6] <--> Link_1Gbps <--> Server_9_6_6.port;
     Switch_9_6_i0.down_port[7] <--> Link_1Gbps <--> Server_9_6_7.port;
     Switch_9_7_i0.down_port[0] <--> Link_1Gbps <--> Server_9_7_0.port;
     Switch_9_7_i0.down_port[1] <--> Link_1Gbps <--> Server_9_7_1.port;
     Switch_9_7_i0.down_port[2] <--> Link_1Gbps <--> Server_9_7_2.port;
     Switch_9_7_i0.down_port[3] <--> Link_1Gbps <--> Server_9_7_3.port;
     Switch_9_7_i0.down_port[4] <--> Link_1Gbps <--> Server_9_7_4.port;
     Switch_9_7_i0.down_port[5] <--> Link_1Gbps <--> Server_9_7_5.port;
     Switch_9_7_i0.down_port[6] <--> Link_1Gbps <--> Server_9_7_6.port;
     Switch_9_7_i0.down_port[7] <--> Link_1Gbps <--> Server_9_7_7.port;
     Switch_9_i0.down_port[0] <--> Link_1Gbps <--> Switch_9_0_i0.up_port[0];
     Switch_9_i0.down_port[1] <--> Link_1Gbps <--> Switch_9_1_i0.up_port[0];
     Switch_9_i0.down_port[2] <--> Link_1Gbps <--> Switch_9_2_i0.up_port[0];
     Switch_9_i0.down_port[3] <--> Link_1Gbps <--> Switch_9_3_i0.up_port[0];
     Switch_9_i0.down_port[4] <--> Link_1Gbps <--> Switch_9_4_i0.up_port[0];
     Switch_9_i0.down_port[5] <--> Link_1Gbps <--> Switch_9_5_i0.up_port[0];
     Switch_9_i0.down_port[6] <--> Link_1Gbps <--> Switch_9_6_i0.up_port[0];
     Switch_9_i0.down_port[7] <--> Link_1Gbps <--> Switch_9_7_i0.up_port[0];
     Switch_9_i1.down_port[0] <--> Link_1Gbps <--> Switch_9_0_i0.up_port[1];
     Switch_9_i1.down_port[1] <--> Link_1Gbps <--> Switch_9_1_i0.up_port[1];
     Switch_9_i1.down_port[2] <--> Link_1Gbps <--> Switch_9_2_i0.up_port[1];
     Switch_9_i1.down_port[3] <--> Link_1Gbps <--> Switch_9_3_i0.up_port[1];
     Switch_9_i1.down_port[4] <--> Link_1Gbps <--> Switch_9_4_i0.up_port[1];
     Switch_9_i1.down_port[5] <--> Link_1Gbps <--> Switch_9_5_i0.up_port[1];
     Switch_9_i1.down_port[6] <--> Link_1Gbps <--> Switch_9_6_i0.up_port[1];
     Switch_9_i1.down_port[7] <--> Link_1Gbps <--> Switch_9_7_i0.up_port[1];
     Switch_9_i2.down_port[0] <--> Link_1Gbps <--> Switch_9_0_i0.up_port[2];
     Switch_9_i2.down_port[1] <--> Link_1Gbps <--> Switch_9_1_i0.up_port[2];
     Switch_9_i2.down_port[2] <--> Link_1Gbps <--> Switch_9_2_i0.up_port[2];
     Switch_9_i2.down_port[3] <--> Link_1Gbps <--> Switch_9_3_i0.up_port[2];
     Switch_9_i2.down_port[4] <--> Link_1Gbps <--> Switch_9_4_i0.up_port[2];
     Switch_9_i2.down_port[5] <--> Link_1Gbps <--> Switch_9_5_i0.up_port[2];
     Switch_9_i2.down_port[6] <--> Link_1Gbps <--> Switch_9_6_i0.up_port[2];
     Switch_9_i2.down_port[7] <--> Link_1Gbps <--> Switch_9_7_i0.up_port[2];
     Switch_9_i3.down_port[0] <--> Link_1Gbps <--> Switch_9_0_i0.up_port[3];
     Switch_9_i3.down_port[1] <--> Link_1Gbps <--> Switch_9_1_i0.up_port[3];
     Switch_9_i3.down_port[2] <--> Link_1Gbps <--> Switch_9_2_i0.up_port[3];
     Switch_9_i3.down_port[3] <--> Link_1Gbps <--> Switch_9_3_i0.up_port[3];
     Switch_9_i3.down_port[4] <--> Link_1Gbps <--> Switch_9_4_i0.up_port[3];
     Switch_9_i3.down_port[5] <--> Link_1Gbps <--> Switch_9_5_i0.up_port[3];
     Switch_9_i3.down_port[6] <--> Link_1Gbps <--> Switch_9_6_i0.up_port[3];
     Switch_9_i3.down_port[7] <--> Link_1Gbps <--> Switch_9_7_i0.up_port[3];
     Switch_9_i4.down_port[0] <--> Link_1Gbps <--> Switch_9_0_i0.up_port[4];
     Switch_9_i4.down_port[1] <--> Link_1Gbps <--> Switch_9_1_i0.up_port[4];
     Switch_9_i4.down_port[2] <--> Link_1Gbps <--> Switch_9_2_i0.up_port[4];
     Switch_9_i4.down_port[3] <--> Link_1Gbps <--> Switch_9_3_i0.up_port[4];
     Switch_9_i4.down_port[4] <--> Link_1Gbps <--> Switch_9_4_i0.up_port[4];
     Switch_9_i4.down_port[5] <--> Link_1Gbps <--> Switch_9_5_i0.up_port[4];
     Switch_9_i4.down_port[6] <--> Link_1Gbps <--> Switch_9_6_i0.up_port[4];
     Switch_9_i4.down_port[7] <--> Link_1Gbps <--> Switch_9_7_i0.up_port[4];
     Switch_9_i5.down_port[0] <--> Link_1Gbps <--> Switch_9_0_i0.up_port[5];
     Switch_9_i5.down_port[1] <--> Link_1Gbps <--> Switch_9_1_i0.up_port[5];
     Switch_9_i5.down_port[2] <--> Link_1Gbps <--> Switch_9_2_i0.up_port[5];
     Switch_9_i5.down_port[3] <--> Link_1Gbps <--> Switch_9_3_i0.up_port[5];
     Switch_9_i5.down_port[4] <--> Link_1Gbps <--> Switch_9_4_i0.up_port[5];
     Switch_9_i5.down_port[5] <--> Link_1Gbps <--> Switch_9_5_i0.up_port[5];
     Switch_9_i5.down_port[6] <--> Link_1Gbps <--> Switch_9_6_i0.up_port[5];
     Switch_9_i5.down_port[7] <--> Link_1Gbps <--> Switch_9_7_i0.up_port[5];
     Switch_9_i6.down_port[0] <--> Link_1Gbps <--> Switch_9_0_i0.up_port[6];
     Switch_9_i6.down_port[1] <--> Link_1Gbps <--> Switch_9_1_i0.up_port[6];
     Switch_9_i6.down_port[2] <--> Link_1Gbps <--> Switch_9_2_i0.up_port[6];
     Switch_9_i6.down_port[3] <--> Link_1Gbps <--> Switch_9_3_i0.up_port[6];
     Switch_9_i6.down_port[4] <--> Link_1Gbps <--> Switch_9_4_i0.up_port[6];
     Switch_9_i6.down_port[5] <--> Link_1Gbps <--> Switch_9_5_i0.up_port[6];
     Switch_9_i6.down_port[6] <--> Link_1Gbps <--> Switch_9_6_i0.up_port[6];
     Switch_9_i6.down_port[7] <--> Link_1Gbps <--> Switch_9_7_i0.up_port[6];
     Switch_9_i7.down_port[0] <--> Link_1Gbps <--> Switch_9_0_i0.up_port[7];
     Switch_9_i7.down_port[1] <--> Link_1Gbps <--> Switch_9_1_i0.up_port[7];
     Switch_9_i7.down_port[2] <--> Link_1Gbps <--> Switch_9_2_i0.up_port[7];
     Switch_9_i7.down_port[3] <--> Link_1Gbps <--> Switch_9_3_i0.up_port[7];
     Switch_9_i7.down_port[4] <--> Link_1Gbps <--> Switch_9_4_i0.up_port[7];
     Switch_9_i7.down_port[5] <--> Link_1Gbps <--> Switch_9_5_i0.up_port[7];
     Switch_9_i7.down_port[6] <--> Link_1Gbps <--> Switch_9_6_i0.up_port[7];
     Switch_9_i7.down_port[7] <--> Link_1Gbps <--> Switch_9_7_i0.up_port[7];
     Switch_10_0_i0.down_port[0] <--> Link_1Gbps <--> Server_10_0_0.port;
     Switch_10_0_i0.down_port[1] <--> Link_1Gbps <--> Server_10_0_1.port;
     Switch_10_0_i0.down_port[2] <--> Link_1Gbps <--> Server_10_0_2.port;
     Switch_10_0_i0.down_port[3] <--> Link_1Gbps <--> Server_10_0_3.port;
     Switch_10_0_i0.down_port[4] <--> Link_1Gbps <--> Server_10_0_4.port;
     Switch_10_0_i0.down_port[5] <--> Link_1Gbps <--> Server_10_0_5.port;
     Switch_10_0_i0.down_port[6] <--> Link_1Gbps <--> Server_10_0_6.port;
     Switch_10_0_i0.down_port[7] <--> Link_1Gbps <--> Server_10_0_7.port;
     Switch_10_1_i0.down_port[0] <--> Link_1Gbps <--> Server_10_1_0.port;
     Switch_10_1_i0.down_port[1] <--> Link_1Gbps <--> Server_10_1_1.port;
     Switch_10_1_i0.down_port[2] <--> Link_1Gbps <--> Server_10_1_2.port;
     Switch_10_1_i0.down_port[3] <--> Link_1Gbps <--> Server_10_1_3.port;
     Switch_10_1_i0.down_port[4] <--> Link_1Gbps <--> Server_10_1_4.port;
     Switch_10_1_i0.down_port[5] <--> Link_1Gbps <--> Server_10_1_5.port;
     Switch_10_1_i0.down_port[6] <--> Link_1Gbps <--> Server_10_1_6.port;
     Switch_10_1_i0.down_port[7] <--> Link_1Gbps <--> Server_10_1_7.port;
     Switch_10_2_i0.down_port[0] <--> Link_1Gbps <--> Server_10_2_0.port;
     Switch_10_2_i0.down_port[1] <--> Link_1Gbps <--> Server_10_2_1.port;
     Switch_10_2_i0.down_port[2] <--> Link_1Gbps <--> Server_10_2_2.port;
     Switch_10_2_i0.down_port[3] <--> Link_1Gbps <--> Server_10_2_3.port;
     Switch_10_2_i0.down_port[4] <--> Link_1Gbps <--> Server_10_2_4.port;
     Switch_10_2_i0.down_port[5] <--> Link_1Gbps <--> Server_10_2_5.port;
     Switch_10_2_i0.down_port[6] <--> Link_1Gbps <--> Server_10_2_6.port;
     Switch_10_2_i0.down_port[7] <--> Link_1Gbps <--> Server_10_2_7.port;
     Switch_10_3_i0.down_port[0] <--> Link_1Gbps <--> Server_10_3_0.port;
     Switch_10_3_i0.down_port[1] <--> Link_1Gbps <--> Server_10_3_1.port;
     Switch_10_3_i0.down_port[2] <--> Link_1Gbps <--> Server_10_3_2.port;
     Switch_10_3_i0.down_port[3] <--> Link_1Gbps <--> Server_10_3_3.port;
     Switch_10_3_i0.down_port[4] <--> Link_1Gbps <--> Server_10_3_4.port;
     Switch_10_3_i0.down_port[5] <--> Link_1Gbps <--> Server_10_3_5.port;
     Switch_10_3_i0.down_port[6] <--> Link_1Gbps <--> Server_10_3_6.port;
     Switch_10_3_i0.down_port[7] <--> Link_1Gbps <--> Server_10_3_7.port;
     Switch_10_4_i0.down_port[0] <--> Link_1Gbps <--> Server_10_4_0.port;
     Switch_10_4_i0.down_port[1] <--> Link_1Gbps <--> Server_10_4_1.port;
     Switch_10_4_i0.down_port[2] <--> Link_1Gbps <--> Server_10_4_2.port;
     Switch_10_4_i0.down_port[3] <--> Link_1Gbps <--> Server_10_4_3.port;
     Switch_10_4_i0.down_port[4] <--> Link_1Gbps <--> Server_10_4_4.port;
     Switch_10_4_i0.down_port[5] <--> Link_1Gbps <--> Server_10_4_5.port;
     Switch_10_4_i0.down_port[6] <--> Link_1Gbps <--> Server_10_4_6.port;
     Switch_10_4_i0.down_port[7] <--> Link_1Gbps <--> Server_10_4_7.port;
     Switch_10_5_i0.down_port[0] <--> Link_1Gbps <--> Server_10_5_0.port;
     Switch_10_5_i0.down_port[1] <--> Link_1Gbps <--> Server_10_5_1.port;
     Switch_10_5_i0.down_port[2] <--> Link_1Gbps <--> Server_10_5_2.port;
     Switch_10_5_i0.down_port[3] <--> Link_1Gbps <--> Server_10_5_3.port;
     Switch_10_5_i0.down_port[4] <--> Link_1Gbps <--> Server_10_5_4.port;
     Switch_10_5_i0.down_port[5] <--> Link_1Gbps <--> Server_10_5_5.port;
     Switch_10_5_i0.down_port[6] <--> Link_1Gbps <--> Server_10_5_6.port;
     Switch_10_5_i0.down_port[7] <--> Link_1Gbps <--> Server_10_5_7.port;
     Switch_10_6_i0.down_port[0] <--> Link_1Gbps <--> Server_10_6_0.port;
     Switch_10_6_i0.down_port[1] <--> Link_1Gbps <--> Server_10_6_1.port;
     Switch_10_6_i0.down_port[2] <--> Link_1Gbps <--> Server_10_6_2.port;
     Switch_10_6_i0.down_port[3] <--> Link_1Gbps <--> Server_10_6_3.port;
     Switch_10_6_i0.down_port[4] <--> Link_1Gbps <--> Server_10_6_4.port;
     Switch_10_6_i0.down_port[5] <--> Link_1Gbps <--> Server_10_6_5.port;
     Switch_10_6_i0.down_port[6] <--> Link_1Gbps <--> Server_10_6_6.port;
     Switch_10_6_i0.down_port[7] <--> Link_1Gbps <--> Server_10_6_7.port;
     Switch_10_7_i0.down_port[0] <--> Link_1Gbps <--> Server_10_7_0.port;
     Switch_10_7_i0.down_port[1] <--> Link_1Gbps <--> Server_10_7_1.port;
     Switch_10_7_i0.down_port[2] <--> Link_1Gbps <--> Server_10_7_2.port;
     Switch_10_7_i0.down_port[3] <--> Link_1Gbps <--> Server_10_7_3.port;
     Switch_10_7_i0.down_port[4] <--> Link_1Gbps <--> Server_10_7_4.port;
     Switch_10_7_i0.down_port[5] <--> Link_1Gbps <--> Server_10_7_5.port;
     Switch_10_7_i0.down_port[6] <--> Link_1Gbps <--> Server_10_7_6.port;
     Switch_10_7_i0.down_port[7] <--> Link_1Gbps <--> Server_10_7_7.port;
     Switch_10_i0.down_port[0] <--> Link_1Gbps <--> Switch_10_0_i0.up_port[0];
     Switch_10_i0.down_port[1] <--> Link_1Gbps <--> Switch_10_1_i0.up_port[0];
     Switch_10_i0.down_port[2] <--> Link_1Gbps <--> Switch_10_2_i0.up_port[0];
     Switch_10_i0.down_port[3] <--> Link_1Gbps <--> Switch_10_3_i0.up_port[0];
     Switch_10_i0.down_port[4] <--> Link_1Gbps <--> Switch_10_4_i0.up_port[0];
     Switch_10_i0.down_port[5] <--> Link_1Gbps <--> Switch_10_5_i0.up_port[0];
     Switch_10_i0.down_port[6] <--> Link_1Gbps <--> Switch_10_6_i0.up_port[0];
     Switch_10_i0.down_port[7] <--> Link_1Gbps <--> Switch_10_7_i0.up_port[0];
     Switch_10_i1.down_port[0] <--> Link_1Gbps <--> Switch_10_0_i0.up_port[1];
     Switch_10_i1.down_port[1] <--> Link_1Gbps <--> Switch_10_1_i0.up_port[1];
     Switch_10_i1.down_port[2] <--> Link_1Gbps <--> Switch_10_2_i0.up_port[1];
     Switch_10_i1.down_port[3] <--> Link_1Gbps <--> Switch_10_3_i0.up_port[1];
     Switch_10_i1.down_port[4] <--> Link_1Gbps <--> Switch_10_4_i0.up_port[1];
     Switch_10_i1.down_port[5] <--> Link_1Gbps <--> Switch_10_5_i0.up_port[1];
     Switch_10_i1.down_port[6] <--> Link_1Gbps <--> Switch_10_6_i0.up_port[1];
     Switch_10_i1.down_port[7] <--> Link_1Gbps <--> Switch_10_7_i0.up_port[1];
     Switch_10_i2.down_port[0] <--> Link_1Gbps <--> Switch_10_0_i0.up_port[2];
     Switch_10_i2.down_port[1] <--> Link_1Gbps <--> Switch_10_1_i0.up_port[2];
     Switch_10_i2.down_port[2] <--> Link_1Gbps <--> Switch_10_2_i0.up_port[2];
     Switch_10_i2.down_port[3] <--> Link_1Gbps <--> Switch_10_3_i0.up_port[2];
     Switch_10_i2.down_port[4] <--> Link_1Gbps <--> Switch_10_4_i0.up_port[2];
     Switch_10_i2.down_port[5] <--> Link_1Gbps <--> Switch_10_5_i0.up_port[2];
     Switch_10_i2.down_port[6] <--> Link_1Gbps <--> Switch_10_6_i0.up_port[2];
     Switch_10_i2.down_port[7] <--> Link_1Gbps <--> Switch_10_7_i0.up_port[2];
     Switch_10_i3.down_port[0] <--> Link_1Gbps <--> Switch_10_0_i0.up_port[3];
     Switch_10_i3.down_port[1] <--> Link_1Gbps <--> Switch_10_1_i0.up_port[3];
     Switch_10_i3.down_port[2] <--> Link_1Gbps <--> Switch_10_2_i0.up_port[3];
     Switch_10_i3.down_port[3] <--> Link_1Gbps <--> Switch_10_3_i0.up_port[3];
     Switch_10_i3.down_port[4] <--> Link_1Gbps <--> Switch_10_4_i0.up_port[3];
     Switch_10_i3.down_port[5] <--> Link_1Gbps <--> Switch_10_5_i0.up_port[3];
     Switch_10_i3.down_port[6] <--> Link_1Gbps <--> Switch_10_6_i0.up_port[3];
     Switch_10_i3.down_port[7] <--> Link_1Gbps <--> Switch_10_7_i0.up_port[3];
     Switch_10_i4.down_port[0] <--> Link_1Gbps <--> Switch_10_0_i0.up_port[4];
     Switch_10_i4.down_port[1] <--> Link_1Gbps <--> Switch_10_1_i0.up_port[4];
     Switch_10_i4.down_port[2] <--> Link_1Gbps <--> Switch_10_2_i0.up_port[4];
     Switch_10_i4.down_port[3] <--> Link_1Gbps <--> Switch_10_3_i0.up_port[4];
     Switch_10_i4.down_port[4] <--> Link_1Gbps <--> Switch_10_4_i0.up_port[4];
     Switch_10_i4.down_port[5] <--> Link_1Gbps <--> Switch_10_5_i0.up_port[4];
     Switch_10_i4.down_port[6] <--> Link_1Gbps <--> Switch_10_6_i0.up_port[4];
     Switch_10_i4.down_port[7] <--> Link_1Gbps <--> Switch_10_7_i0.up_port[4];
     Switch_10_i5.down_port[0] <--> Link_1Gbps <--> Switch_10_0_i0.up_port[5];
     Switch_10_i5.down_port[1] <--> Link_1Gbps <--> Switch_10_1_i0.up_port[5];
     Switch_10_i5.down_port[2] <--> Link_1Gbps <--> Switch_10_2_i0.up_port[5];
     Switch_10_i5.down_port[3] <--> Link_1Gbps <--> Switch_10_3_i0.up_port[5];
     Switch_10_i5.down_port[4] <--> Link_1Gbps <--> Switch_10_4_i0.up_port[5];
     Switch_10_i5.down_port[5] <--> Link_1Gbps <--> Switch_10_5_i0.up_port[5];
     Switch_10_i5.down_port[6] <--> Link_1Gbps <--> Switch_10_6_i0.up_port[5];
     Switch_10_i5.down_port[7] <--> Link_1Gbps <--> Switch_10_7_i0.up_port[5];
     Switch_10_i6.down_port[0] <--> Link_1Gbps <--> Switch_10_0_i0.up_port[6];
     Switch_10_i6.down_port[1] <--> Link_1Gbps <--> Switch_10_1_i0.up_port[6];
     Switch_10_i6.down_port[2] <--> Link_1Gbps <--> Switch_10_2_i0.up_port[6];
     Switch_10_i6.down_port[3] <--> Link_1Gbps <--> Switch_10_3_i0.up_port[6];
     Switch_10_i6.down_port[4] <--> Link_1Gbps <--> Switch_10_4_i0.up_port[6];
     Switch_10_i6.down_port[5] <--> Link_1Gbps <--> Switch_10_5_i0.up_port[6];
     Switch_10_i6.down_port[6] <--> Link_1Gbps <--> Switch_10_6_i0.up_port[6];
     Switch_10_i6.down_port[7] <--> Link_1Gbps <--> Switch_10_7_i0.up_port[6];
     Switch_10_i7.down_port[0] <--> Link_1Gbps <--> Switch_10_0_i0.up_port[7];
     Switch_10_i7.down_port[1] <--> Link_1Gbps <--> Switch_10_1_i0.up_port[7];
     Switch_10_i7.down_port[2] <--> Link_1Gbps <--> Switch_10_2_i0.up_port[7];
     Switch_10_i7.down_port[3] <--> Link_1Gbps <--> Switch_10_3_i0.up_port[7];
     Switch_10_i7.down_port[4] <--> Link_1Gbps <--> Switch_10_4_i0.up_port[7];
     Switch_10_i7.down_port[5] <--> Link_1Gbps <--> Switch_10_5_i0.up_port[7];
     Switch_10_i7.down_port[6] <--> Link_1Gbps <--> Switch_10_6_i0.up_port[7];
     Switch_10_i7.down_port[7] <--> Link_1Gbps <--> Switch_10_7_i0.up_port[7];
     Switch_11_0_i0.down_port[0] <--> Link_1Gbps <--> Server_11_0_0.port;
     Switch_11_0_i0.down_port[1] <--> Link_1Gbps <--> Server_11_0_1.port;
     Switch_11_0_i0.down_port[2] <--> Link_1Gbps <--> Server_11_0_2.port;
     Switch_11_0_i0.down_port[3] <--> Link_1Gbps <--> Server_11_0_3.port;
     Switch_11_0_i0.down_port[4] <--> Link_1Gbps <--> Server_11_0_4.port;
     Switch_11_0_i0.down_port[5] <--> Link_1Gbps <--> Server_11_0_5.port;
     Switch_11_0_i0.down_port[6] <--> Link_1Gbps <--> Server_11_0_6.port;
     Switch_11_0_i0.down_port[7] <--> Link_1Gbps <--> Server_11_0_7.port;
     Switch_11_1_i0.down_port[0] <--> Link_1Gbps <--> Server_11_1_0.port;
     Switch_11_1_i0.down_port[1] <--> Link_1Gbps <--> Server_11_1_1.port;
     Switch_11_1_i0.down_port[2] <--> Link_1Gbps <--> Server_11_1_2.port;
     Switch_11_1_i0.down_port[3] <--> Link_1Gbps <--> Server_11_1_3.port;
     Switch_11_1_i0.down_port[4] <--> Link_1Gbps <--> Server_11_1_4.port;
     Switch_11_1_i0.down_port[5] <--> Link_1Gbps <--> Server_11_1_5.port;
     Switch_11_1_i0.down_port[6] <--> Link_1Gbps <--> Server_11_1_6.port;
     Switch_11_1_i0.down_port[7] <--> Link_1Gbps <--> Server_11_1_7.port;
     Switch_11_2_i0.down_port[0] <--> Link_1Gbps <--> Server_11_2_0.port;
     Switch_11_2_i0.down_port[1] <--> Link_1Gbps <--> Server_11_2_1.port;
     Switch_11_2_i0.down_port[2] <--> Link_1Gbps <--> Server_11_2_2.port;
     Switch_11_2_i0.down_port[3] <--> Link_1Gbps <--> Server_11_2_3.port;
     Switch_11_2_i0.down_port[4] <--> Link_1Gbps <--> Server_11_2_4.port;
     Switch_11_2_i0.down_port[5] <--> Link_1Gbps <--> Server_11_2_5.port;
     Switch_11_2_i0.down_port[6] <--> Link_1Gbps <--> Server_11_2_6.port;
     Switch_11_2_i0.down_port[7] <--> Link_1Gbps <--> Server_11_2_7.port;
     Switch_11_3_i0.down_port[0] <--> Link_1Gbps <--> Server_11_3_0.port;
     Switch_11_3_i0.down_port[1] <--> Link_1Gbps <--> Server_11_3_1.port;
     Switch_11_3_i0.down_port[2] <--> Link_1Gbps <--> Server_11_3_2.port;
     Switch_11_3_i0.down_port[3] <--> Link_1Gbps <--> Server_11_3_3.port;
     Switch_11_3_i0.down_port[4] <--> Link_1Gbps <--> Server_11_3_4.port;
     Switch_11_3_i0.down_port[5] <--> Link_1Gbps <--> Server_11_3_5.port;
     Switch_11_3_i0.down_port[6] <--> Link_1Gbps <--> Server_11_3_6.port;
     Switch_11_3_i0.down_port[7] <--> Link_1Gbps <--> Server_11_3_7.port;
     Switch_11_4_i0.down_port[0] <--> Link_1Gbps <--> Server_11_4_0.port;
     Switch_11_4_i0.down_port[1] <--> Link_1Gbps <--> Server_11_4_1.port;
     Switch_11_4_i0.down_port[2] <--> Link_1Gbps <--> Server_11_4_2.port;
     Switch_11_4_i0.down_port[3] <--> Link_1Gbps <--> Server_11_4_3.port;
     Switch_11_4_i0.down_port[4] <--> Link_1Gbps <--> Server_11_4_4.port;
     Switch_11_4_i0.down_port[5] <--> Link_1Gbps <--> Server_11_4_5.port;
     Switch_11_4_i0.down_port[6] <--> Link_1Gbps <--> Server_11_4_6.port;
     Switch_11_4_i0.down_port[7] <--> Link_1Gbps <--> Server_11_4_7.port;
     Switch_11_5_i0.down_port[0] <--> Link_1Gbps <--> Server_11_5_0.port;
     Switch_11_5_i0.down_port[1] <--> Link_1Gbps <--> Server_11_5_1.port;
     Switch_11_5_i0.down_port[2] <--> Link_1Gbps <--> Server_11_5_2.port;
     Switch_11_5_i0.down_port[3] <--> Link_1Gbps <--> Server_11_5_3.port;
     Switch_11_5_i0.down_port[4] <--> Link_1Gbps <--> Server_11_5_4.port;
     Switch_11_5_i0.down_port[5] <--> Link_1Gbps <--> Server_11_5_5.port;
     Switch_11_5_i0.down_port[6] <--> Link_1Gbps <--> Server_11_5_6.port;
     Switch_11_5_i0.down_port[7] <--> Link_1Gbps <--> Server_11_5_7.port;
     Switch_11_6_i0.down_port[0] <--> Link_1Gbps <--> Server_11_6_0.port;
     Switch_11_6_i0.down_port[1] <--> Link_1Gbps <--> Server_11_6_1.port;
     Switch_11_6_i0.down_port[2] <--> Link_1Gbps <--> Server_11_6_2.port;
     Switch_11_6_i0.down_port[3] <--> Link_1Gbps <--> Server_11_6_3.port;
     Switch_11_6_i0.down_port[4] <--> Link_1Gbps <--> Server_11_6_4.port;
     Switch_11_6_i0.down_port[5] <--> Link_1Gbps <--> Server_11_6_5.port;
     Switch_11_6_i0.down_port[6] <--> Link_1Gbps <--> Server_11_6_6.port;
     Switch_11_6_i0.down_port[7] <--> Link_1Gbps <--> Server_11_6_7.port;
     Switch_11_7_i0.down_port[0] <--> Link_1Gbps <--> Server_11_7_0.port;
     Switch_11_7_i0.down_port[1] <--> Link_1Gbps <--> Server_11_7_1.port;
     Switch_11_7_i0.down_port[2] <--> Link_1Gbps <--> Server_11_7_2.port;
     Switch_11_7_i0.down_port[3] <--> Link_1Gbps <--> Server_11_7_3.port;
     Switch_11_7_i0.down_port[4] <--> Link_1Gbps <--> Server_11_7_4.port;
     Switch_11_7_i0.down_port[5] <--> Link_1Gbps <--> Server_11_7_5.port;
     Switch_11_7_i0.down_port[6] <--> Link_1Gbps <--> Server_11_7_6.port;
     Switch_11_7_i0.down_port[7] <--> Link_1Gbps <--> Server_11_7_7.port;
     Switch_11_i0.down_port[0] <--> Link_1Gbps <--> Switch_11_0_i0.up_port[0];
     Switch_11_i0.down_port[1] <--> Link_1Gbps <--> Switch_11_1_i0.up_port[0];
     Switch_11_i0.down_port[2] <--> Link_1Gbps <--> Switch_11_2_i0.up_port[0];
     Switch_11_i0.down_port[3] <--> Link_1Gbps <--> Switch_11_3_i0.up_port[0];
     Switch_11_i0.down_port[4] <--> Link_1Gbps <--> Switch_11_4_i0.up_port[0];
     Switch_11_i0.down_port[5] <--> Link_1Gbps <--> Switch_11_5_i0.up_port[0];
     Switch_11_i0.down_port[6] <--> Link_1Gbps <--> Switch_11_6_i0.up_port[0];
     Switch_11_i0.down_port[7] <--> Link_1Gbps <--> Switch_11_7_i0.up_port[0];
     Switch_11_i1.down_port[0] <--> Link_1Gbps <--> Switch_11_0_i0.up_port[1];
     Switch_11_i1.down_port[1] <--> Link_1Gbps <--> Switch_11_1_i0.up_port[1];
     Switch_11_i1.down_port[2] <--> Link_1Gbps <--> Switch_11_2_i0.up_port[1];
     Switch_11_i1.down_port[3] <--> Link_1Gbps <--> Switch_11_3_i0.up_port[1];
     Switch_11_i1.down_port[4] <--> Link_1Gbps <--> Switch_11_4_i0.up_port[1];
     Switch_11_i1.down_port[5] <--> Link_1Gbps <--> Switch_11_5_i0.up_port[1];
     Switch_11_i1.down_port[6] <--> Link_1Gbps <--> Switch_11_6_i0.up_port[1];
     Switch_11_i1.down_port[7] <--> Link_1Gbps <--> Switch_11_7_i0.up_port[1];
     Switch_11_i2.down_port[0] <--> Link_1Gbps <--> Switch_11_0_i0.up_port[2];
     Switch_11_i2.down_port[1] <--> Link_1Gbps <--> Switch_11_1_i0.up_port[2];
     Switch_11_i2.down_port[2] <--> Link_1Gbps <--> Switch_11_2_i0.up_port[2];
     Switch_11_i2.down_port[3] <--> Link_1Gbps <--> Switch_11_3_i0.up_port[2];
     Switch_11_i2.down_port[4] <--> Link_1Gbps <--> Switch_11_4_i0.up_port[2];
     Switch_11_i2.down_port[5] <--> Link_1Gbps <--> Switch_11_5_i0.up_port[2];
     Switch_11_i2.down_port[6] <--> Link_1Gbps <--> Switch_11_6_i0.up_port[2];
     Switch_11_i2.down_port[7] <--> Link_1Gbps <--> Switch_11_7_i0.up_port[2];
     Switch_11_i3.down_port[0] <--> Link_1Gbps <--> Switch_11_0_i0.up_port[3];
     Switch_11_i3.down_port[1] <--> Link_1Gbps <--> Switch_11_1_i0.up_port[3];
     Switch_11_i3.down_port[2] <--> Link_1Gbps <--> Switch_11_2_i0.up_port[3];
     Switch_11_i3.down_port[3] <--> Link_1Gbps <--> Switch_11_3_i0.up_port[3];
     Switch_11_i3.down_port[4] <--> Link_1Gbps <--> Switch_11_4_i0.up_port[3];
     Switch_11_i3.down_port[5] <--> Link_1Gbps <--> Switch_11_5_i0.up_port[3];
     Switch_11_i3.down_port[6] <--> Link_1Gbps <--> Switch_11_6_i0.up_port[3];
     Switch_11_i3.down_port[7] <--> Link_1Gbps <--> Switch_11_7_i0.up_port[3];
     Switch_11_i4.down_port[0] <--> Link_1Gbps <--> Switch_11_0_i0.up_port[4];
     Switch_11_i4.down_port[1] <--> Link_1Gbps <--> Switch_11_1_i0.up_port[4];
     Switch_11_i4.down_port[2] <--> Link_1Gbps <--> Switch_11_2_i0.up_port[4];
     Switch_11_i4.down_port[3] <--> Link_1Gbps <--> Switch_11_3_i0.up_port[4];
     Switch_11_i4.down_port[4] <--> Link_1Gbps <--> Switch_11_4_i0.up_port[4];
     Switch_11_i4.down_port[5] <--> Link_1Gbps <--> Switch_11_5_i0.up_port[4];
     Switch_11_i4.down_port[6] <--> Link_1Gbps <--> Switch_11_6_i0.up_port[4];
     Switch_11_i4.down_port[7] <--> Link_1Gbps <--> Switch_11_7_i0.up_port[4];
     Switch_11_i5.down_port[0] <--> Link_1Gbps <--> Switch_11_0_i0.up_port[5];
     Switch_11_i5.down_port[1] <--> Link_1Gbps <--> Switch_11_1_i0.up_port[5];
     Switch_11_i5.down_port[2] <--> Link_1Gbps <--> Switch_11_2_i0.up_port[5];
     Switch_11_i5.down_port[3] <--> Link_1Gbps <--> Switch_11_3_i0.up_port[5];
     Switch_11_i5.down_port[4] <--> Link_1Gbps <--> Switch_11_4_i0.up_port[5];
     Switch_11_i5.down_port[5] <--> Link_1Gbps <--> Switch_11_5_i0.up_port[5];
     Switch_11_i5.down_port[6] <--> Link_1Gbps <--> Switch_11_6_i0.up_port[5];
     Switch_11_i5.down_port[7] <--> Link_1Gbps <--> Switch_11_7_i0.up_port[5];
     Switch_11_i6.down_port[0] <--> Link_1Gbps <--> Switch_11_0_i0.up_port[6];
     Switch_11_i6.down_port[1] <--> Link_1Gbps <--> Switch_11_1_i0.up_port[6];
     Switch_11_i6.down_port[2] <--> Link_1Gbps <--> Switch_11_2_i0.up_port[6];
     Switch_11_i6.down_port[3] <--> Link_1Gbps <--> Switch_11_3_i0.up_port[6];
     Switch_11_i6.down_port[4] <--> Link_1Gbps <--> Switch_11_4_i0.up_port[6];
     Switch_11_i6.down_port[5] <--> Link_1Gbps <--> Switch_11_5_i0.up_port[6];
     Switch_11_i6.down_port[6] <--> Link_1Gbps <--> Switch_11_6_i0.up_port[6];
     Switch_11_i6.down_port[7] <--> Link_1Gbps <--> Switch_11_7_i0.up_port[6];
     Switch_11_i7.down_port[0] <--> Link_1Gbps <--> Switch_11_0_i0.up_port[7];
     Switch_11_i7.down_port[1] <--> Link_1Gbps <--> Switch_11_1_i0.up_port[7];
     Switch_11_i7.down_port[2] <--> Link_1Gbps <--> Switch_11_2_i0.up_port[7];
     Switch_11_i7.down_port[3] <--> Link_1Gbps <--> Switch_11_3_i0.up_port[7];
     Switch_11_i7.down_port[4] <--> Link_1Gbps <--> Switch_11_4_i0.up_port[7];
     Switch_11_i7.down_port[5] <--> Link_1Gbps <--> Switch_11_5_i0.up_port[7];
     Switch_11_i7.down_port[6] <--> Link_1Gbps <--> Switch_11_6_i0.up_port[7];
     Switch_11_i7.down_port[7] <--> Link_1Gbps <--> Switch_11_7_i0.up_port[7];
     Switch_12_0_i0.down_port[0] <--> Link_1Gbps <--> Server_12_0_0.port;
     Switch_12_0_i0.down_port[1] <--> Link_1Gbps <--> Server_12_0_1.port;
     Switch_12_0_i0.down_port[2] <--> Link_1Gbps <--> Server_12_0_2.port;
     Switch_12_0_i0.down_port[3] <--> Link_1Gbps <--> Server_12_0_3.port;
     Switch_12_0_i0.down_port[4] <--> Link_1Gbps <--> Server_12_0_4.port;
     Switch_12_0_i0.down_port[5] <--> Link_1Gbps <--> Server_12_0_5.port;
     Switch_12_0_i0.down_port[6] <--> Link_1Gbps <--> Server_12_0_6.port;
     Switch_12_0_i0.down_port[7] <--> Link_1Gbps <--> Server_12_0_7.port;
     Switch_12_1_i0.down_port[0] <--> Link_1Gbps <--> Server_12_1_0.port;
     Switch_12_1_i0.down_port[1] <--> Link_1Gbps <--> Server_12_1_1.port;
     Switch_12_1_i0.down_port[2] <--> Link_1Gbps <--> Server_12_1_2.port;
     Switch_12_1_i0.down_port[3] <--> Link_1Gbps <--> Server_12_1_3.port;
     Switch_12_1_i0.down_port[4] <--> Link_1Gbps <--> Server_12_1_4.port;
     Switch_12_1_i0.down_port[5] <--> Link_1Gbps <--> Server_12_1_5.port;
     Switch_12_1_i0.down_port[6] <--> Link_1Gbps <--> Server_12_1_6.port;
     Switch_12_1_i0.down_port[7] <--> Link_1Gbps <--> Server_12_1_7.port;
     Switch_12_2_i0.down_port[0] <--> Link_1Gbps <--> Server_12_2_0.port;
     Switch_12_2_i0.down_port[1] <--> Link_1Gbps <--> Server_12_2_1.port;
     Switch_12_2_i0.down_port[2] <--> Link_1Gbps <--> Server_12_2_2.port;
     Switch_12_2_i0.down_port[3] <--> Link_1Gbps <--> Server_12_2_3.port;
     Switch_12_2_i0.down_port[4] <--> Link_1Gbps <--> Server_12_2_4.port;
     Switch_12_2_i0.down_port[5] <--> Link_1Gbps <--> Server_12_2_5.port;
     Switch_12_2_i0.down_port[6] <--> Link_1Gbps <--> Server_12_2_6.port;
     Switch_12_2_i0.down_port[7] <--> Link_1Gbps <--> Server_12_2_7.port;
     Switch_12_3_i0.down_port[0] <--> Link_1Gbps <--> Server_12_3_0.port;
     Switch_12_3_i0.down_port[1] <--> Link_1Gbps <--> Server_12_3_1.port;
     Switch_12_3_i0.down_port[2] <--> Link_1Gbps <--> Server_12_3_2.port;
     Switch_12_3_i0.down_port[3] <--> Link_1Gbps <--> Server_12_3_3.port;
     Switch_12_3_i0.down_port[4] <--> Link_1Gbps <--> Server_12_3_4.port;
     Switch_12_3_i0.down_port[5] <--> Link_1Gbps <--> Server_12_3_5.port;
     Switch_12_3_i0.down_port[6] <--> Link_1Gbps <--> Server_12_3_6.port;
     Switch_12_3_i0.down_port[7] <--> Link_1Gbps <--> Server_12_3_7.port;
     Switch_12_4_i0.down_port[0] <--> Link_1Gbps <--> Server_12_4_0.port;
     Switch_12_4_i0.down_port[1] <--> Link_1Gbps <--> Server_12_4_1.port;
     Switch_12_4_i0.down_port[2] <--> Link_1Gbps <--> Server_12_4_2.port;
     Switch_12_4_i0.down_port[3] <--> Link_1Gbps <--> Server_12_4_3.port;
     Switch_12_4_i0.down_port[4] <--> Link_1Gbps <--> Server_12_4_4.port;
     Switch_12_4_i0.down_port[5] <--> Link_1Gbps <--> Server_12_4_5.port;
     Switch_12_4_i0.down_port[6] <--> Link_1Gbps <--> Server_12_4_6.port;
     Switch_12_4_i0.down_port[7] <--> Link_1Gbps <--> Server_12_4_7.port;
     Switch_12_5_i0.down_port[0] <--> Link_1Gbps <--> Server_12_5_0.port;
     Switch_12_5_i0.down_port[1] <--> Link_1Gbps <--> Server_12_5_1.port;
     Switch_12_5_i0.down_port[2] <--> Link_1Gbps <--> Server_12_5_2.port;
     Switch_12_5_i0.down_port[3] <--> Link_1Gbps <--> Server_12_5_3.port;
     Switch_12_5_i0.down_port[4] <--> Link_1Gbps <--> Server_12_5_4.port;
     Switch_12_5_i0.down_port[5] <--> Link_1Gbps <--> Server_12_5_5.port;
     Switch_12_5_i0.down_port[6] <--> Link_1Gbps <--> Server_12_5_6.port;
     Switch_12_5_i0.down_port[7] <--> Link_1Gbps <--> Server_12_5_7.port;
     Switch_12_6_i0.down_port[0] <--> Link_1Gbps <--> Server_12_6_0.port;
     Switch_12_6_i0.down_port[1] <--> Link_1Gbps <--> Server_12_6_1.port;
     Switch_12_6_i0.down_port[2] <--> Link_1Gbps <--> Server_12_6_2.port;
     Switch_12_6_i0.down_port[3] <--> Link_1Gbps <--> Server_12_6_3.port;
     Switch_12_6_i0.down_port[4] <--> Link_1Gbps <--> Server_12_6_4.port;
     Switch_12_6_i0.down_port[5] <--> Link_1Gbps <--> Server_12_6_5.port;
     Switch_12_6_i0.down_port[6] <--> Link_1Gbps <--> Server_12_6_6.port;
     Switch_12_6_i0.down_port[7] <--> Link_1Gbps <--> Server_12_6_7.port;
     Switch_12_7_i0.down_port[0] <--> Link_1Gbps <--> Server_12_7_0.port;
     Switch_12_7_i0.down_port[1] <--> Link_1Gbps <--> Server_12_7_1.port;
     Switch_12_7_i0.down_port[2] <--> Link_1Gbps <--> Server_12_7_2.port;
     Switch_12_7_i0.down_port[3] <--> Link_1Gbps <--> Server_12_7_3.port;
     Switch_12_7_i0.down_port[4] <--> Link_1Gbps <--> Server_12_7_4.port;
     Switch_12_7_i0.down_port[5] <--> Link_1Gbps <--> Server_12_7_5.port;
     Switch_12_7_i0.down_port[6] <--> Link_1Gbps <--> Server_12_7_6.port;
     Switch_12_7_i0.down_port[7] <--> Link_1Gbps <--> Server_12_7_7.port;
     Switch_12_i0.down_port[0] <--> Link_1Gbps <--> Switch_12_0_i0.up_port[0];
     Switch_12_i0.down_port[1] <--> Link_1Gbps <--> Switch_12_1_i0.up_port[0];
     Switch_12_i0.down_port[2] <--> Link_1Gbps <--> Switch_12_2_i0.up_port[0];
     Switch_12_i0.down_port[3] <--> Link_1Gbps <--> Switch_12_3_i0.up_port[0];
     Switch_12_i0.down_port[4] <--> Link_1Gbps <--> Switch_12_4_i0.up_port[0];
     Switch_12_i0.down_port[5] <--> Link_1Gbps <--> Switch_12_5_i0.up_port[0];
     Switch_12_i0.down_port[6] <--> Link_1Gbps <--> Switch_12_6_i0.up_port[0];
     Switch_12_i0.down_port[7] <--> Link_1Gbps <--> Switch_12_7_i0.up_port[0];
     Switch_12_i1.down_port[0] <--> Link_1Gbps <--> Switch_12_0_i0.up_port[1];
     Switch_12_i1.down_port[1] <--> Link_1Gbps <--> Switch_12_1_i0.up_port[1];
     Switch_12_i1.down_port[2] <--> Link_1Gbps <--> Switch_12_2_i0.up_port[1];
     Switch_12_i1.down_port[3] <--> Link_1Gbps <--> Switch_12_3_i0.up_port[1];
     Switch_12_i1.down_port[4] <--> Link_1Gbps <--> Switch_12_4_i0.up_port[1];
     Switch_12_i1.down_port[5] <--> Link_1Gbps <--> Switch_12_5_i0.up_port[1];
     Switch_12_i1.down_port[6] <--> Link_1Gbps <--> Switch_12_6_i0.up_port[1];
     Switch_12_i1.down_port[7] <--> Link_1Gbps <--> Switch_12_7_i0.up_port[1];
     Switch_12_i2.down_port[0] <--> Link_1Gbps <--> Switch_12_0_i0.up_port[2];
     Switch_12_i2.down_port[1] <--> Link_1Gbps <--> Switch_12_1_i0.up_port[2];
     Switch_12_i2.down_port[2] <--> Link_1Gbps <--> Switch_12_2_i0.up_port[2];
     Switch_12_i2.down_port[3] <--> Link_1Gbps <--> Switch_12_3_i0.up_port[2];
     Switch_12_i2.down_port[4] <--> Link_1Gbps <--> Switch_12_4_i0.up_port[2];
     Switch_12_i2.down_port[5] <--> Link_1Gbps <--> Switch_12_5_i0.up_port[2];
     Switch_12_i2.down_port[6] <--> Link_1Gbps <--> Switch_12_6_i0.up_port[2];
     Switch_12_i2.down_port[7] <--> Link_1Gbps <--> Switch_12_7_i0.up_port[2];
     Switch_12_i3.down_port[0] <--> Link_1Gbps <--> Switch_12_0_i0.up_port[3];
     Switch_12_i3.down_port[1] <--> Link_1Gbps <--> Switch_12_1_i0.up_port[3];
     Switch_12_i3.down_port[2] <--> Link_1Gbps <--> Switch_12_2_i0.up_port[3];
     Switch_12_i3.down_port[3] <--> Link_1Gbps <--> Switch_12_3_i0.up_port[3];
     Switch_12_i3.down_port[4] <--> Link_1Gbps <--> Switch_12_4_i0.up_port[3];
     Switch_12_i3.down_port[5] <--> Link_1Gbps <--> Switch_12_5_i0.up_port[3];
     Switch_12_i3.down_port[6] <--> Link_1Gbps <--> Switch_12_6_i0.up_port[3];
     Switch_12_i3.down_port[7] <--> Link_1Gbps <--> Switch_12_7_i0.up_port[3];
     Switch_12_i4.down_port[0] <--> Link_1Gbps <--> Switch_12_0_i0.up_port[4];
     Switch_12_i4.down_port[1] <--> Link_1Gbps <--> Switch_12_1_i0.up_port[4];
     Switch_12_i4.down_port[2] <--> Link_1Gbps <--> Switch_12_2_i0.up_port[4];
     Switch_12_i4.down_port[3] <--> Link_1Gbps <--> Switch_12_3_i0.up_port[4];
     Switch_12_i4.down_port[4] <--> Link_1Gbps <--> Switch_12_4_i0.up_port[4];
     Switch_12_i4.down_port[5] <--> Link_1Gbps <--> Switch_12_5_i0.up_port[4];
     Switch_12_i4.down_port[6] <--> Link_1Gbps <--> Switch_12_6_i0.up_port[4];
     Switch_12_i4.down_port[7] <--> Link_1Gbps <--> Switch_12_7_i0.up_port[4];
     Switch_12_i5.down_port[0] <--> Link_1Gbps <--> Switch_12_0_i0.up_port[5];
     Switch_12_i5.down_port[1] <--> Link_1Gbps <--> Switch_12_1_i0.up_port[5];
     Switch_12_i5.down_port[2] <--> Link_1Gbps <--> Switch_12_2_i0.up_port[5];
     Switch_12_i5.down_port[3] <--> Link_1Gbps <--> Switch_12_3_i0.up_port[5];
     Switch_12_i5.down_port[4] <--> Link_1Gbps <--> Switch_12_4_i0.up_port[5];
     Switch_12_i5.down_port[5] <--> Link_1Gbps <--> Switch_12_5_i0.up_port[5];
     Switch_12_i5.down_port[6] <--> Link_1Gbps <--> Switch_12_6_i0.up_port[5];
     Switch_12_i5.down_port[7] <--> Link_1Gbps <--> Switch_12_7_i0.up_port[5];
     Switch_12_i6.down_port[0] <--> Link_1Gbps <--> Switch_12_0_i0.up_port[6];
     Switch_12_i6.down_port[1] <--> Link_1Gbps <--> Switch_12_1_i0.up_port[6];
     Switch_12_i6.down_port[2] <--> Link_1Gbps <--> Switch_12_2_i0.up_port[6];
     Switch_12_i6.down_port[3] <--> Link_1Gbps <--> Switch_12_3_i0.up_port[6];
     Switch_12_i6.down_port[4] <--> Link_1Gbps <--> Switch_12_4_i0.up_port[6];
     Switch_12_i6.down_port[5] <--> Link_1Gbps <--> Switch_12_5_i0.up_port[6];
     Switch_12_i6.down_port[6] <--> Link_1Gbps <--> Switch_12_6_i0.up_port[6];
     Switch_12_i6.down_port[7] <--> Link_1Gbps <--> Switch_12_7_i0.up_port[6];
     Switch_12_i7.down_port[0] <--> Link_1Gbps <--> Switch_12_0_i0.up_port[7];
     Switch_12_i7.down_port[1] <--> Link_1Gbps <--> Switch_12_1_i0.up_port[7];
     Switch_12_i7.down_port[2] <--> Link_1Gbps <--> Switch_12_2_i0.up_port[7];
     Switch_12_i7.down_port[3] <--> Link_1Gbps <--> Switch_12_3_i0.up_port[7];
     Switch_12_i7.down_port[4] <--> Link_1Gbps <--> Switch_12_4_i0.up_port[7];
     Switch_12_i7.down_port[5] <--> Link_1Gbps <--> Switch_12_5_i0.up_port[7];
     Switch_12_i7.down_port[6] <--> Link_1Gbps <--> Switch_12_6_i0.up_port[7];
     Switch_12_i7.down_port[7] <--> Link_1Gbps <--> Switch_12_7_i0.up_port[7];
     Switch_13_0_i0.down_port[0] <--> Link_1Gbps <--> Server_13_0_0.port;
     Switch_13_0_i0.down_port[1] <--> Link_1Gbps <--> Server_13_0_1.port;
     Switch_13_0_i0.down_port[2] <--> Link_1Gbps <--> Server_13_0_2.port;
     Switch_13_0_i0.down_port[3] <--> Link_1Gbps <--> Server_13_0_3.port;
     Switch_13_0_i0.down_port[4] <--> Link_1Gbps <--> Server_13_0_4.port;
     Switch_13_0_i0.down_port[5] <--> Link_1Gbps <--> Server_13_0_5.port;
     Switch_13_0_i0.down_port[6] <--> Link_1Gbps <--> Server_13_0_6.port;
     Switch_13_0_i0.down_port[7] <--> Link_1Gbps <--> Server_13_0_7.port;
     Switch_13_1_i0.down_port[0] <--> Link_1Gbps <--> Server_13_1_0.port;
     Switch_13_1_i0.down_port[1] <--> Link_1Gbps <--> Server_13_1_1.port;
     Switch_13_1_i0.down_port[2] <--> Link_1Gbps <--> Server_13_1_2.port;
     Switch_13_1_i0.down_port[3] <--> Link_1Gbps <--> Server_13_1_3.port;
     Switch_13_1_i0.down_port[4] <--> Link_1Gbps <--> Server_13_1_4.port;
     Switch_13_1_i0.down_port[5] <--> Link_1Gbps <--> Server_13_1_5.port;
     Switch_13_1_i0.down_port[6] <--> Link_1Gbps <--> Server_13_1_6.port;
     Switch_13_1_i0.down_port[7] <--> Link_1Gbps <--> Server_13_1_7.port;
     Switch_13_2_i0.down_port[0] <--> Link_1Gbps <--> Server_13_2_0.port;
     Switch_13_2_i0.down_port[1] <--> Link_1Gbps <--> Server_13_2_1.port;
     Switch_13_2_i0.down_port[2] <--> Link_1Gbps <--> Server_13_2_2.port;
     Switch_13_2_i0.down_port[3] <--> Link_1Gbps <--> Server_13_2_3.port;
     Switch_13_2_i0.down_port[4] <--> Link_1Gbps <--> Server_13_2_4.port;
     Switch_13_2_i0.down_port[5] <--> Link_1Gbps <--> Server_13_2_5.port;
     Switch_13_2_i0.down_port[6] <--> Link_1Gbps <--> Server_13_2_6.port;
     Switch_13_2_i0.down_port[7] <--> Link_1Gbps <--> Server_13_2_7.port;
     Switch_13_3_i0.down_port[0] <--> Link_1Gbps <--> Server_13_3_0.port;
     Switch_13_3_i0.down_port[1] <--> Link_1Gbps <--> Server_13_3_1.port;
     Switch_13_3_i0.down_port[2] <--> Link_1Gbps <--> Server_13_3_2.port;
     Switch_13_3_i0.down_port[3] <--> Link_1Gbps <--> Server_13_3_3.port;
     Switch_13_3_i0.down_port[4] <--> Link_1Gbps <--> Server_13_3_4.port;
     Switch_13_3_i0.down_port[5] <--> Link_1Gbps <--> Server_13_3_5.port;
     Switch_13_3_i0.down_port[6] <--> Link_1Gbps <--> Server_13_3_6.port;
     Switch_13_3_i0.down_port[7] <--> Link_1Gbps <--> Server_13_3_7.port;
     Switch_13_4_i0.down_port[0] <--> Link_1Gbps <--> Server_13_4_0.port;
     Switch_13_4_i0.down_port[1] <--> Link_1Gbps <--> Server_13_4_1.port;
     Switch_13_4_i0.down_port[2] <--> Link_1Gbps <--> Server_13_4_2.port;
     Switch_13_4_i0.down_port[3] <--> Link_1Gbps <--> Server_13_4_3.port;
     Switch_13_4_i0.down_port[4] <--> Link_1Gbps <--> Server_13_4_4.port;
     Switch_13_4_i0.down_port[5] <--> Link_1Gbps <--> Server_13_4_5.port;
     Switch_13_4_i0.down_port[6] <--> Link_1Gbps <--> Server_13_4_6.port;
     Switch_13_4_i0.down_port[7] <--> Link_1Gbps <--> Server_13_4_7.port;
     Switch_13_5_i0.down_port[0] <--> Link_1Gbps <--> Server_13_5_0.port;
     Switch_13_5_i0.down_port[1] <--> Link_1Gbps <--> Server_13_5_1.port;
     Switch_13_5_i0.down_port[2] <--> Link_1Gbps <--> Server_13_5_2.port;
     Switch_13_5_i0.down_port[3] <--> Link_1Gbps <--> Server_13_5_3.port;
     Switch_13_5_i0.down_port[4] <--> Link_1Gbps <--> Server_13_5_4.port;
     Switch_13_5_i0.down_port[5] <--> Link_1Gbps <--> Server_13_5_5.port;
     Switch_13_5_i0.down_port[6] <--> Link_1Gbps <--> Server_13_5_6.port;
     Switch_13_5_i0.down_port[7] <--> Link_1Gbps <--> Server_13_5_7.port;
     Switch_13_6_i0.down_port[0] <--> Link_1Gbps <--> Server_13_6_0.port;
     Switch_13_6_i0.down_port[1] <--> Link_1Gbps <--> Server_13_6_1.port;
     Switch_13_6_i0.down_port[2] <--> Link_1Gbps <--> Server_13_6_2.port;
     Switch_13_6_i0.down_port[3] <--> Link_1Gbps <--> Server_13_6_3.port;
     Switch_13_6_i0.down_port[4] <--> Link_1Gbps <--> Server_13_6_4.port;
     Switch_13_6_i0.down_port[5] <--> Link_1Gbps <--> Server_13_6_5.port;
     Switch_13_6_i0.down_port[6] <--> Link_1Gbps <--> Server_13_6_6.port;
     Switch_13_6_i0.down_port[7] <--> Link_1Gbps <--> Server_13_6_7.port;
     Switch_13_7_i0.down_port[0] <--> Link_1Gbps <--> Server_13_7_0.port;
     Switch_13_7_i0.down_port[1] <--> Link_1Gbps <--> Server_13_7_1.port;
     Switch_13_7_i0.down_port[2] <--> Link_1Gbps <--> Server_13_7_2.port;
     Switch_13_7_i0.down_port[3] <--> Link_1Gbps <--> Server_13_7_3.port;
     Switch_13_7_i0.down_port[4] <--> Link_1Gbps <--> Server_13_7_4.port;
     Switch_13_7_i0.down_port[5] <--> Link_1Gbps <--> Server_13_7_5.port;
     Switch_13_7_i0.down_port[6] <--> Link_1Gbps <--> Server_13_7_6.port;
     Switch_13_7_i0.down_port[7] <--> Link_1Gbps <--> Server_13_7_7.port;
     Switch_13_i0.down_port[0] <--> Link_1Gbps <--> Switch_13_0_i0.up_port[0];
     Switch_13_i0.down_port[1] <--> Link_1Gbps <--> Switch_13_1_i0.up_port[0];
     Switch_13_i0.down_port[2] <--> Link_1Gbps <--> Switch_13_2_i0.up_port[0];
     Switch_13_i0.down_port[3] <--> Link_1Gbps <--> Switch_13_3_i0.up_port[0];
     Switch_13_i0.down_port[4] <--> Link_1Gbps <--> Switch_13_4_i0.up_port[0];
     Switch_13_i0.down_port[5] <--> Link_1Gbps <--> Switch_13_5_i0.up_port[0];
     Switch_13_i0.down_port[6] <--> Link_1Gbps <--> Switch_13_6_i0.up_port[0];
     Switch_13_i0.down_port[7] <--> Link_1Gbps <--> Switch_13_7_i0.up_port[0];
     Switch_13_i1.down_port[0] <--> Link_1Gbps <--> Switch_13_0_i0.up_port[1];
     Switch_13_i1.down_port[1] <--> Link_1Gbps <--> Switch_13_1_i0.up_port[1];
     Switch_13_i1.down_port[2] <--> Link_1Gbps <--> Switch_13_2_i0.up_port[1];
     Switch_13_i1.down_port[3] <--> Link_1Gbps <--> Switch_13_3_i0.up_port[1];
     Switch_13_i1.down_port[4] <--> Link_1Gbps <--> Switch_13_4_i0.up_port[1];
     Switch_13_i1.down_port[5] <--> Link_1Gbps <--> Switch_13_5_i0.up_port[1];
     Switch_13_i1.down_port[6] <--> Link_1Gbps <--> Switch_13_6_i0.up_port[1];
     Switch_13_i1.down_port[7] <--> Link_1Gbps <--> Switch_13_7_i0.up_port[1];
     Switch_13_i2.down_port[0] <--> Link_1Gbps <--> Switch_13_0_i0.up_port[2];
     Switch_13_i2.down_port[1] <--> Link_1Gbps <--> Switch_13_1_i0.up_port[2];
     Switch_13_i2.down_port[2] <--> Link_1Gbps <--> Switch_13_2_i0.up_port[2];
     Switch_13_i2.down_port[3] <--> Link_1Gbps <--> Switch_13_3_i0.up_port[2];
     Switch_13_i2.down_port[4] <--> Link_1Gbps <--> Switch_13_4_i0.up_port[2];
     Switch_13_i2.down_port[5] <--> Link_1Gbps <--> Switch_13_5_i0.up_port[2];
     Switch_13_i2.down_port[6] <--> Link_1Gbps <--> Switch_13_6_i0.up_port[2];
     Switch_13_i2.down_port[7] <--> Link_1Gbps <--> Switch_13_7_i0.up_port[2];
     Switch_13_i3.down_port[0] <--> Link_1Gbps <--> Switch_13_0_i0.up_port[3];
     Switch_13_i3.down_port[1] <--> Link_1Gbps <--> Switch_13_1_i0.up_port[3];
     Switch_13_i3.down_port[2] <--> Link_1Gbps <--> Switch_13_2_i0.up_port[3];
     Switch_13_i3.down_port[3] <--> Link_1Gbps <--> Switch_13_3_i0.up_port[3];
     Switch_13_i3.down_port[4] <--> Link_1Gbps <--> Switch_13_4_i0.up_port[3];
     Switch_13_i3.down_port[5] <--> Link_1Gbps <--> Switch_13_5_i0.up_port[3];
     Switch_13_i3.down_port[6] <--> Link_1Gbps <--> Switch_13_6_i0.up_port[3];
     Switch_13_i3.down_port[7] <--> Link_1Gbps <--> Switch_13_7_i0.up_port[3];
     Switch_13_i4.down_port[0] <--> Link_1Gbps <--> Switch_13_0_i0.up_port[4];
     Switch_13_i4.down_port[1] <--> Link_1Gbps <--> Switch_13_1_i0.up_port[4];
     Switch_13_i4.down_port[2] <--> Link_1Gbps <--> Switch_13_2_i0.up_port[4];
     Switch_13_i4.down_port[3] <--> Link_1Gbps <--> Switch_13_3_i0.up_port[4];
     Switch_13_i4.down_port[4] <--> Link_1Gbps <--> Switch_13_4_i0.up_port[4];
     Switch_13_i4.down_port[5] <--> Link_1Gbps <--> Switch_13_5_i0.up_port[4];
     Switch_13_i4.down_port[6] <--> Link_1Gbps <--> Switch_13_6_i0.up_port[4];
     Switch_13_i4.down_port[7] <--> Link_1Gbps <--> Switch_13_7_i0.up_port[4];
     Switch_13_i5.down_port[0] <--> Link_1Gbps <--> Switch_13_0_i0.up_port[5];
     Switch_13_i5.down_port[1] <--> Link_1Gbps <--> Switch_13_1_i0.up_port[5];
     Switch_13_i5.down_port[2] <--> Link_1Gbps <--> Switch_13_2_i0.up_port[5];
     Switch_13_i5.down_port[3] <--> Link_1Gbps <--> Switch_13_3_i0.up_port[5];
     Switch_13_i5.down_port[4] <--> Link_1Gbps <--> Switch_13_4_i0.up_port[5];
     Switch_13_i5.down_port[5] <--> Link_1Gbps <--> Switch_13_5_i0.up_port[5];
     Switch_13_i5.down_port[6] <--> Link_1Gbps <--> Switch_13_6_i0.up_port[5];
     Switch_13_i5.down_port[7] <--> Link_1Gbps <--> Switch_13_7_i0.up_port[5];
     Switch_13_i6.down_port[0] <--> Link_1Gbps <--> Switch_13_0_i0.up_port[6];
     Switch_13_i6.down_port[1] <--> Link_1Gbps <--> Switch_13_1_i0.up_port[6];
     Switch_13_i6.down_port[2] <--> Link_1Gbps <--> Switch_13_2_i0.up_port[6];
     Switch_13_i6.down_port[3] <--> Link_1Gbps <--> Switch_13_3_i0.up_port[6];
     Switch_13_i6.down_port[4] <--> Link_1Gbps <--> Switch_13_4_i0.up_port[6];
     Switch_13_i6.down_port[5] <--> Link_1Gbps <--> Switch_13_5_i0.up_port[6];
     Switch_13_i6.down_port[6] <--> Link_1Gbps <--> Switch_13_6_i0.up_port[6];
     Switch_13_i6.down_port[7] <--> Link_1Gbps <--> Switch_13_7_i0.up_port[6];
     Switch_13_i7.down_port[0] <--> Link_1Gbps <--> Switch_13_0_i0.up_port[7];
     Switch_13_i7.down_port[1] <--> Link_1Gbps <--> Switch_13_1_i0.up_port[7];
     Switch_13_i7.down_port[2] <--> Link_1Gbps <--> Switch_13_2_i0.up_port[7];
     Switch_13_i7.down_port[3] <--> Link_1Gbps <--> Switch_13_3_i0.up_port[7];
     Switch_13_i7.down_port[4] <--> Link_1Gbps <--> Switch_13_4_i0.up_port[7];
     Switch_13_i7.down_port[5] <--> Link_1Gbps <--> Switch_13_5_i0.up_port[7];
     Switch_13_i7.down_port[6] <--> Link_1Gbps <--> Switch_13_6_i0.up_port[7];
     Switch_13_i7.down_port[7] <--> Link_1Gbps <--> Switch_13_7_i0.up_port[7];
     Switch_14_0_i0.down_port[0] <--> Link_1Gbps <--> Server_14_0_0.port;
     Switch_14_0_i0.down_port[1] <--> Link_1Gbps <--> Server_14_0_1.port;
     Switch_14_0_i0.down_port[2] <--> Link_1Gbps <--> Server_14_0_2.port;
     Switch_14_0_i0.down_port[3] <--> Link_1Gbps <--> Server_14_0_3.port;
     Switch_14_0_i0.down_port[4] <--> Link_1Gbps <--> Server_14_0_4.port;
     Switch_14_0_i0.down_port[5] <--> Link_1Gbps <--> Server_14_0_5.port;
     Switch_14_0_i0.down_port[6] <--> Link_1Gbps <--> Server_14_0_6.port;
     Switch_14_0_i0.down_port[7] <--> Link_1Gbps <--> Server_14_0_7.port;
     Switch_14_1_i0.down_port[0] <--> Link_1Gbps <--> Server_14_1_0.port;
     Switch_14_1_i0.down_port[1] <--> Link_1Gbps <--> Server_14_1_1.port;
     Switch_14_1_i0.down_port[2] <--> Link_1Gbps <--> Server_14_1_2.port;
     Switch_14_1_i0.down_port[3] <--> Link_1Gbps <--> Server_14_1_3.port;
     Switch_14_1_i0.down_port[4] <--> Link_1Gbps <--> Server_14_1_4.port;
     Switch_14_1_i0.down_port[5] <--> Link_1Gbps <--> Server_14_1_5.port;
     Switch_14_1_i0.down_port[6] <--> Link_1Gbps <--> Server_14_1_6.port;
     Switch_14_1_i0.down_port[7] <--> Link_1Gbps <--> Server_14_1_7.port;
     Switch_14_2_i0.down_port[0] <--> Link_1Gbps <--> Server_14_2_0.port;
     Switch_14_2_i0.down_port[1] <--> Link_1Gbps <--> Server_14_2_1.port;
     Switch_14_2_i0.down_port[2] <--> Link_1Gbps <--> Server_14_2_2.port;
     Switch_14_2_i0.down_port[3] <--> Link_1Gbps <--> Server_14_2_3.port;
     Switch_14_2_i0.down_port[4] <--> Link_1Gbps <--> Server_14_2_4.port;
     Switch_14_2_i0.down_port[5] <--> Link_1Gbps <--> Server_14_2_5.port;
     Switch_14_2_i0.down_port[6] <--> Link_1Gbps <--> Server_14_2_6.port;
     Switch_14_2_i0.down_port[7] <--> Link_1Gbps <--> Server_14_2_7.port;
     Switch_14_3_i0.down_port[0] <--> Link_1Gbps <--> Server_14_3_0.port;
     Switch_14_3_i0.down_port[1] <--> Link_1Gbps <--> Server_14_3_1.port;
     Switch_14_3_i0.down_port[2] <--> Link_1Gbps <--> Server_14_3_2.port;
     Switch_14_3_i0.down_port[3] <--> Link_1Gbps <--> Server_14_3_3.port;
     Switch_14_3_i0.down_port[4] <--> Link_1Gbps <--> Server_14_3_4.port;
     Switch_14_3_i0.down_port[5] <--> Link_1Gbps <--> Server_14_3_5.port;
     Switch_14_3_i0.down_port[6] <--> Link_1Gbps <--> Server_14_3_6.port;
     Switch_14_3_i0.down_port[7] <--> Link_1Gbps <--> Server_14_3_7.port;
     Switch_14_4_i0.down_port[0] <--> Link_1Gbps <--> Server_14_4_0.port;
     Switch_14_4_i0.down_port[1] <--> Link_1Gbps <--> Server_14_4_1.port;
     Switch_14_4_i0.down_port[2] <--> Link_1Gbps <--> Server_14_4_2.port;
     Switch_14_4_i0.down_port[3] <--> Link_1Gbps <--> Server_14_4_3.port;
     Switch_14_4_i0.down_port[4] <--> Link_1Gbps <--> Server_14_4_4.port;
     Switch_14_4_i0.down_port[5] <--> Link_1Gbps <--> Server_14_4_5.port;
     Switch_14_4_i0.down_port[6] <--> Link_1Gbps <--> Server_14_4_6.port;
     Switch_14_4_i0.down_port[7] <--> Link_1Gbps <--> Server_14_4_7.port;
     Switch_14_5_i0.down_port[0] <--> Link_1Gbps <--> Server_14_5_0.port;
     Switch_14_5_i0.down_port[1] <--> Link_1Gbps <--> Server_14_5_1.port;
     Switch_14_5_i0.down_port[2] <--> Link_1Gbps <--> Server_14_5_2.port;
     Switch_14_5_i0.down_port[3] <--> Link_1Gbps <--> Server_14_5_3.port;
     Switch_14_5_i0.down_port[4] <--> Link_1Gbps <--> Server_14_5_4.port;
     Switch_14_5_i0.down_port[5] <--> Link_1Gbps <--> Server_14_5_5.port;
     Switch_14_5_i0.down_port[6] <--> Link_1Gbps <--> Server_14_5_6.port;
     Switch_14_5_i0.down_port[7] <--> Link_1Gbps <--> Server_14_5_7.port;
     Switch_14_6_i0.down_port[0] <--> Link_1Gbps <--> Server_14_6_0.port;
     Switch_14_6_i0.down_port[1] <--> Link_1Gbps <--> Server_14_6_1.port;
     Switch_14_6_i0.down_port[2] <--> Link_1Gbps <--> Server_14_6_2.port;
     Switch_14_6_i0.down_port[3] <--> Link_1Gbps <--> Server_14_6_3.port;
     Switch_14_6_i0.down_port[4] <--> Link_1Gbps <--> Server_14_6_4.port;
     Switch_14_6_i0.down_port[5] <--> Link_1Gbps <--> Server_14_6_5.port;
     Switch_14_6_i0.down_port[6] <--> Link_1Gbps <--> Server_14_6_6.port;
     Switch_14_6_i0.down_port[7] <--> Link_1Gbps <--> Server_14_6_7.port;
     Switch_14_7_i0.down_port[0] <--> Link_1Gbps <--> Server_14_7_0.port;
     Switch_14_7_i0.down_port[1] <--> Link_1Gbps <--> Server_14_7_1.port;
     Switch_14_7_i0.down_port[2] <--> Link_1Gbps <--> Server_14_7_2.port;
     Switch_14_7_i0.down_port[3] <--> Link_1Gbps <--> Server_14_7_3.port;
     Switch_14_7_i0.down_port[4] <--> Link_1Gbps <--> Server_14_7_4.port;
     Switch_14_7_i0.down_port[5] <--> Link_1Gbps <--> Server_14_7_5.port;
     Switch_14_7_i0.down_port[6] <--> Link_1Gbps <--> Server_14_7_6.port;
     Switch_14_7_i0.down_port[7] <--> Link_1Gbps <--> Server_14_7_7.port;
     Switch_14_i0.down_port[0] <--> Link_1Gbps <--> Switch_14_0_i0.up_port[0];
     Switch_14_i0.down_port[1] <--> Link_1Gbps <--> Switch_14_1_i0.up_port[0];
     Switch_14_i0.down_port[2] <--> Link_1Gbps <--> Switch_14_2_i0.up_port[0];
     Switch_14_i0.down_port[3] <--> Link_1Gbps <--> Switch_14_3_i0.up_port[0];
     Switch_14_i0.down_port[4] <--> Link_1Gbps <--> Switch_14_4_i0.up_port[0];
     Switch_14_i0.down_port[5] <--> Link_1Gbps <--> Switch_14_5_i0.up_port[0];
     Switch_14_i0.down_port[6] <--> Link_1Gbps <--> Switch_14_6_i0.up_port[0];
     Switch_14_i0.down_port[7] <--> Link_1Gbps <--> Switch_14_7_i0.up_port[0];
     Switch_14_i1.down_port[0] <--> Link_1Gbps <--> Switch_14_0_i0.up_port[1];
     Switch_14_i1.down_port[1] <--> Link_1Gbps <--> Switch_14_1_i0.up_port[1];
     Switch_14_i1.down_port[2] <--> Link_1Gbps <--> Switch_14_2_i0.up_port[1];
     Switch_14_i1.down_port[3] <--> Link_1Gbps <--> Switch_14_3_i0.up_port[1];
     Switch_14_i1.down_port[4] <--> Link_1Gbps <--> Switch_14_4_i0.up_port[1];
     Switch_14_i1.down_port[5] <--> Link_1Gbps <--> Switch_14_5_i0.up_port[1];
     Switch_14_i1.down_port[6] <--> Link_1Gbps <--> Switch_14_6_i0.up_port[1];
     Switch_14_i1.down_port[7] <--> Link_1Gbps <--> Switch_14_7_i0.up_port[1];
     Switch_14_i2.down_port[0] <--> Link_1Gbps <--> Switch_14_0_i0.up_port[2];
     Switch_14_i2.down_port[1] <--> Link_1Gbps <--> Switch_14_1_i0.up_port[2];
     Switch_14_i2.down_port[2] <--> Link_1Gbps <--> Switch_14_2_i0.up_port[2];
     Switch_14_i2.down_port[3] <--> Link_1Gbps <--> Switch_14_3_i0.up_port[2];
     Switch_14_i2.down_port[4] <--> Link_1Gbps <--> Switch_14_4_i0.up_port[2];
     Switch_14_i2.down_port[5] <--> Link_1Gbps <--> Switch_14_5_i0.up_port[2];
     Switch_14_i2.down_port[6] <--> Link_1Gbps <--> Switch_14_6_i0.up_port[2];
     Switch_14_i2.down_port[7] <--> Link_1Gbps <--> Switch_14_7_i0.up_port[2];
     Switch_14_i3.down_port[0] <--> Link_1Gbps <--> Switch_14_0_i0.up_port[3];
     Switch_14_i3.down_port[1] <--> Link_1Gbps <--> Switch_14_1_i0.up_port[3];
     Switch_14_i3.down_port[2] <--> Link_1Gbps <--> Switch_14_2_i0.up_port[3];
     Switch_14_i3.down_port[3] <--> Link_1Gbps <--> Switch_14_3_i0.up_port[3];
     Switch_14_i3.down_port[4] <--> Link_1Gbps <--> Switch_14_4_i0.up_port[3];
     Switch_14_i3.down_port[5] <--> Link_1Gbps <--> Switch_14_5_i0.up_port[3];
     Switch_14_i3.down_port[6] <--> Link_1Gbps <--> Switch_14_6_i0.up_port[3];
     Switch_14_i3.down_port[7] <--> Link_1Gbps <--> Switch_14_7_i0.up_port[3];
     Switch_14_i4.down_port[0] <--> Link_1Gbps <--> Switch_14_0_i0.up_port[4];
     Switch_14_i4.down_port[1] <--> Link_1Gbps <--> Switch_14_1_i0.up_port[4];
     Switch_14_i4.down_port[2] <--> Link_1Gbps <--> Switch_14_2_i0.up_port[4];
     Switch_14_i4.down_port[3] <--> Link_1Gbps <--> Switch_14_3_i0.up_port[4];
     Switch_14_i4.down_port[4] <--> Link_1Gbps <--> Switch_14_4_i0.up_port[4];
     Switch_14_i4.down_port[5] <--> Link_1Gbps <--> Switch_14_5_i0.up_port[4];
     Switch_14_i4.down_port[6] <--> Link_1Gbps <--> Switch_14_6_i0.up_port[4];
     Switch_14_i4.down_port[7] <--> Link_1Gbps <--> Switch_14_7_i0.up_port[4];
     Switch_14_i5.down_port[0] <--> Link_1Gbps <--> Switch_14_0_i0.up_port[5];
     Switch_14_i5.down_port[1] <--> Link_1Gbps <--> Switch_14_1_i0.up_port[5];
     Switch_14_i5.down_port[2] <--> Link_1Gbps <--> Switch_14_2_i0.up_port[5];
     Switch_14_i5.down_port[3] <--> Link_1Gbps <--> Switch_14_3_i0.up_port[5];
     Switch_14_i5.down_port[4] <--> Link_1Gbps <--> Switch_14_4_i0.up_port[5];
     Switch_14_i5.down_port[5] <--> Link_1Gbps <--> Switch_14_5_i0.up_port[5];
     Switch_14_i5.down_port[6] <--> Link_1Gbps <--> Switch_14_6_i0.up_port[5];
     Switch_14_i5.down_port[7] <--> Link_1Gbps <--> Switch_14_7_i0.up_port[5];
     Switch_14_i6.down_port[0] <--> Link_1Gbps <--> Switch_14_0_i0.up_port[6];
     Switch_14_i6.down_port[1] <--> Link_1Gbps <--> Switch_14_1_i0.up_port[6];
     Switch_14_i6.down_port[2] <--> Link_1Gbps <--> Switch_14_2_i0.up_port[6];
     Switch_14_i6.down_port[3] <--> Link_1Gbps <--> Switch_14_3_i0.up_port[6];
     Switch_14_i6.down_port[4] <--> Link_1Gbps <--> Switch_14_4_i0.up_port[6];
     Switch_14_i6.down_port[5] <--> Link_1Gbps <--> Switch_14_5_i0.up_port[6];
     Switch_14_i6.down_port[6] <--> Link_1Gbps <--> Switch_14_6_i0.up_port[6];
     Switch_14_i6.down_port[7] <--> Link_1Gbps <--> Switch_14_7_i0.up_port[6];
     Switch_14_i7.down_port[0] <--> Link_1Gbps <--> Switch_14_0_i0.up_port[7];
     Switch_14_i7.down_port[1] <--> Link_1Gbps <--> Switch_14_1_i0.up_port[7];
     Switch_14_i7.down_port[2] <--> Link_1Gbps <--> Switch_14_2_i0.up_port[7];
     Switch_14_i7.down_port[3] <--> Link_1Gbps <--> Switch_14_3_i0.up_port[7];
     Switch_14_i7.down_port[4] <--> Link_1Gbps <--> Switch_14_4_i0.up_port[7];
     Switch_14_i7.down_port[5] <--> Link_1Gbps <--> Switch_14_5_i0.up_port[7];
     Switch_14_i7.down_port[6] <--> Link_1Gbps <--> Switch_14_6_i0.up_port[7];
     Switch_14_i7.down_port[7] <--> Link_1Gbps <--> Switch_14_7_i0.up_port[7];
     Switch_15_0_i0.down_port[0] <--> Link_1Gbps <--> Server_15_0_0.port;
     Switch_15_0_i0.down_port[1] <--> Link_1Gbps <--> Server_15_0_1.port;
     Switch_15_0_i0.down_port[2] <--> Link_1Gbps <--> Server_15_0_2.port;
     Switch_15_0_i0.down_port[3] <--> Link_1Gbps <--> Server_15_0_3.port;
     Switch_15_0_i0.down_port[4] <--> Link_1Gbps <--> Server_15_0_4.port;
     Switch_15_0_i0.down_port[5] <--> Link_1Gbps <--> Server_15_0_5.port;
     Switch_15_0_i0.down_port[6] <--> Link_1Gbps <--> Server_15_0_6.port;
     Switch_15_0_i0.down_port[7] <--> Link_1Gbps <--> Server_15_0_7.port;
     Switch_15_1_i0.down_port[0] <--> Link_1Gbps <--> Server_15_1_0.port;
     Switch_15_1_i0.down_port[1] <--> Link_1Gbps <--> Server_15_1_1.port;
     Switch_15_1_i0.down_port[2] <--> Link_1Gbps <--> Server_15_1_2.port;
     Switch_15_1_i0.down_port[3] <--> Link_1Gbps <--> Server_15_1_3.port;
     Switch_15_1_i0.down_port[4] <--> Link_1Gbps <--> Server_15_1_4.port;
     Switch_15_1_i0.down_port[5] <--> Link_1Gbps <--> Server_15_1_5.port;
     Switch_15_1_i0.down_port[6] <--> Link_1Gbps <--> Server_15_1_6.port;
     Switch_15_1_i0.down_port[7] <--> Link_1Gbps <--> Server_15_1_7.port;
     Switch_15_2_i0.down_port[0] <--> Link_1Gbps <--> Server_15_2_0.port;
     Switch_15_2_i0.down_port[1] <--> Link_1Gbps <--> Server_15_2_1.port;
     Switch_15_2_i0.down_port[2] <--> Link_1Gbps <--> Server_15_2_2.port;
     Switch_15_2_i0.down_port[3] <--> Link_1Gbps <--> Server_15_2_3.port;
     Switch_15_2_i0.down_port[4] <--> Link_1Gbps <--> Server_15_2_4.port;
     Switch_15_2_i0.down_port[5] <--> Link_1Gbps <--> Server_15_2_5.port;
     Switch_15_2_i0.down_port[6] <--> Link_1Gbps <--> Server_15_2_6.port;
     Switch_15_2_i0.down_port[7] <--> Link_1Gbps <--> Server_15_2_7.port;
     Switch_15_3_i0.down_port[0] <--> Link_1Gbps <--> Server_15_3_0.port;
     Switch_15_3_i0.down_port[1] <--> Link_1Gbps <--> Server_15_3_1.port;
     Switch_15_3_i0.down_port[2] <--> Link_1Gbps <--> Server_15_3_2.port;
     Switch_15_3_i0.down_port[3] <--> Link_1Gbps <--> Server_15_3_3.port;
     Switch_15_3_i0.down_port[4] <--> Link_1Gbps <--> Server_15_3_4.port;
     Switch_15_3_i0.down_port[5] <--> Link_1Gbps <--> Server_15_3_5.port;
     Switch_15_3_i0.down_port[6] <--> Link_1Gbps <--> Server_15_3_6.port;
     Switch_15_3_i0.down_port[7] <--> Link_1Gbps <--> Server_15_3_7.port;
     Switch_15_4_i0.down_port[0] <--> Link_1Gbps <--> Server_15_4_0.port;
     Switch_15_4_i0.down_port[1] <--> Link_1Gbps <--> Server_15_4_1.port;
     Switch_15_4_i0.down_port[2] <--> Link_1Gbps <--> Server_15_4_2.port;
     Switch_15_4_i0.down_port[3] <--> Link_1Gbps <--> Server_15_4_3.port;
     Switch_15_4_i0.down_port[4] <--> Link_1Gbps <--> Server_15_4_4.port;
     Switch_15_4_i0.down_port[5] <--> Link_1Gbps <--> Server_15_4_5.port;
     Switch_15_4_i0.down_port[6] <--> Link_1Gbps <--> Server_15_4_6.port;
     Switch_15_4_i0.down_port[7] <--> Link_1Gbps <--> Server_15_4_7.port;
     Switch_15_5_i0.down_port[0] <--> Link_1Gbps <--> Server_15_5_0.port;
     Switch_15_5_i0.down_port[1] <--> Link_1Gbps <--> Server_15_5_1.port;
     Switch_15_5_i0.down_port[2] <--> Link_1Gbps <--> Server_15_5_2.port;
     Switch_15_5_i0.down_port[3] <--> Link_1Gbps <--> Server_15_5_3.port;
     Switch_15_5_i0.down_port[4] <--> Link_1Gbps <--> Server_15_5_4.port;
     Switch_15_5_i0.down_port[5] <--> Link_1Gbps <--> Server_15_5_5.port;
     Switch_15_5_i0.down_port[6] <--> Link_1Gbps <--> Server_15_5_6.port;
     Switch_15_5_i0.down_port[7] <--> Link_1Gbps <--> Server_15_5_7.port;
     Switch_15_6_i0.down_port[0] <--> Link_1Gbps <--> Server_15_6_0.port;
     Switch_15_6_i0.down_port[1] <--> Link_1Gbps <--> Server_15_6_1.port;
     Switch_15_6_i0.down_port[2] <--> Link_1Gbps <--> Server_15_6_2.port;
     Switch_15_6_i0.down_port[3] <--> Link_1Gbps <--> Server_15_6_3.port;
     Switch_15_6_i0.down_port[4] <--> Link_1Gbps <--> Server_15_6_4.port;
     Switch_15_6_i0.down_port[5] <--> Link_1Gbps <--> Server_15_6_5.port;
     Switch_15_6_i0.down_port[6] <--> Link_1Gbps <--> Server_15_6_6.port;
     Switch_15_6_i0.down_port[7] <--> Link_1Gbps <--> Server_15_6_7.port;
     Switch_15_7_i0.down_port[0] <--> Link_1Gbps <--> Server_15_7_0.port;
     Switch_15_7_i0.down_port[1] <--> Link_1Gbps <--> Server_15_7_1.port;
     Switch_15_7_i0.down_port[2] <--> Link_1Gbps <--> Server_15_7_2.port;
     Switch_15_7_i0.down_port[3] <--> Link_1Gbps <--> Server_15_7_3.port;
     Switch_15_7_i0.down_port[4] <--> Link_1Gbps <--> Server_15_7_4.port;
     Switch_15_7_i0.down_port[5] <--> Link_1Gbps <--> Server_15_7_5.port;
     Switch_15_7_i0.down_port[6] <--> Link_1Gbps <--> Server_15_7_6.port;
     Switch_15_7_i0.down_port[7] <--> Link_1Gbps <--> Server_15_7_7.port;
     Switch_15_i0.down_port[0] <--> Link_1Gbps <--> Switch_15_0_i0.up_port[0];
     Switch_15_i0.down_port[1] <--> Link_1Gbps <--> Switch_15_1_i0.up_port[0];
     Switch_15_i0.down_port[2] <--> Link_1Gbps <--> Switch_15_2_i0.up_port[0];
     Switch_15_i0.down_port[3] <--> Link_1Gbps <--> Switch_15_3_i0.up_port[0];
     Switch_15_i0.down_port[4] <--> Link_1Gbps <--> Switch_15_4_i0.up_port[0];
     Switch_15_i0.down_port[5] <--> Link_1Gbps <--> Switch_15_5_i0.up_port[0];
     Switch_15_i0.down_port[6] <--> Link_1Gbps <--> Switch_15_6_i0.up_port[0];
     Switch_15_i0.down_port[7] <--> Link_1Gbps <--> Switch_15_7_i0.up_port[0];
     Switch_15_i1.down_port[0] <--> Link_1Gbps <--> Switch_15_0_i0.up_port[1];
     Switch_15_i1.down_port[1] <--> Link_1Gbps <--> Switch_15_1_i0.up_port[1];
     Switch_15_i1.down_port[2] <--> Link_1Gbps <--> Switch_15_2_i0.up_port[1];
     Switch_15_i1.down_port[3] <--> Link_1Gbps <--> Switch_15_3_i0.up_port[1];
     Switch_15_i1.down_port[4] <--> Link_1Gbps <--> Switch_15_4_i0.up_port[1];
     Switch_15_i1.down_port[5] <--> Link_1Gbps <--> Switch_15_5_i0.up_port[1];
     Switch_15_i1.down_port[6] <--> Link_1Gbps <--> Switch_15_6_i0.up_port[1];
     Switch_15_i1.down_port[7] <--> Link_1Gbps <--> Switch_15_7_i0.up_port[1];
     Switch_15_i2.down_port[0] <--> Link_1Gbps <--> Switch_15_0_i0.up_port[2];
     Switch_15_i2.down_port[1] <--> Link_1Gbps <--> Switch_15_1_i0.up_port[2];
     Switch_15_i2.down_port[2] <--> Link_1Gbps <--> Switch_15_2_i0.up_port[2];
     Switch_15_i2.down_port[3] <--> Link_1Gbps <--> Switch_15_3_i0.up_port[2];
     Switch_15_i2.down_port[4] <--> Link_1Gbps <--> Switch_15_4_i0.up_port[2];
     Switch_15_i2.down_port[5] <--> Link_1Gbps <--> Switch_15_5_i0.up_port[2];
     Switch_15_i2.down_port[6] <--> Link_1Gbps <--> Switch_15_6_i0.up_port[2];
     Switch_15_i2.down_port[7] <--> Link_1Gbps <--> Switch_15_7_i0.up_port[2];
     Switch_15_i3.down_port[0] <--> Link_1Gbps <--> Switch_15_0_i0.up_port[3];
     Switch_15_i3.down_port[1] <--> Link_1Gbps <--> Switch_15_1_i0.up_port[3];
     Switch_15_i3.down_port[2] <--> Link_1Gbps <--> Switch_15_2_i0.up_port[3];
     Switch_15_i3.down_port[3] <--> Link_1Gbps <--> Switch_15_3_i0.up_port[3];
     Switch_15_i3.down_port[4] <--> Link_1Gbps <--> Switch_15_4_i0.up_port[3];
     Switch_15_i3.down_port[5] <--> Link_1Gbps <--> Switch_15_5_i0.up_port[3];
     Switch_15_i3.down_port[6] <--> Link_1Gbps <--> Switch_15_6_i0.up_port[3];
     Switch_15_i3.down_port[7] <--> Link_1Gbps <--> Switch_15_7_i0.up_port[3];
     Switch_15_i4.down_port[0] <--> Link_1Gbps <--> Switch_15_0_i0.up_port[4];
     Switch_15_i4.down_port[1] <--> Link_1Gbps <--> Switch_15_1_i0.up_port[4];
     Switch_15_i4.down_port[2] <--> Link_1Gbps <--> Switch_15_2_i0.up_port[4];
     Switch_15_i4.down_port[3] <--> Link_1Gbps <--> Switch_15_3_i0.up_port[4];
     Switch_15_i4.down_port[4] <--> Link_1Gbps <--> Switch_15_4_i0.up_port[4];
     Switch_15_i4.down_port[5] <--> Link_1Gbps <--> Switch_15_5_i0.up_port[4];
     Switch_15_i4.down_port[6] <--> Link_1Gbps <--> Switch_15_6_i0.up_port[4];
     Switch_15_i4.down_port[7] <--> Link_1Gbps <--> Switch_15_7_i0.up_port[4];
     Switch_15_i5.down_port[0] <--> Link_1Gbps <--> Switch_15_0_i0.up_port[5];
     Switch_15_i5.down_port[1] <--> Link_1Gbps <--> Switch_15_1_i0.up_port[5];
     Switch_15_i5.down_port[2] <--> Link_1Gbps <--> Switch_15_2_i0.up_port[5];
     Switch_15_i5.down_port[3] <--> Link_1Gbps <--> Switch_15_3_i0.up_port[5];
     Switch_15_i5.down_port[4] <--> Link_1Gbps <--> Switch_15_4_i0.up_port[5];
     Switch_15_i5.down_port[5] <--> Link_1Gbps <--> Switch_15_5_i0.up_port[5];
     Switch_15_i5.down_port[6] <--> Link_1Gbps <--> Switch_15_6_i0.up_port[5];
     Switch_15_i5.down_port[7] <--> Link_1Gbps <--> Switch_15_7_i0.up_port[5];
     Switch_15_i6.down_port[0] <--> Link_1Gbps <--> Switch_15_0_i0.up_port[6];
     Switch_15_i6.down_port[1] <--> Link_1Gbps <--> Switch_15_1_i0.up_port[6];
     Switch_15_i6.down_port[2] <--> Link_1Gbps <--> Switch_15_2_i0.up_port[6];
     Switch_15_i6.down_port[3] <--> Link_1Gbps <--> Switch_15_3_i0.up_port[6];
     Switch_15_i6.down_port[4] <--> Link_1Gbps <--> Switch_15_4_i0.up_port[6];
     Switch_15_i6.down_port[5] <--> Link_1Gbps <--> Switch_15_5_i0.up_port[6];
     Switch_15_i6.down_port[6] <--> Link_1Gbps <--> Switch_15_6_i0.up_port[6];
     Switch_15_i6.down_port[7] <--> Link_1Gbps <--> Switch_15_7_i0.up_port[6];
     Switch_15_i7.down_port[0] <--> Link_1Gbps <--> Switch_15_0_i0.up_port[7];
     Switch_15_i7.down_port[1] <--> Link_1Gbps <--> Switch_15_1_i0.up_port[7];
     Switch_15_i7.down_port[2] <--> Link_1Gbps <--> Switch_15_2_i0.up_port[7];
     Switch_15_i7.down_port[3] <--> Link_1Gbps <--> Switch_15_3_i0.up_port[7];
     Switch_15_i7.down_port[4] <--> Link_1Gbps <--> Switch_15_4_i0.up_port[7];
     Switch_15_i7.down_port[5] <--> Link_1Gbps <--> Switch_15_5_i0.up_port[7];
     Switch_15_i7.down_port[6] <--> Link_1Gbps <--> Switch_15_6_i0.up_port[7];
     Switch_15_i7.down_port[7] <--> Link_1Gbps <--> Switch_15_7_i0.up_port[7];
     Switch_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_i0.up_port[0];
     Switch_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_i0.up_port[0];
     Switch_i0.down_port[2] <--> Link_1Gbps <--> Switch_2_i0.up_port[0];
     Switch_i0.down_port[3] <--> Link_1Gbps <--> Switch_3_i0.up_port[0];
     Switch_i0.down_port[4] <--> Link_1Gbps <--> Switch_4_i0.up_port[0];
     Switch_i0.down_port[5] <--> Link_1Gbps <--> Switch_5_i0.up_port[0];
     Switch_i0.down_port[6] <--> Link_1Gbps <--> Switch_6_i0.up_port[0];
     Switch_i0.down_port[7] <--> Link_1Gbps <--> Switch_7_i0.up_port[0];
     Switch_i0.down_port[8] <--> Link_1Gbps <--> Switch_8_i0.up_port[0];
     Switch_i0.down_port[9] <--> Link_1Gbps <--> Switch_9_i0.up_port[0];
     Switch_i0.down_port[10] <--> Link_1Gbps <--> Switch_10_i0.up_port[0];
     Switch_i0.down_port[11] <--> Link_1Gbps <--> Switch_11_i0.up_port[0];
     Switch_i0.down_port[12] <--> Link_1Gbps <--> Switch_12_i0.up_port[0];
     Switch_i0.down_port[13] <--> Link_1Gbps <--> Switch_13_i0.up_port[0];
     Switch_i0.down_port[14] <--> Link_1Gbps <--> Switch_14_i0.up_port[0];
     Switch_i0.down_port[15] <--> Link_1Gbps <--> Switch_15_i0.up_port[0];
     Switch_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_i0.up_port[1];
     Switch_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_i0.up_port[1];
     Switch_i1.down_port[2] <--> Link_1Gbps <--> Switch_2_i0.up_port[1];
     Switch_i1.down_port[3] <--> Link_1Gbps <--> Switch_3_i0.up_port[1];
     Switch_i1.down_port[4] <--> Link_1Gbps <--> Switch_4_i0.up_port[1];
     Switch_i1.down_port[5] <--> Link_1Gbps <--> Switch_5_i0.up_port[1];
     Switch_i1.down_port[6] <--> Link_1Gbps <--> Switch_6_i0.up_port[1];
     Switch_i1.down_port[7] <--> Link_1Gbps <--> Switch_7_i0.up_port[1];
     Switch_i1.down_port[8] <--> Link_1Gbps <--> Switch_8_i0.up_port[1];
     Switch_i1.down_port[9] <--> Link_1Gbps <--> Switch_9_i0.up_port[1];
     Switch_i1.down_port[10] <--> Link_1Gbps <--> Switch_10_i0.up_port[1];
     Switch_i1.down_port[11] <--> Link_1Gbps <--> Switch_11_i0.up_port[1];
     Switch_i1.down_port[12] <--> Link_1Gbps <--> Switch_12_i0.up_port[1];
     Switch_i1.down_port[13] <--> Link_1Gbps <--> Switch_13_i0.up_port[1];
     Switch_i1.down_port[14] <--> Link_1Gbps <--> Switch_14_i0.up_port[1];
     Switch_i1.down_port[15] <--> Link_1Gbps <--> Switch_15_i0.up_port[1];
     Switch_i2.down_port[0] <--> Link_1Gbps <--> Switch_0_i0.up_port[2];
     Switch_i2.down_port[1] <--> Link_1Gbps <--> Switch_1_i0.up_port[2];
     Switch_i2.down_port[2] <--> Link_1Gbps <--> Switch_2_i0.up_port[2];
     Switch_i2.down_port[3] <--> Link_1Gbps <--> Switch_3_i0.up_port[2];
     Switch_i2.down_port[4] <--> Link_1Gbps <--> Switch_4_i0.up_port[2];
     Switch_i2.down_port[5] <--> Link_1Gbps <--> Switch_5_i0.up_port[2];
     Switch_i2.down_port[6] <--> Link_1Gbps <--> Switch_6_i0.up_port[2];
     Switch_i2.down_port[7] <--> Link_1Gbps <--> Switch_7_i0.up_port[2];
     Switch_i2.down_port[8] <--> Link_1Gbps <--> Switch_8_i0.up_port[2];
     Switch_i2.down_port[9] <--> Link_1Gbps <--> Switch_9_i0.up_port[2];
     Switch_i2.down_port[10] <--> Link_1Gbps <--> Switch_10_i0.up_port[2];
     Switch_i2.down_port[11] <--> Link_1Gbps <--> Switch_11_i0.up_port[2];
     Switch_i2.down_port[12] <--> Link_1Gbps <--> Switch_12_i0.up_port[2];
     Switch_i2.down_port[13] <--> Link_1Gbps <--> Switch_13_i0.up_port[2];
     Switch_i2.down_port[14] <--> Link_1Gbps <--> Switch_14_i0.up_port[2];
     Switch_i2.down_port[15] <--> Link_1Gbps <--> Switch_15_i0.up_port[2];
     Switch_i3.down_port[0] <--> Link_1Gbps <--> Switch_0_i0.up_port[3];
     Switch_i3.down_port[1] <--> Link_1Gbps <--> Switch_1_i0.up_port[3];
     Switch_i3.down_port[2] <--> Link_1Gbps <--> Switch_2_i0.up_port[3];
     Switch_i3.down_port[3] <--> Link_1Gbps <--> Switch_3_i0.up_port[3];
     Switch_i3.down_port[4] <--> Link_1Gbps <--> Switch_4_i0.up_port[3];
     Switch_i3.down_port[5] <--> Link_1Gbps <--> Switch_5_i0.up_port[3];
     Switch_i3.down_port[6] <--> Link_1Gbps <--> Switch_6_i0.up_port[3];
     Switch_i3.down_port[7] <--> Link_1Gbps <--> Switch_7_i0.up_port[3];
     Switch_i3.down_port[8] <--> Link_1Gbps <--> Switch_8_i0.up_port[3];
     Switch_i3.down_port[9] <--> Link_1Gbps <--> Switch_9_i0.up_port[3];
     Switch_i3.down_port[10] <--> Link_1Gbps <--> Switch_10_i0.up_port[3];
     Switch_i3.down_port[11] <--> Link_1Gbps <--> Switch_11_i0.up_port[3];
     Switch_i3.down_port[12] <--> Link_1Gbps <--> Switch_12_i0.up_port[3];
     Switch_i3.down_port[13] <--> Link_1Gbps <--> Switch_13_i0.up_port[3];
     Switch_i3.down_port[14] <--> Link_1Gbps <--> Switch_14_i0.up_port[3];
     Switch_i3.down_port[15] <--> Link_1Gbps <--> Switch_15_i0.up_port[3];
     Switch_i4.down_port[0] <--> Link_1Gbps <--> Switch_0_i0.up_port[4];
     Switch_i4.down_port[1] <--> Link_1Gbps <--> Switch_1_i0.up_port[4];
     Switch_i4.down_port[2] <--> Link_1Gbps <--> Switch_2_i0.up_port[4];
     Switch_i4.down_port[3] <--> Link_1Gbps <--> Switch_3_i0.up_port[4];
     Switch_i4.down_port[4] <--> Link_1Gbps <--> Switch_4_i0.up_port[4];
     Switch_i4.down_port[5] <--> Link_1Gbps <--> Switch_5_i0.up_port[4];
     Switch_i4.down_port[6] <--> Link_1Gbps <--> Switch_6_i0.up_port[4];
     Switch_i4.down_port[7] <--> Link_1Gbps <--> Switch_7_i0.up_port[4];
     Switch_i4.down_port[8] <--> Link_1Gbps <--> Switch_8_i0.up_port[4];
     Switch_i4.down_port[9] <--> Link_1Gbps <--> Switch_9_i0.up_port[4];
     Switch_i4.down_port[10] <--> Link_1Gbps <--> Switch_10_i0.up_port[4];
     Switch_i4.down_port[11] <--> Link_1Gbps <--> Switch_11_i0.up_port[4];
     Switch_i4.down_port[12] <--> Link_1Gbps <--> Switch_12_i0.up_port[4];
     Switch_i4.down_port[13] <--> Link_1Gbps <--> Switch_13_i0.up_port[4];
     Switch_i4.down_port[14] <--> Link_1Gbps <--> Switch_14_i0.up_port[4];
     Switch_i4.down_port[15] <--> Link_1Gbps <--> Switch_15_i0.up_port[4];
     Switch_i5.down_port[0] <--> Link_1Gbps <--> Switch_0_i0.up_port[5];
     Switch_i5.down_port[1] <--> Link_1Gbps <--> Switch_1_i0.up_port[5];
     Switch_i5.down_port[2] <--> Link_1Gbps <--> Switch_2_i0.up_port[5];
     Switch_i5.down_port[3] <--> Link_1Gbps <--> Switch_3_i0.up_port[5];
     Switch_i5.down_port[4] <--> Link_1Gbps <--> Switch_4_i0.up_port[5];
     Switch_i5.down_port[5] <--> Link_1Gbps <--> Switch_5_i0.up_port[5];
     Switch_i5.down_port[6] <--> Link_1Gbps <--> Switch_6_i0.up_port[5];
     Switch_i5.down_port[7] <--> Link_1Gbps <--> Switch_7_i0.up_port[5];
     Switch_i5.down_port[8] <--> Link_1Gbps <--> Switch_8_i0.up_port[5];
     Switch_i5.down_port[9] <--> Link_1Gbps <--> Switch_9_i0.up_port[5];
     Switch_i5.down_port[10] <--> Link_1Gbps <--> Switch_10_i0.up_port[5];
     Switch_i5.down_port[11] <--> Link_1Gbps <--> Switch_11_i0.up_port[5];
     Switch_i5.down_port[12] <--> Link_1Gbps <--> Switch_12_i0.up_port[5];
     Switch_i5.down_port[13] <--> Link_1Gbps <--> Switch_13_i0.up_port[5];
     Switch_i5.down_port[14] <--> Link_1Gbps <--> Switch_14_i0.up_port[5];
     Switch_i5.down_port[15] <--> Link_1Gbps <--> Switch_15_i0.up_port[5];
     Switch_i6.down_port[0] <--> Link_1Gbps <--> Switch_0_i0.up_port[6];
     Switch_i6.down_port[1] <--> Link_1Gbps <--> Switch_1_i0.up_port[6];
     Switch_i6.down_port[2] <--> Link_1Gbps <--> Switch_2_i0.up_port[6];
     Switch_i6.down_port[3] <--> Link_1Gbps <--> Switch_3_i0.up_port[6];
     Switch_i6.down_port[4] <--> Link_1Gbps <--> Switch_4_i0.up_port[6];
     Switch_i6.down_port[5] <--> Link_1Gbps <--> Switch_5_i0.up_port[6];
     Switch_i6.down_port[6] <--> Link_1Gbps <--> Switch_6_i0.up_port[6];
     Switch_i6.down_port[7] <--> Link_1Gbps <--> Switch_7_i0.up_port[6];
     Switch_i6.down_port[8] <--> Link_1Gbps <--> Switch_8_i0.up_port[6];
     Switch_i6.down_port[9] <--> Link_1Gbps <--> Switch_9_i0.up_port[6];
     Switch_i6.down_port[10] <--> Link_1Gbps <--> Switch_10_i0.up_port[6];
     Switch_i6.down_port[11] <--> Link_1Gbps <--> Switch_11_i0.up_port[6];
     Switch_i6.down_port[12] <--> Link_1Gbps <--> Switch_12_i0.up_port[6];
     Switch_i6.down_port[13] <--> Link_1Gbps <--> Switch_13_i0.up_port[6];
     Switch_i6.down_port[14] <--> Link_1Gbps <--> Switch_14_i0.up_port[6];
     Switch_i6.down_port[15] <--> Link_1Gbps <--> Switch_15_i0.up_port[6];
     Switch_i7.down_port[0] <--> Link_1Gbps <--> Switch_0_i0.up_port[7];
     Switch_i7.down_port[1] <--> Link_1Gbps <--> Switch_1_i0.up_port[7];
     Switch_i7.down_port[2] <--> Link_1Gbps <--> Switch_2_i0.up_port[7];
     Switch_i7.down_port[3] <--> Link_1Gbps <--> Switch_3_i0.up_port[7];
     Switch_i7.down_port[4] <--> Link_1Gbps <--> Switch_4_i0.up_port[7];
     Switch_i7.down_port[5] <--> Link_1Gbps <--> Switch_5_i0.up_port[7];
     Switch_i7.down_port[6] <--> Link_1Gbps <--> Switch_6_i0.up_port[7];
     Switch_i7.down_port[7] <--> Link_1Gbps <--> Switch_7_i0.up_port[7];
     Switch_i7.down_port[8] <--> Link_1Gbps <--> Switch_8_i0.up_port[7];
     Switch_i7.down_port[9] <--> Link_1Gbps <--> Switch_9_i0.up_port[7];
     Switch_i7.down_port[10] <--> Link_1Gbps <--> Switch_10_i0.up_port[7];
     Switch_i7.down_port[11] <--> Link_1Gbps <--> Switch_11_i0.up_port[7];
     Switch_i7.down_port[12] <--> Link_1Gbps <--> Switch_12_i0.up_port[7];
     Switch_i7.down_port[13] <--> Link_1Gbps <--> Switch_13_i0.up_port[7];
     Switch_i7.down_port[14] <--> Link_1Gbps <--> Switch_14_i0.up_port[7];
     Switch_i7.down_port[15] <--> Link_1Gbps <--> Switch_15_i0.up_port[7];
     Switch_i8.down_port[0] <--> Link_1Gbps <--> Switch_0_i1.up_port[0];
     Switch_i8.down_port[1] <--> Link_1Gbps <--> Switch_1_i1.up_port[0];
     Switch_i8.down_port[2] <--> Link_1Gbps <--> Switch_2_i1.up_port[0];
     Switch_i8.down_port[3] <--> Link_1Gbps <--> Switch_3_i1.up_port[0];
     Switch_i8.down_port[4] <--> Link_1Gbps <--> Switch_4_i1.up_port[0];
     Switch_i8.down_port[5] <--> Link_1Gbps <--> Switch_5_i1.up_port[0];
     Switch_i8.down_port[6] <--> Link_1Gbps <--> Switch_6_i1.up_port[0];
     Switch_i8.down_port[7] <--> Link_1Gbps <--> Switch_7_i1.up_port[0];
     Switch_i8.down_port[8] <--> Link_1Gbps <--> Switch_8_i1.up_port[0];
     Switch_i8.down_port[9] <--> Link_1Gbps <--> Switch_9_i1.up_port[0];
     Switch_i8.down_port[10] <--> Link_1Gbps <--> Switch_10_i1.up_port[0];
     Switch_i8.down_port[11] <--> Link_1Gbps <--> Switch_11_i1.up_port[0];
     Switch_i8.down_port[12] <--> Link_1Gbps <--> Switch_12_i1.up_port[0];
     Switch_i8.down_port[13] <--> Link_1Gbps <--> Switch_13_i1.up_port[0];
     Switch_i8.down_port[14] <--> Link_1Gbps <--> Switch_14_i1.up_port[0];
     Switch_i8.down_port[15] <--> Link_1Gbps <--> Switch_15_i1.up_port[0];
     Switch_i9.down_port[0] <--> Link_1Gbps <--> Switch_0_i1.up_port[1];
     Switch_i9.down_port[1] <--> Link_1Gbps <--> Switch_1_i1.up_port[1];
     Switch_i9.down_port[2] <--> Link_1Gbps <--> Switch_2_i1.up_port[1];
     Switch_i9.down_port[3] <--> Link_1Gbps <--> Switch_3_i1.up_port[1];
     Switch_i9.down_port[4] <--> Link_1Gbps <--> Switch_4_i1.up_port[1];
     Switch_i9.down_port[5] <--> Link_1Gbps <--> Switch_5_i1.up_port[1];
     Switch_i9.down_port[6] <--> Link_1Gbps <--> Switch_6_i1.up_port[1];
     Switch_i9.down_port[7] <--> Link_1Gbps <--> Switch_7_i1.up_port[1];
     Switch_i9.down_port[8] <--> Link_1Gbps <--> Switch_8_i1.up_port[1];
     Switch_i9.down_port[9] <--> Link_1Gbps <--> Switch_9_i1.up_port[1];
     Switch_i9.down_port[10] <--> Link_1Gbps <--> Switch_10_i1.up_port[1];
     Switch_i9.down_port[11] <--> Link_1Gbps <--> Switch_11_i1.up_port[1];
     Switch_i9.down_port[12] <--> Link_1Gbps <--> Switch_12_i1.up_port[1];
     Switch_i9.down_port[13] <--> Link_1Gbps <--> Switch_13_i1.up_port[1];
     Switch_i9.down_port[14] <--> Link_1Gbps <--> Switch_14_i1.up_port[1];
     Switch_i9.down_port[15] <--> Link_1Gbps <--> Switch_15_i1.up_port[1];
     Switch_i10.down_port[0] <--> Link_1Gbps <--> Switch_0_i1.up_port[2];
     Switch_i10.down_port[1] <--> Link_1Gbps <--> Switch_1_i1.up_port[2];
     Switch_i10.down_port[2] <--> Link_1Gbps <--> Switch_2_i1.up_port[2];
     Switch_i10.down_port[3] <--> Link_1Gbps <--> Switch_3_i1.up_port[2];
     Switch_i10.down_port[4] <--> Link_1Gbps <--> Switch_4_i1.up_port[2];
     Switch_i10.down_port[5] <--> Link_1Gbps <--> Switch_5_i1.up_port[2];
     Switch_i10.down_port[6] <--> Link_1Gbps <--> Switch_6_i1.up_port[2];
     Switch_i10.down_port[7] <--> Link_1Gbps <--> Switch_7_i1.up_port[2];
     Switch_i10.down_port[8] <--> Link_1Gbps <--> Switch_8_i1.up_port[2];
     Switch_i10.down_port[9] <--> Link_1Gbps <--> Switch_9_i1.up_port[2];
     Switch_i10.down_port[10] <--> Link_1Gbps <--> Switch_10_i1.up_port[2];
     Switch_i10.down_port[11] <--> Link_1Gbps <--> Switch_11_i1.up_port[2];
     Switch_i10.down_port[12] <--> Link_1Gbps <--> Switch_12_i1.up_port[2];
     Switch_i10.down_port[13] <--> Link_1Gbps <--> Switch_13_i1.up_port[2];
     Switch_i10.down_port[14] <--> Link_1Gbps <--> Switch_14_i1.up_port[2];
     Switch_i10.down_port[15] <--> Link_1Gbps <--> Switch_15_i1.up_port[2];
     Switch_i11.down_port[0] <--> Link_1Gbps <--> Switch_0_i1.up_port[3];
     Switch_i11.down_port[1] <--> Link_1Gbps <--> Switch_1_i1.up_port[3];
     Switch_i11.down_port[2] <--> Link_1Gbps <--> Switch_2_i1.up_port[3];
     Switch_i11.down_port[3] <--> Link_1Gbps <--> Switch_3_i1.up_port[3];
     Switch_i11.down_port[4] <--> Link_1Gbps <--> Switch_4_i1.up_port[3];
     Switch_i11.down_port[5] <--> Link_1Gbps <--> Switch_5_i1.up_port[3];
     Switch_i11.down_port[6] <--> Link_1Gbps <--> Switch_6_i1.up_port[3];
     Switch_i11.down_port[7] <--> Link_1Gbps <--> Switch_7_i1.up_port[3];
     Switch_i11.down_port[8] <--> Link_1Gbps <--> Switch_8_i1.up_port[3];
     Switch_i11.down_port[9] <--> Link_1Gbps <--> Switch_9_i1.up_port[3];
     Switch_i11.down_port[10] <--> Link_1Gbps <--> Switch_10_i1.up_port[3];
     Switch_i11.down_port[11] <--> Link_1Gbps <--> Switch_11_i1.up_port[3];
     Switch_i11.down_port[12] <--> Link_1Gbps <--> Switch_12_i1.up_port[3];
     Switch_i11.down_port[13] <--> Link_1Gbps <--> Switch_13_i1.up_port[3];
     Switch_i11.down_port[14] <--> Link_1Gbps <--> Switch_14_i1.up_port[3];
     Switch_i11.down_port[15] <--> Link_1Gbps <--> Switch_15_i1.up_port[3];
     Switch_i12.down_port[0] <--> Link_1Gbps <--> Switch_0_i1.up_port[4];
     Switch_i12.down_port[1] <--> Link_1Gbps <--> Switch_1_i1.up_port[4];
     Switch_i12.down_port[2] <--> Link_1Gbps <--> Switch_2_i1.up_port[4];
     Switch_i12.down_port[3] <--> Link_1Gbps <--> Switch_3_i1.up_port[4];
     Switch_i12.down_port[4] <--> Link_1Gbps <--> Switch_4_i1.up_port[4];
     Switch_i12.down_port[5] <--> Link_1Gbps <--> Switch_5_i1.up_port[4];
     Switch_i12.down_port[6] <--> Link_1Gbps <--> Switch_6_i1.up_port[4];
     Switch_i12.down_port[7] <--> Link_1Gbps <--> Switch_7_i1.up_port[4];
     Switch_i12.down_port[8] <--> Link_1Gbps <--> Switch_8_i1.up_port[4];
     Switch_i12.down_port[9] <--> Link_1Gbps <--> Switch_9_i1.up_port[4];
     Switch_i12.down_port[10] <--> Link_1Gbps <--> Switch_10_i1.up_port[4];
     Switch_i12.down_port[11] <--> Link_1Gbps <--> Switch_11_i1.up_port[4];
     Switch_i12.down_port[12] <--> Link_1Gbps <--> Switch_12_i1.up_port[4];
     Switch_i12.down_port[13] <--> Link_1Gbps <--> Switch_13_i1.up_port[4];
     Switch_i12.down_port[14] <--> Link_1Gbps <--> Switch_14_i1.up_port[4];
     Switch_i12.down_port[15] <--> Link_1Gbps <--> Switch_15_i1.up_port[4];
     Switch_i13.down_port[0] <--> Link_1Gbps <--> Switch_0_i1.up_port[5];
     Switch_i13.down_port[1] <--> Link_1Gbps <--> Switch_1_i1.up_port[5];
     Switch_i13.down_port[2] <--> Link_1Gbps <--> Switch_2_i1.up_port[5];
     Switch_i13.down_port[3] <--> Link_1Gbps <--> Switch_3_i1.up_port[5];
     Switch_i13.down_port[4] <--> Link_1Gbps <--> Switch_4_i1.up_port[5];
     Switch_i13.down_port[5] <--> Link_1Gbps <--> Switch_5_i1.up_port[5];
     Switch_i13.down_port[6] <--> Link_1Gbps <--> Switch_6_i1.up_port[5];
     Switch_i13.down_port[7] <--> Link_1Gbps <--> Switch_7_i1.up_port[5];
     Switch_i13.down_port[8] <--> Link_1Gbps <--> Switch_8_i1.up_port[5];
     Switch_i13.down_port[9] <--> Link_1Gbps <--> Switch_9_i1.up_port[5];
     Switch_i13.down_port[10] <--> Link_1Gbps <--> Switch_10_i1.up_port[5];
     Switch_i13.down_port[11] <--> Link_1Gbps <--> Switch_11_i1.up_port[5];
     Switch_i13.down_port[12] <--> Link_1Gbps <--> Switch_12_i1.up_port[5];
     Switch_i13.down_port[13] <--> Link_1Gbps <--> Switch_13_i1.up_port[5];
     Switch_i13.down_port[14] <--> Link_1Gbps <--> Switch_14_i1.up_port[5];
     Switch_i13.down_port[15] <--> Link_1Gbps <--> Switch_15_i1.up_port[5];
     Switch_i14.down_port[0] <--> Link_1Gbps <--> Switch_0_i1.up_port[6];
     Switch_i14.down_port[1] <--> Link_1Gbps <--> Switch_1_i1.up_port[6];
     Switch_i14.down_port[2] <--> Link_1Gbps <--> Switch_2_i1.up_port[6];
     Switch_i14.down_port[3] <--> Link_1Gbps <--> Switch_3_i1.up_port[6];
     Switch_i14.down_port[4] <--> Link_1Gbps <--> Switch_4_i1.up_port[6];
     Switch_i14.down_port[5] <--> Link_1Gbps <--> Switch_5_i1.up_port[6];
     Switch_i14.down_port[6] <--> Link_1Gbps <--> Switch_6_i1.up_port[6];
     Switch_i14.down_port[7] <--> Link_1Gbps <--> Switch_7_i1.up_port[6];
     Switch_i14.down_port[8] <--> Link_1Gbps <--> Switch_8_i1.up_port[6];
     Switch_i14.down_port[9] <--> Link_1Gbps <--> Switch_9_i1.up_port[6];
     Switch_i14.down_port[10] <--> Link_1Gbps <--> Switch_10_i1.up_port[6];
     Switch_i14.down_port[11] <--> Link_1Gbps <--> Switch_11_i1.up_port[6];
     Switch_i14.down_port[12] <--> Link_1Gbps <--> Switch_12_i1.up_port[6];
     Switch_i14.down_port[13] <--> Link_1Gbps <--> Switch_13_i1.up_port[6];
     Switch_i14.down_port[14] <--> Link_1Gbps <--> Switch_14_i1.up_port[6];
     Switch_i14.down_port[15] <--> Link_1Gbps <--> Switch_15_i1.up_port[6];
     Switch_i15.down_port[0] <--> Link_1Gbps <--> Switch_0_i1.up_port[7];
     Switch_i15.down_port[1] <--> Link_1Gbps <--> Switch_1_i1.up_port[7];
     Switch_i15.down_port[2] <--> Link_1Gbps <--> Switch_2_i1.up_port[7];
     Switch_i15.down_port[3] <--> Link_1Gbps <--> Switch_3_i1.up_port[7];
     Switch_i15.down_port[4] <--> Link_1Gbps <--> Switch_4_i1.up_port[7];
     Switch_i15.down_port[5] <--> Link_1Gbps <--> Switch_5_i1.up_port[7];
     Switch_i15.down_port[6] <--> Link_1Gbps <--> Switch_6_i1.up_port[7];
     Switch_i15.down_port[7] <--> Link_1Gbps <--> Switch_7_i1.up_port[7];
     Switch_i15.down_port[8] <--> Link_1Gbps <--> Switch_8_i1.up_port[7];
     Switch_i15.down_port[9] <--> Link_1Gbps <--> Switch_9_i1.up_port[7];
     Switch_i15.down_port[10] <--> Link_1Gbps <--> Switch_10_i1.up_port[7];
     Switch_i15.down_port[11] <--> Link_1Gbps <--> Switch_11_i1.up_port[7];
     Switch_i15.down_port[12] <--> Link_1Gbps <--> Switch_12_i1.up_port[7];
     Switch_i15.down_port[13] <--> Link_1Gbps <--> Switch_13_i1.up_port[7];
     Switch_i15.down_port[14] <--> Link_1Gbps <--> Switch_14_i1.up_port[7];
     Switch_i15.down_port[15] <--> Link_1Gbps <--> Switch_15_i1.up_port[7];
     Switch_i16.down_port[0] <--> Link_1Gbps <--> Switch_0_i2.up_port[0];
     Switch_i16.down_port[1] <--> Link_1Gbps <--> Switch_1_i2.up_port[0];
     Switch_i16.down_port[2] <--> Link_1Gbps <--> Switch_2_i2.up_port[0];
     Switch_i16.down_port[3] <--> Link_1Gbps <--> Switch_3_i2.up_port[0];
     Switch_i16.down_port[4] <--> Link_1Gbps <--> Switch_4_i2.up_port[0];
     Switch_i16.down_port[5] <--> Link_1Gbps <--> Switch_5_i2.up_port[0];
     Switch_i16.down_port[6] <--> Link_1Gbps <--> Switch_6_i2.up_port[0];
     Switch_i16.down_port[7] <--> Link_1Gbps <--> Switch_7_i2.up_port[0];
     Switch_i16.down_port[8] <--> Link_1Gbps <--> Switch_8_i2.up_port[0];
     Switch_i16.down_port[9] <--> Link_1Gbps <--> Switch_9_i2.up_port[0];
     Switch_i16.down_port[10] <--> Link_1Gbps <--> Switch_10_i2.up_port[0];
     Switch_i16.down_port[11] <--> Link_1Gbps <--> Switch_11_i2.up_port[0];
     Switch_i16.down_port[12] <--> Link_1Gbps <--> Switch_12_i2.up_port[0];
     Switch_i16.down_port[13] <--> Link_1Gbps <--> Switch_13_i2.up_port[0];
     Switch_i16.down_port[14] <--> Link_1Gbps <--> Switch_14_i2.up_port[0];
     Switch_i16.down_port[15] <--> Link_1Gbps <--> Switch_15_i2.up_port[0];
     Switch_i17.down_port[0] <--> Link_1Gbps <--> Switch_0_i2.up_port[1];
     Switch_i17.down_port[1] <--> Link_1Gbps <--> Switch_1_i2.up_port[1];
     Switch_i17.down_port[2] <--> Link_1Gbps <--> Switch_2_i2.up_port[1];
     Switch_i17.down_port[3] <--> Link_1Gbps <--> Switch_3_i2.up_port[1];
     Switch_i17.down_port[4] <--> Link_1Gbps <--> Switch_4_i2.up_port[1];
     Switch_i17.down_port[5] <--> Link_1Gbps <--> Switch_5_i2.up_port[1];
     Switch_i17.down_port[6] <--> Link_1Gbps <--> Switch_6_i2.up_port[1];
     Switch_i17.down_port[7] <--> Link_1Gbps <--> Switch_7_i2.up_port[1];
     Switch_i17.down_port[8] <--> Link_1Gbps <--> Switch_8_i2.up_port[1];
     Switch_i17.down_port[9] <--> Link_1Gbps <--> Switch_9_i2.up_port[1];
     Switch_i17.down_port[10] <--> Link_1Gbps <--> Switch_10_i2.up_port[1];
     Switch_i17.down_port[11] <--> Link_1Gbps <--> Switch_11_i2.up_port[1];
     Switch_i17.down_port[12] <--> Link_1Gbps <--> Switch_12_i2.up_port[1];
     Switch_i17.down_port[13] <--> Link_1Gbps <--> Switch_13_i2.up_port[1];
     Switch_i17.down_port[14] <--> Link_1Gbps <--> Switch_14_i2.up_port[1];
     Switch_i17.down_port[15] <--> Link_1Gbps <--> Switch_15_i2.up_port[1];
     Switch_i18.down_port[0] <--> Link_1Gbps <--> Switch_0_i2.up_port[2];
     Switch_i18.down_port[1] <--> Link_1Gbps <--> Switch_1_i2.up_port[2];
     Switch_i18.down_port[2] <--> Link_1Gbps <--> Switch_2_i2.up_port[2];
     Switch_i18.down_port[3] <--> Link_1Gbps <--> Switch_3_i2.up_port[2];
     Switch_i18.down_port[4] <--> Link_1Gbps <--> Switch_4_i2.up_port[2];
     Switch_i18.down_port[5] <--> Link_1Gbps <--> Switch_5_i2.up_port[2];
     Switch_i18.down_port[6] <--> Link_1Gbps <--> Switch_6_i2.up_port[2];
     Switch_i18.down_port[7] <--> Link_1Gbps <--> Switch_7_i2.up_port[2];
     Switch_i18.down_port[8] <--> Link_1Gbps <--> Switch_8_i2.up_port[2];
     Switch_i18.down_port[9] <--> Link_1Gbps <--> Switch_9_i2.up_port[2];
     Switch_i18.down_port[10] <--> Link_1Gbps <--> Switch_10_i2.up_port[2];
     Switch_i18.down_port[11] <--> Link_1Gbps <--> Switch_11_i2.up_port[2];
     Switch_i18.down_port[12] <--> Link_1Gbps <--> Switch_12_i2.up_port[2];
     Switch_i18.down_port[13] <--> Link_1Gbps <--> Switch_13_i2.up_port[2];
     Switch_i18.down_port[14] <--> Link_1Gbps <--> Switch_14_i2.up_port[2];
     Switch_i18.down_port[15] <--> Link_1Gbps <--> Switch_15_i2.up_port[2];
     Switch_i19.down_port[0] <--> Link_1Gbps <--> Switch_0_i2.up_port[3];
     Switch_i19.down_port[1] <--> Link_1Gbps <--> Switch_1_i2.up_port[3];
     Switch_i19.down_port[2] <--> Link_1Gbps <--> Switch_2_i2.up_port[3];
     Switch_i19.down_port[3] <--> Link_1Gbps <--> Switch_3_i2.up_port[3];
     Switch_i19.down_port[4] <--> Link_1Gbps <--> Switch_4_i2.up_port[3];
     Switch_i19.down_port[5] <--> Link_1Gbps <--> Switch_5_i2.up_port[3];
     Switch_i19.down_port[6] <--> Link_1Gbps <--> Switch_6_i2.up_port[3];
     Switch_i19.down_port[7] <--> Link_1Gbps <--> Switch_7_i2.up_port[3];
     Switch_i19.down_port[8] <--> Link_1Gbps <--> Switch_8_i2.up_port[3];
     Switch_i19.down_port[9] <--> Link_1Gbps <--> Switch_9_i2.up_port[3];
     Switch_i19.down_port[10] <--> Link_1Gbps <--> Switch_10_i2.up_port[3];
     Switch_i19.down_port[11] <--> Link_1Gbps <--> Switch_11_i2.up_port[3];
     Switch_i19.down_port[12] <--> Link_1Gbps <--> Switch_12_i2.up_port[3];
     Switch_i19.down_port[13] <--> Link_1Gbps <--> Switch_13_i2.up_port[3];
     Switch_i19.down_port[14] <--> Link_1Gbps <--> Switch_14_i2.up_port[3];
     Switch_i19.down_port[15] <--> Link_1Gbps <--> Switch_15_i2.up_port[3];
     Switch_i20.down_port[0] <--> Link_1Gbps <--> Switch_0_i2.up_port[4];
     Switch_i20.down_port[1] <--> Link_1Gbps <--> Switch_1_i2.up_port[4];
     Switch_i20.down_port[2] <--> Link_1Gbps <--> Switch_2_i2.up_port[4];
     Switch_i20.down_port[3] <--> Link_1Gbps <--> Switch_3_i2.up_port[4];
     Switch_i20.down_port[4] <--> Link_1Gbps <--> Switch_4_i2.up_port[4];
     Switch_i20.down_port[5] <--> Link_1Gbps <--> Switch_5_i2.up_port[4];
     Switch_i20.down_port[6] <--> Link_1Gbps <--> Switch_6_i2.up_port[4];
     Switch_i20.down_port[7] <--> Link_1Gbps <--> Switch_7_i2.up_port[4];
     Switch_i20.down_port[8] <--> Link_1Gbps <--> Switch_8_i2.up_port[4];
     Switch_i20.down_port[9] <--> Link_1Gbps <--> Switch_9_i2.up_port[4];
     Switch_i20.down_port[10] <--> Link_1Gbps <--> Switch_10_i2.up_port[4];
     Switch_i20.down_port[11] <--> Link_1Gbps <--> Switch_11_i2.up_port[4];
     Switch_i20.down_port[12] <--> Link_1Gbps <--> Switch_12_i2.up_port[4];
     Switch_i20.down_port[13] <--> Link_1Gbps <--> Switch_13_i2.up_port[4];
     Switch_i20.down_port[14] <--> Link_1Gbps <--> Switch_14_i2.up_port[4];
     Switch_i20.down_port[15] <--> Link_1Gbps <--> Switch_15_i2.up_port[4];
     Switch_i21.down_port[0] <--> Link_1Gbps <--> Switch_0_i2.up_port[5];
     Switch_i21.down_port[1] <--> Link_1Gbps <--> Switch_1_i2.up_port[5];
     Switch_i21.down_port[2] <--> Link_1Gbps <--> Switch_2_i2.up_port[5];
     Switch_i21.down_port[3] <--> Link_1Gbps <--> Switch_3_i2.up_port[5];
     Switch_i21.down_port[4] <--> Link_1Gbps <--> Switch_4_i2.up_port[5];
     Switch_i21.down_port[5] <--> Link_1Gbps <--> Switch_5_i2.up_port[5];
     Switch_i21.down_port[6] <--> Link_1Gbps <--> Switch_6_i2.up_port[5];
     Switch_i21.down_port[7] <--> Link_1Gbps <--> Switch_7_i2.up_port[5];
     Switch_i21.down_port[8] <--> Link_1Gbps <--> Switch_8_i2.up_port[5];
     Switch_i21.down_port[9] <--> Link_1Gbps <--> Switch_9_i2.up_port[5];
     Switch_i21.down_port[10] <--> Link_1Gbps <--> Switch_10_i2.up_port[5];
     Switch_i21.down_port[11] <--> Link_1Gbps <--> Switch_11_i2.up_port[5];
     Switch_i21.down_port[12] <--> Link_1Gbps <--> Switch_12_i2.up_port[5];
     Switch_i21.down_port[13] <--> Link_1Gbps <--> Switch_13_i2.up_port[5];
     Switch_i21.down_port[14] <--> Link_1Gbps <--> Switch_14_i2.up_port[5];
     Switch_i21.down_port[15] <--> Link_1Gbps <--> Switch_15_i2.up_port[5];
     Switch_i22.down_port[0] <--> Link_1Gbps <--> Switch_0_i2.up_port[6];
     Switch_i22.down_port[1] <--> Link_1Gbps <--> Switch_1_i2.up_port[6];
     Switch_i22.down_port[2] <--> Link_1Gbps <--> Switch_2_i2.up_port[6];
     Switch_i22.down_port[3] <--> Link_1Gbps <--> Switch_3_i2.up_port[6];
     Switch_i22.down_port[4] <--> Link_1Gbps <--> Switch_4_i2.up_port[6];
     Switch_i22.down_port[5] <--> Link_1Gbps <--> Switch_5_i2.up_port[6];
     Switch_i22.down_port[6] <--> Link_1Gbps <--> Switch_6_i2.up_port[6];
     Switch_i22.down_port[7] <--> Link_1Gbps <--> Switch_7_i2.up_port[6];
     Switch_i22.down_port[8] <--> Link_1Gbps <--> Switch_8_i2.up_port[6];
     Switch_i22.down_port[9] <--> Link_1Gbps <--> Switch_9_i2.up_port[6];
     Switch_i22.down_port[10] <--> Link_1Gbps <--> Switch_10_i2.up_port[6];
     Switch_i22.down_port[11] <--> Link_1Gbps <--> Switch_11_i2.up_port[6];
     Switch_i22.down_port[12] <--> Link_1Gbps <--> Switch_12_i2.up_port[6];
     Switch_i22.down_port[13] <--> Link_1Gbps <--> Switch_13_i2.up_port[6];
     Switch_i22.down_port[14] <--> Link_1Gbps <--> Switch_14_i2.up_port[6];
     Switch_i22.down_port[15] <--> Link_1Gbps <--> Switch_15_i2.up_port[6];
     Switch_i23.down_port[0] <--> Link_1Gbps <--> Switch_0_i2.up_port[7];
     Switch_i23.down_port[1] <--> Link_1Gbps <--> Switch_1_i2.up_port[7];
     Switch_i23.down_port[2] <--> Link_1Gbps <--> Switch_2_i2.up_port[7];
     Switch_i23.down_port[3] <--> Link_1Gbps <--> Switch_3_i2.up_port[7];
     Switch_i23.down_port[4] <--> Link_1Gbps <--> Switch_4_i2.up_port[7];
     Switch_i23.down_port[5] <--> Link_1Gbps <--> Switch_5_i2.up_port[7];
     Switch_i23.down_port[6] <--> Link_1Gbps <--> Switch_6_i2.up_port[7];
     Switch_i23.down_port[7] <--> Link_1Gbps <--> Switch_7_i2.up_port[7];
     Switch_i23.down_port[8] <--> Link_1Gbps <--> Switch_8_i2.up_port[7];
     Switch_i23.down_port[9] <--> Link_1Gbps <--> Switch_9_i2.up_port[7];
     Switch_i23.down_port[10] <--> Link_1Gbps <--> Switch_10_i2.up_port[7];
     Switch_i23.down_port[11] <--> Link_1Gbps <--> Switch_11_i2.up_port[7];
     Switch_i23.down_port[12] <--> Link_1Gbps <--> Switch_12_i2.up_port[7];
     Switch_i23.down_port[13] <--> Link_1Gbps <--> Switch_13_i2.up_port[7];
     Switch_i23.down_port[14] <--> Link_1Gbps <--> Switch_14_i2.up_port[7];
     Switch_i23.down_port[15] <--> Link_1Gbps <--> Switch_15_i2.up_port[7];
     Switch_i24.down_port[0] <--> Link_1Gbps <--> Switch_0_i3.up_port[0];
     Switch_i24.down_port[1] <--> Link_1Gbps <--> Switch_1_i3.up_port[0];
     Switch_i24.down_port[2] <--> Link_1Gbps <--> Switch_2_i3.up_port[0];
     Switch_i24.down_port[3] <--> Link_1Gbps <--> Switch_3_i3.up_port[0];
     Switch_i24.down_port[4] <--> Link_1Gbps <--> Switch_4_i3.up_port[0];
     Switch_i24.down_port[5] <--> Link_1Gbps <--> Switch_5_i3.up_port[0];
     Switch_i24.down_port[6] <--> Link_1Gbps <--> Switch_6_i3.up_port[0];
     Switch_i24.down_port[7] <--> Link_1Gbps <--> Switch_7_i3.up_port[0];
     Switch_i24.down_port[8] <--> Link_1Gbps <--> Switch_8_i3.up_port[0];
     Switch_i24.down_port[9] <--> Link_1Gbps <--> Switch_9_i3.up_port[0];
     Switch_i24.down_port[10] <--> Link_1Gbps <--> Switch_10_i3.up_port[0];
     Switch_i24.down_port[11] <--> Link_1Gbps <--> Switch_11_i3.up_port[0];
     Switch_i24.down_port[12] <--> Link_1Gbps <--> Switch_12_i3.up_port[0];
     Switch_i24.down_port[13] <--> Link_1Gbps <--> Switch_13_i3.up_port[0];
     Switch_i24.down_port[14] <--> Link_1Gbps <--> Switch_14_i3.up_port[0];
     Switch_i24.down_port[15] <--> Link_1Gbps <--> Switch_15_i3.up_port[0];
     Switch_i25.down_port[0] <--> Link_1Gbps <--> Switch_0_i3.up_port[1];
     Switch_i25.down_port[1] <--> Link_1Gbps <--> Switch_1_i3.up_port[1];
     Switch_i25.down_port[2] <--> Link_1Gbps <--> Switch_2_i3.up_port[1];
     Switch_i25.down_port[3] <--> Link_1Gbps <--> Switch_3_i3.up_port[1];
     Switch_i25.down_port[4] <--> Link_1Gbps <--> Switch_4_i3.up_port[1];
     Switch_i25.down_port[5] <--> Link_1Gbps <--> Switch_5_i3.up_port[1];
     Switch_i25.down_port[6] <--> Link_1Gbps <--> Switch_6_i3.up_port[1];
     Switch_i25.down_port[7] <--> Link_1Gbps <--> Switch_7_i3.up_port[1];
     Switch_i25.down_port[8] <--> Link_1Gbps <--> Switch_8_i3.up_port[1];
     Switch_i25.down_port[9] <--> Link_1Gbps <--> Switch_9_i3.up_port[1];
     Switch_i25.down_port[10] <--> Link_1Gbps <--> Switch_10_i3.up_port[1];
     Switch_i25.down_port[11] <--> Link_1Gbps <--> Switch_11_i3.up_port[1];
     Switch_i25.down_port[12] <--> Link_1Gbps <--> Switch_12_i3.up_port[1];
     Switch_i25.down_port[13] <--> Link_1Gbps <--> Switch_13_i3.up_port[1];
     Switch_i25.down_port[14] <--> Link_1Gbps <--> Switch_14_i3.up_port[1];
     Switch_i25.down_port[15] <--> Link_1Gbps <--> Switch_15_i3.up_port[1];
     Switch_i26.down_port[0] <--> Link_1Gbps <--> Switch_0_i3.up_port[2];
     Switch_i26.down_port[1] <--> Link_1Gbps <--> Switch_1_i3.up_port[2];
     Switch_i26.down_port[2] <--> Link_1Gbps <--> Switch_2_i3.up_port[2];
     Switch_i26.down_port[3] <--> Link_1Gbps <--> Switch_3_i3.up_port[2];
     Switch_i26.down_port[4] <--> Link_1Gbps <--> Switch_4_i3.up_port[2];
     Switch_i26.down_port[5] <--> Link_1Gbps <--> Switch_5_i3.up_port[2];
     Switch_i26.down_port[6] <--> Link_1Gbps <--> Switch_6_i3.up_port[2];
     Switch_i26.down_port[7] <--> Link_1Gbps <--> Switch_7_i3.up_port[2];
     Switch_i26.down_port[8] <--> Link_1Gbps <--> Switch_8_i3.up_port[2];
     Switch_i26.down_port[9] <--> Link_1Gbps <--> Switch_9_i3.up_port[2];
     Switch_i26.down_port[10] <--> Link_1Gbps <--> Switch_10_i3.up_port[2];
     Switch_i26.down_port[11] <--> Link_1Gbps <--> Switch_11_i3.up_port[2];
     Switch_i26.down_port[12] <--> Link_1Gbps <--> Switch_12_i3.up_port[2];
     Switch_i26.down_port[13] <--> Link_1Gbps <--> Switch_13_i3.up_port[2];
     Switch_i26.down_port[14] <--> Link_1Gbps <--> Switch_14_i3.up_port[2];
     Switch_i26.down_port[15] <--> Link_1Gbps <--> Switch_15_i3.up_port[2];
     Switch_i27.down_port[0] <--> Link_1Gbps <--> Switch_0_i3.up_port[3];
     Switch_i27.down_port[1] <--> Link_1Gbps <--> Switch_1_i3.up_port[3];
     Switch_i27.down_port[2] <--> Link_1Gbps <--> Switch_2_i3.up_port[3];
     Switch_i27.down_port[3] <--> Link_1Gbps <--> Switch_3_i3.up_port[3];
     Switch_i27.down_port[4] <--> Link_1Gbps <--> Switch_4_i3.up_port[3];
     Switch_i27.down_port[5] <--> Link_1Gbps <--> Switch_5_i3.up_port[3];
     Switch_i27.down_port[6] <--> Link_1Gbps <--> Switch_6_i3.up_port[3];
     Switch_i27.down_port[7] <--> Link_1Gbps <--> Switch_7_i3.up_port[3];
     Switch_i27.down_port[8] <--> Link_1Gbps <--> Switch_8_i3.up_port[3];
     Switch_i27.down_port[9] <--> Link_1Gbps <--> Switch_9_i3.up_port[3];
     Switch_i27.down_port[10] <--> Link_1Gbps <--> Switch_10_i3.up_port[3];
     Switch_i27.down_port[11] <--> Link_1Gbps <--> Switch_11_i3.up_port[3];
     Switch_i27.down_port[12] <--> Link_1Gbps <--> Switch_12_i3.up_port[3];
     Switch_i27.down_port[13] <--> Link_1Gbps <--> Switch_13_i3.up_port[3];
     Switch_i27.down_port[14] <--> Link_1Gbps <--> Switch_14_i3.up_port[3];
     Switch_i27.down_port[15] <--> Link_1Gbps <--> Switch_15_i3.up_port[3];
     Switch_i28.down_port[0] <--> Link_1Gbps <--> Switch_0_i3.up_port[4];
     Switch_i28.down_port[1] <--> Link_1Gbps <--> Switch_1_i3.up_port[4];
     Switch_i28.down_port[2] <--> Link_1Gbps <--> Switch_2_i3.up_port[4];
     Switch_i28.down_port[3] <--> Link_1Gbps <--> Switch_3_i3.up_port[4];
     Switch_i28.down_port[4] <--> Link_1Gbps <--> Switch_4_i3.up_port[4];
     Switch_i28.down_port[5] <--> Link_1Gbps <--> Switch_5_i3.up_port[4];
     Switch_i28.down_port[6] <--> Link_1Gbps <--> Switch_6_i3.up_port[4];
     Switch_i28.down_port[7] <--> Link_1Gbps <--> Switch_7_i3.up_port[4];
     Switch_i28.down_port[8] <--> Link_1Gbps <--> Switch_8_i3.up_port[4];
     Switch_i28.down_port[9] <--> Link_1Gbps <--> Switch_9_i3.up_port[4];
     Switch_i28.down_port[10] <--> Link_1Gbps <--> Switch_10_i3.up_port[4];
     Switch_i28.down_port[11] <--> Link_1Gbps <--> Switch_11_i3.up_port[4];
     Switch_i28.down_port[12] <--> Link_1Gbps <--> Switch_12_i3.up_port[4];
     Switch_i28.down_port[13] <--> Link_1Gbps <--> Switch_13_i3.up_port[4];
     Switch_i28.down_port[14] <--> Link_1Gbps <--> Switch_14_i3.up_port[4];
     Switch_i28.down_port[15] <--> Link_1Gbps <--> Switch_15_i3.up_port[4];
     Switch_i29.down_port[0] <--> Link_1Gbps <--> Switch_0_i3.up_port[5];
     Switch_i29.down_port[1] <--> Link_1Gbps <--> Switch_1_i3.up_port[5];
     Switch_i29.down_port[2] <--> Link_1Gbps <--> Switch_2_i3.up_port[5];
     Switch_i29.down_port[3] <--> Link_1Gbps <--> Switch_3_i3.up_port[5];
     Switch_i29.down_port[4] <--> Link_1Gbps <--> Switch_4_i3.up_port[5];
     Switch_i29.down_port[5] <--> Link_1Gbps <--> Switch_5_i3.up_port[5];
     Switch_i29.down_port[6] <--> Link_1Gbps <--> Switch_6_i3.up_port[5];
     Switch_i29.down_port[7] <--> Link_1Gbps <--> Switch_7_i3.up_port[5];
     Switch_i29.down_port[8] <--> Link_1Gbps <--> Switch_8_i3.up_port[5];
     Switch_i29.down_port[9] <--> Link_1Gbps <--> Switch_9_i3.up_port[5];
     Switch_i29.down_port[10] <--> Link_1Gbps <--> Switch_10_i3.up_port[5];
     Switch_i29.down_port[11] <--> Link_1Gbps <--> Switch_11_i3.up_port[5];
     Switch_i29.down_port[12] <--> Link_1Gbps <--> Switch_12_i3.up_port[5];
     Switch_i29.down_port[13] <--> Link_1Gbps <--> Switch_13_i3.up_port[5];
     Switch_i29.down_port[14] <--> Link_1Gbps <--> Switch_14_i3.up_port[5];
     Switch_i29.down_port[15] <--> Link_1Gbps <--> Switch_15_i3.up_port[5];
     Switch_i30.down_port[0] <--> Link_1Gbps <--> Switch_0_i3.up_port[6];
     Switch_i30.down_port[1] <--> Link_1Gbps <--> Switch_1_i3.up_port[6];
     Switch_i30.down_port[2] <--> Link_1Gbps <--> Switch_2_i3.up_port[6];
     Switch_i30.down_port[3] <--> Link_1Gbps <--> Switch_3_i3.up_port[6];
     Switch_i30.down_port[4] <--> Link_1Gbps <--> Switch_4_i3.up_port[6];
     Switch_i30.down_port[5] <--> Link_1Gbps <--> Switch_5_i3.up_port[6];
     Switch_i30.down_port[6] <--> Link_1Gbps <--> Switch_6_i3.up_port[6];
     Switch_i30.down_port[7] <--> Link_1Gbps <--> Switch_7_i3.up_port[6];
     Switch_i30.down_port[8] <--> Link_1Gbps <--> Switch_8_i3.up_port[6];
     Switch_i30.down_port[9] <--> Link_1Gbps <--> Switch_9_i3.up_port[6];
     Switch_i30.down_port[10] <--> Link_1Gbps <--> Switch_10_i3.up_port[6];
     Switch_i30.down_port[11] <--> Link_1Gbps <--> Switch_11_i3.up_port[6];
     Switch_i30.down_port[12] <--> Link_1Gbps <--> Switch_12_i3.up_port[6];
     Switch_i30.down_port[13] <--> Link_1Gbps <--> Switch_13_i3.up_port[6];
     Switch_i30.down_port[14] <--> Link_1Gbps <--> Switch_14_i3.up_port[6];
     Switch_i30.down_port[15] <--> Link_1Gbps <--> Switch_15_i3.up_port[6];
     Switch_i31.down_port[0] <--> Link_1Gbps <--> Switch_0_i3.up_port[7];
     Switch_i31.down_port[1] <--> Link_1Gbps <--> Switch_1_i3.up_port[7];
     Switch_i31.down_port[2] <--> Link_1Gbps <--> Switch_2_i3.up_port[7];
     Switch_i31.down_port[3] <--> Link_1Gbps <--> Switch_3_i3.up_port[7];
     Switch_i31.down_port[4] <--> Link_1Gbps <--> Switch_4_i3.up_port[7];
     Switch_i31.down_port[5] <--> Link_1Gbps <--> Switch_5_i3.up_port[7];
     Switch_i31.down_port[6] <--> Link_1Gbps <--> Switch_6_i3.up_port[7];
     Switch_i31.down_port[7] <--> Link_1Gbps <--> Switch_7_i3.up_port[7];
     Switch_i31.down_port[8] <--> Link_1Gbps <--> Switch_8_i3.up_port[7];
     Switch_i31.down_port[9] <--> Link_1Gbps <--> Switch_9_i3.up_port[7];
     Switch_i31.down_port[10] <--> Link_1Gbps <--> Switch_10_i3.up_port[7];
     Switch_i31.down_port[11] <--> Link_1Gbps <--> Switch_11_i3.up_port[7];
     Switch_i31.down_port[12] <--> Link_1Gbps <--> Switch_12_i3.up_port[7];
     Switch_i31.down_port[13] <--> Link_1Gbps <--> Switch_13_i3.up_port[7];
     Switch_i31.down_port[14] <--> Link_1Gbps <--> Switch_14_i3.up_port[7];
     Switch_i31.down_port[15] <--> Link_1Gbps <--> Switch_15_i3.up_port[7];
     Switch_i32.down_port[0] <--> Link_1Gbps <--> Switch_0_i4.up_port[0];
     Switch_i32.down_port[1] <--> Link_1Gbps <--> Switch_1_i4.up_port[0];
     Switch_i32.down_port[2] <--> Link_1Gbps <--> Switch_2_i4.up_port[0];
     Switch_i32.down_port[3] <--> Link_1Gbps <--> Switch_3_i4.up_port[0];
     Switch_i32.down_port[4] <--> Link_1Gbps <--> Switch_4_i4.up_port[0];
     Switch_i32.down_port[5] <--> Link_1Gbps <--> Switch_5_i4.up_port[0];
     Switch_i32.down_port[6] <--> Link_1Gbps <--> Switch_6_i4.up_port[0];
     Switch_i32.down_port[7] <--> Link_1Gbps <--> Switch_7_i4.up_port[0];
     Switch_i32.down_port[8] <--> Link_1Gbps <--> Switch_8_i4.up_port[0];
     Switch_i32.down_port[9] <--> Link_1Gbps <--> Switch_9_i4.up_port[0];
     Switch_i32.down_port[10] <--> Link_1Gbps <--> Switch_10_i4.up_port[0];
     Switch_i32.down_port[11] <--> Link_1Gbps <--> Switch_11_i4.up_port[0];
     Switch_i32.down_port[12] <--> Link_1Gbps <--> Switch_12_i4.up_port[0];
     Switch_i32.down_port[13] <--> Link_1Gbps <--> Switch_13_i4.up_port[0];
     Switch_i32.down_port[14] <--> Link_1Gbps <--> Switch_14_i4.up_port[0];
     Switch_i32.down_port[15] <--> Link_1Gbps <--> Switch_15_i4.up_port[0];
     Switch_i33.down_port[0] <--> Link_1Gbps <--> Switch_0_i4.up_port[1];
     Switch_i33.down_port[1] <--> Link_1Gbps <--> Switch_1_i4.up_port[1];
     Switch_i33.down_port[2] <--> Link_1Gbps <--> Switch_2_i4.up_port[1];
     Switch_i33.down_port[3] <--> Link_1Gbps <--> Switch_3_i4.up_port[1];
     Switch_i33.down_port[4] <--> Link_1Gbps <--> Switch_4_i4.up_port[1];
     Switch_i33.down_port[5] <--> Link_1Gbps <--> Switch_5_i4.up_port[1];
     Switch_i33.down_port[6] <--> Link_1Gbps <--> Switch_6_i4.up_port[1];
     Switch_i33.down_port[7] <--> Link_1Gbps <--> Switch_7_i4.up_port[1];
     Switch_i33.down_port[8] <--> Link_1Gbps <--> Switch_8_i4.up_port[1];
     Switch_i33.down_port[9] <--> Link_1Gbps <--> Switch_9_i4.up_port[1];
     Switch_i33.down_port[10] <--> Link_1Gbps <--> Switch_10_i4.up_port[1];
     Switch_i33.down_port[11] <--> Link_1Gbps <--> Switch_11_i4.up_port[1];
     Switch_i33.down_port[12] <--> Link_1Gbps <--> Switch_12_i4.up_port[1];
     Switch_i33.down_port[13] <--> Link_1Gbps <--> Switch_13_i4.up_port[1];
     Switch_i33.down_port[14] <--> Link_1Gbps <--> Switch_14_i4.up_port[1];
     Switch_i33.down_port[15] <--> Link_1Gbps <--> Switch_15_i4.up_port[1];
     Switch_i34.down_port[0] <--> Link_1Gbps <--> Switch_0_i4.up_port[2];
     Switch_i34.down_port[1] <--> Link_1Gbps <--> Switch_1_i4.up_port[2];
     Switch_i34.down_port[2] <--> Link_1Gbps <--> Switch_2_i4.up_port[2];
     Switch_i34.down_port[3] <--> Link_1Gbps <--> Switch_3_i4.up_port[2];
     Switch_i34.down_port[4] <--> Link_1Gbps <--> Switch_4_i4.up_port[2];
     Switch_i34.down_port[5] <--> Link_1Gbps <--> Switch_5_i4.up_port[2];
     Switch_i34.down_port[6] <--> Link_1Gbps <--> Switch_6_i4.up_port[2];
     Switch_i34.down_port[7] <--> Link_1Gbps <--> Switch_7_i4.up_port[2];
     Switch_i34.down_port[8] <--> Link_1Gbps <--> Switch_8_i4.up_port[2];
     Switch_i34.down_port[9] <--> Link_1Gbps <--> Switch_9_i4.up_port[2];
     Switch_i34.down_port[10] <--> Link_1Gbps <--> Switch_10_i4.up_port[2];
     Switch_i34.down_port[11] <--> Link_1Gbps <--> Switch_11_i4.up_port[2];
     Switch_i34.down_port[12] <--> Link_1Gbps <--> Switch_12_i4.up_port[2];
     Switch_i34.down_port[13] <--> Link_1Gbps <--> Switch_13_i4.up_port[2];
     Switch_i34.down_port[14] <--> Link_1Gbps <--> Switch_14_i4.up_port[2];
     Switch_i34.down_port[15] <--> Link_1Gbps <--> Switch_15_i4.up_port[2];
     Switch_i35.down_port[0] <--> Link_1Gbps <--> Switch_0_i4.up_port[3];
     Switch_i35.down_port[1] <--> Link_1Gbps <--> Switch_1_i4.up_port[3];
     Switch_i35.down_port[2] <--> Link_1Gbps <--> Switch_2_i4.up_port[3];
     Switch_i35.down_port[3] <--> Link_1Gbps <--> Switch_3_i4.up_port[3];
     Switch_i35.down_port[4] <--> Link_1Gbps <--> Switch_4_i4.up_port[3];
     Switch_i35.down_port[5] <--> Link_1Gbps <--> Switch_5_i4.up_port[3];
     Switch_i35.down_port[6] <--> Link_1Gbps <--> Switch_6_i4.up_port[3];
     Switch_i35.down_port[7] <--> Link_1Gbps <--> Switch_7_i4.up_port[3];
     Switch_i35.down_port[8] <--> Link_1Gbps <--> Switch_8_i4.up_port[3];
     Switch_i35.down_port[9] <--> Link_1Gbps <--> Switch_9_i4.up_port[3];
     Switch_i35.down_port[10] <--> Link_1Gbps <--> Switch_10_i4.up_port[3];
     Switch_i35.down_port[11] <--> Link_1Gbps <--> Switch_11_i4.up_port[3];
     Switch_i35.down_port[12] <--> Link_1Gbps <--> Switch_12_i4.up_port[3];
     Switch_i35.down_port[13] <--> Link_1Gbps <--> Switch_13_i4.up_port[3];
     Switch_i35.down_port[14] <--> Link_1Gbps <--> Switch_14_i4.up_port[3];
     Switch_i35.down_port[15] <--> Link_1Gbps <--> Switch_15_i4.up_port[3];
     Switch_i36.down_port[0] <--> Link_1Gbps <--> Switch_0_i4.up_port[4];
     Switch_i36.down_port[1] <--> Link_1Gbps <--> Switch_1_i4.up_port[4];
     Switch_i36.down_port[2] <--> Link_1Gbps <--> Switch_2_i4.up_port[4];
     Switch_i36.down_port[3] <--> Link_1Gbps <--> Switch_3_i4.up_port[4];
     Switch_i36.down_port[4] <--> Link_1Gbps <--> Switch_4_i4.up_port[4];
     Switch_i36.down_port[5] <--> Link_1Gbps <--> Switch_5_i4.up_port[4];
     Switch_i36.down_port[6] <--> Link_1Gbps <--> Switch_6_i4.up_port[4];
     Switch_i36.down_port[7] <--> Link_1Gbps <--> Switch_7_i4.up_port[4];
     Switch_i36.down_port[8] <--> Link_1Gbps <--> Switch_8_i4.up_port[4];
     Switch_i36.down_port[9] <--> Link_1Gbps <--> Switch_9_i4.up_port[4];
     Switch_i36.down_port[10] <--> Link_1Gbps <--> Switch_10_i4.up_port[4];
     Switch_i36.down_port[11] <--> Link_1Gbps <--> Switch_11_i4.up_port[4];
     Switch_i36.down_port[12] <--> Link_1Gbps <--> Switch_12_i4.up_port[4];
     Switch_i36.down_port[13] <--> Link_1Gbps <--> Switch_13_i4.up_port[4];
     Switch_i36.down_port[14] <--> Link_1Gbps <--> Switch_14_i4.up_port[4];
     Switch_i36.down_port[15] <--> Link_1Gbps <--> Switch_15_i4.up_port[4];
     Switch_i37.down_port[0] <--> Link_1Gbps <--> Switch_0_i4.up_port[5];
     Switch_i37.down_port[1] <--> Link_1Gbps <--> Switch_1_i4.up_port[5];
     Switch_i37.down_port[2] <--> Link_1Gbps <--> Switch_2_i4.up_port[5];
     Switch_i37.down_port[3] <--> Link_1Gbps <--> Switch_3_i4.up_port[5];
     Switch_i37.down_port[4] <--> Link_1Gbps <--> Switch_4_i4.up_port[5];
     Switch_i37.down_port[5] <--> Link_1Gbps <--> Switch_5_i4.up_port[5];
     Switch_i37.down_port[6] <--> Link_1Gbps <--> Switch_6_i4.up_port[5];
     Switch_i37.down_port[7] <--> Link_1Gbps <--> Switch_7_i4.up_port[5];
     Switch_i37.down_port[8] <--> Link_1Gbps <--> Switch_8_i4.up_port[5];
     Switch_i37.down_port[9] <--> Link_1Gbps <--> Switch_9_i4.up_port[5];
     Switch_i37.down_port[10] <--> Link_1Gbps <--> Switch_10_i4.up_port[5];
     Switch_i37.down_port[11] <--> Link_1Gbps <--> Switch_11_i4.up_port[5];
     Switch_i37.down_port[12] <--> Link_1Gbps <--> Switch_12_i4.up_port[5];
     Switch_i37.down_port[13] <--> Link_1Gbps <--> Switch_13_i4.up_port[5];
     Switch_i37.down_port[14] <--> Link_1Gbps <--> Switch_14_i4.up_port[5];
     Switch_i37.down_port[15] <--> Link_1Gbps <--> Switch_15_i4.up_port[5];
     Switch_i38.down_port[0] <--> Link_1Gbps <--> Switch_0_i4.up_port[6];
     Switch_i38.down_port[1] <--> Link_1Gbps <--> Switch_1_i4.up_port[6];
     Switch_i38.down_port[2] <--> Link_1Gbps <--> Switch_2_i4.up_port[6];
     Switch_i38.down_port[3] <--> Link_1Gbps <--> Switch_3_i4.up_port[6];
     Switch_i38.down_port[4] <--> Link_1Gbps <--> Switch_4_i4.up_port[6];
     Switch_i38.down_port[5] <--> Link_1Gbps <--> Switch_5_i4.up_port[6];
     Switch_i38.down_port[6] <--> Link_1Gbps <--> Switch_6_i4.up_port[6];
     Switch_i38.down_port[7] <--> Link_1Gbps <--> Switch_7_i4.up_port[6];
     Switch_i38.down_port[8] <--> Link_1Gbps <--> Switch_8_i4.up_port[6];
     Switch_i38.down_port[9] <--> Link_1Gbps <--> Switch_9_i4.up_port[6];
     Switch_i38.down_port[10] <--> Link_1Gbps <--> Switch_10_i4.up_port[6];
     Switch_i38.down_port[11] <--> Link_1Gbps <--> Switch_11_i4.up_port[6];
     Switch_i38.down_port[12] <--> Link_1Gbps <--> Switch_12_i4.up_port[6];
     Switch_i38.down_port[13] <--> Link_1Gbps <--> Switch_13_i4.up_port[6];
     Switch_i38.down_port[14] <--> Link_1Gbps <--> Switch_14_i4.up_port[6];
     Switch_i38.down_port[15] <--> Link_1Gbps <--> Switch_15_i4.up_port[6];
     Switch_i39.down_port[0] <--> Link_1Gbps <--> Switch_0_i4.up_port[7];
     Switch_i39.down_port[1] <--> Link_1Gbps <--> Switch_1_i4.up_port[7];
     Switch_i39.down_port[2] <--> Link_1Gbps <--> Switch_2_i4.up_port[7];
     Switch_i39.down_port[3] <--> Link_1Gbps <--> Switch_3_i4.up_port[7];
     Switch_i39.down_port[4] <--> Link_1Gbps <--> Switch_4_i4.up_port[7];
     Switch_i39.down_port[5] <--> Link_1Gbps <--> Switch_5_i4.up_port[7];
     Switch_i39.down_port[6] <--> Link_1Gbps <--> Switch_6_i4.up_port[7];
     Switch_i39.down_port[7] <--> Link_1Gbps <--> Switch_7_i4.up_port[7];
     Switch_i39.down_port[8] <--> Link_1Gbps <--> Switch_8_i4.up_port[7];
     Switch_i39.down_port[9] <--> Link_1Gbps <--> Switch_9_i4.up_port[7];
     Switch_i39.down_port[10] <--> Link_1Gbps <--> Switch_10_i4.up_port[7];
     Switch_i39.down_port[11] <--> Link_1Gbps <--> Switch_11_i4.up_port[7];
     Switch_i39.down_port[12] <--> Link_1Gbps <--> Switch_12_i4.up_port[7];
     Switch_i39.down_port[13] <--> Link_1Gbps <--> Switch_13_i4.up_port[7];
     Switch_i39.down_port[14] <--> Link_1Gbps <--> Switch_14_i4.up_port[7];
     Switch_i39.down_port[15] <--> Link_1Gbps <--> Switch_15_i4.up_port[7];
     Switch_i40.down_port[0] <--> Link_1Gbps <--> Switch_0_i5.up_port[0];
     Switch_i40.down_port[1] <--> Link_1Gbps <--> Switch_1_i5.up_port[0];
     Switch_i40.down_port[2] <--> Link_1Gbps <--> Switch_2_i5.up_port[0];
     Switch_i40.down_port[3] <--> Link_1Gbps <--> Switch_3_i5.up_port[0];
     Switch_i40.down_port[4] <--> Link_1Gbps <--> Switch_4_i5.up_port[0];
     Switch_i40.down_port[5] <--> Link_1Gbps <--> Switch_5_i5.up_port[0];
     Switch_i40.down_port[6] <--> Link_1Gbps <--> Switch_6_i5.up_port[0];
     Switch_i40.down_port[7] <--> Link_1Gbps <--> Switch_7_i5.up_port[0];
     Switch_i40.down_port[8] <--> Link_1Gbps <--> Switch_8_i5.up_port[0];
     Switch_i40.down_port[9] <--> Link_1Gbps <--> Switch_9_i5.up_port[0];
     Switch_i40.down_port[10] <--> Link_1Gbps <--> Switch_10_i5.up_port[0];
     Switch_i40.down_port[11] <--> Link_1Gbps <--> Switch_11_i5.up_port[0];
     Switch_i40.down_port[12] <--> Link_1Gbps <--> Switch_12_i5.up_port[0];
     Switch_i40.down_port[13] <--> Link_1Gbps <--> Switch_13_i5.up_port[0];
     Switch_i40.down_port[14] <--> Link_1Gbps <--> Switch_14_i5.up_port[0];
     Switch_i40.down_port[15] <--> Link_1Gbps <--> Switch_15_i5.up_port[0];
     Switch_i41.down_port[0] <--> Link_1Gbps <--> Switch_0_i5.up_port[1];
     Switch_i41.down_port[1] <--> Link_1Gbps <--> Switch_1_i5.up_port[1];
     Switch_i41.down_port[2] <--> Link_1Gbps <--> Switch_2_i5.up_port[1];
     Switch_i41.down_port[3] <--> Link_1Gbps <--> Switch_3_i5.up_port[1];
     Switch_i41.down_port[4] <--> Link_1Gbps <--> Switch_4_i5.up_port[1];
     Switch_i41.down_port[5] <--> Link_1Gbps <--> Switch_5_i5.up_port[1];
     Switch_i41.down_port[6] <--> Link_1Gbps <--> Switch_6_i5.up_port[1];
     Switch_i41.down_port[7] <--> Link_1Gbps <--> Switch_7_i5.up_port[1];
     Switch_i41.down_port[8] <--> Link_1Gbps <--> Switch_8_i5.up_port[1];
     Switch_i41.down_port[9] <--> Link_1Gbps <--> Switch_9_i5.up_port[1];
     Switch_i41.down_port[10] <--> Link_1Gbps <--> Switch_10_i5.up_port[1];
     Switch_i41.down_port[11] <--> Link_1Gbps <--> Switch_11_i5.up_port[1];
     Switch_i41.down_port[12] <--> Link_1Gbps <--> Switch_12_i5.up_port[1];
     Switch_i41.down_port[13] <--> Link_1Gbps <--> Switch_13_i5.up_port[1];
     Switch_i41.down_port[14] <--> Link_1Gbps <--> Switch_14_i5.up_port[1];
     Switch_i41.down_port[15] <--> Link_1Gbps <--> Switch_15_i5.up_port[1];
     Switch_i42.down_port[0] <--> Link_1Gbps <--> Switch_0_i5.up_port[2];
     Switch_i42.down_port[1] <--> Link_1Gbps <--> Switch_1_i5.up_port[2];
     Switch_i42.down_port[2] <--> Link_1Gbps <--> Switch_2_i5.up_port[2];
     Switch_i42.down_port[3] <--> Link_1Gbps <--> Switch_3_i5.up_port[2];
     Switch_i42.down_port[4] <--> Link_1Gbps <--> Switch_4_i5.up_port[2];
     Switch_i42.down_port[5] <--> Link_1Gbps <--> Switch_5_i5.up_port[2];
     Switch_i42.down_port[6] <--> Link_1Gbps <--> Switch_6_i5.up_port[2];
     Switch_i42.down_port[7] <--> Link_1Gbps <--> Switch_7_i5.up_port[2];
     Switch_i42.down_port[8] <--> Link_1Gbps <--> Switch_8_i5.up_port[2];
     Switch_i42.down_port[9] <--> Link_1Gbps <--> Switch_9_i5.up_port[2];
     Switch_i42.down_port[10] <--> Link_1Gbps <--> Switch_10_i5.up_port[2];
     Switch_i42.down_port[11] <--> Link_1Gbps <--> Switch_11_i5.up_port[2];
     Switch_i42.down_port[12] <--> Link_1Gbps <--> Switch_12_i5.up_port[2];
     Switch_i42.down_port[13] <--> Link_1Gbps <--> Switch_13_i5.up_port[2];
     Switch_i42.down_port[14] <--> Link_1Gbps <--> Switch_14_i5.up_port[2];
     Switch_i42.down_port[15] <--> Link_1Gbps <--> Switch_15_i5.up_port[2];
     Switch_i43.down_port[0] <--> Link_1Gbps <--> Switch_0_i5.up_port[3];
     Switch_i43.down_port[1] <--> Link_1Gbps <--> Switch_1_i5.up_port[3];
     Switch_i43.down_port[2] <--> Link_1Gbps <--> Switch_2_i5.up_port[3];
     Switch_i43.down_port[3] <--> Link_1Gbps <--> Switch_3_i5.up_port[3];
     Switch_i43.down_port[4] <--> Link_1Gbps <--> Switch_4_i5.up_port[3];
     Switch_i43.down_port[5] <--> Link_1Gbps <--> Switch_5_i5.up_port[3];
     Switch_i43.down_port[6] <--> Link_1Gbps <--> Switch_6_i5.up_port[3];
     Switch_i43.down_port[7] <--> Link_1Gbps <--> Switch_7_i5.up_port[3];
     Switch_i43.down_port[8] <--> Link_1Gbps <--> Switch_8_i5.up_port[3];
     Switch_i43.down_port[9] <--> Link_1Gbps <--> Switch_9_i5.up_port[3];
     Switch_i43.down_port[10] <--> Link_1Gbps <--> Switch_10_i5.up_port[3];
     Switch_i43.down_port[11] <--> Link_1Gbps <--> Switch_11_i5.up_port[3];
     Switch_i43.down_port[12] <--> Link_1Gbps <--> Switch_12_i5.up_port[3];
     Switch_i43.down_port[13] <--> Link_1Gbps <--> Switch_13_i5.up_port[3];
     Switch_i43.down_port[14] <--> Link_1Gbps <--> Switch_14_i5.up_port[3];
     Switch_i43.down_port[15] <--> Link_1Gbps <--> Switch_15_i5.up_port[3];
     Switch_i44.down_port[0] <--> Link_1Gbps <--> Switch_0_i5.up_port[4];
     Switch_i44.down_port[1] <--> Link_1Gbps <--> Switch_1_i5.up_port[4];
     Switch_i44.down_port[2] <--> Link_1Gbps <--> Switch_2_i5.up_port[4];
     Switch_i44.down_port[3] <--> Link_1Gbps <--> Switch_3_i5.up_port[4];
     Switch_i44.down_port[4] <--> Link_1Gbps <--> Switch_4_i5.up_port[4];
     Switch_i44.down_port[5] <--> Link_1Gbps <--> Switch_5_i5.up_port[4];
     Switch_i44.down_port[6] <--> Link_1Gbps <--> Switch_6_i5.up_port[4];
     Switch_i44.down_port[7] <--> Link_1Gbps <--> Switch_7_i5.up_port[4];
     Switch_i44.down_port[8] <--> Link_1Gbps <--> Switch_8_i5.up_port[4];
     Switch_i44.down_port[9] <--> Link_1Gbps <--> Switch_9_i5.up_port[4];
     Switch_i44.down_port[10] <--> Link_1Gbps <--> Switch_10_i5.up_port[4];
     Switch_i44.down_port[11] <--> Link_1Gbps <--> Switch_11_i5.up_port[4];
     Switch_i44.down_port[12] <--> Link_1Gbps <--> Switch_12_i5.up_port[4];
     Switch_i44.down_port[13] <--> Link_1Gbps <--> Switch_13_i5.up_port[4];
     Switch_i44.down_port[14] <--> Link_1Gbps <--> Switch_14_i5.up_port[4];
     Switch_i44.down_port[15] <--> Link_1Gbps <--> Switch_15_i5.up_port[4];
     Switch_i45.down_port[0] <--> Link_1Gbps <--> Switch_0_i5.up_port[5];
     Switch_i45.down_port[1] <--> Link_1Gbps <--> Switch_1_i5.up_port[5];
     Switch_i45.down_port[2] <--> Link_1Gbps <--> Switch_2_i5.up_port[5];
     Switch_i45.down_port[3] <--> Link_1Gbps <--> Switch_3_i5.up_port[5];
     Switch_i45.down_port[4] <--> Link_1Gbps <--> Switch_4_i5.up_port[5];
     Switch_i45.down_port[5] <--> Link_1Gbps <--> Switch_5_i5.up_port[5];
     Switch_i45.down_port[6] <--> Link_1Gbps <--> Switch_6_i5.up_port[5];
     Switch_i45.down_port[7] <--> Link_1Gbps <--> Switch_7_i5.up_port[5];
     Switch_i45.down_port[8] <--> Link_1Gbps <--> Switch_8_i5.up_port[5];
     Switch_i45.down_port[9] <--> Link_1Gbps <--> Switch_9_i5.up_port[5];
     Switch_i45.down_port[10] <--> Link_1Gbps <--> Switch_10_i5.up_port[5];
     Switch_i45.down_port[11] <--> Link_1Gbps <--> Switch_11_i5.up_port[5];
     Switch_i45.down_port[12] <--> Link_1Gbps <--> Switch_12_i5.up_port[5];
     Switch_i45.down_port[13] <--> Link_1Gbps <--> Switch_13_i5.up_port[5];
     Switch_i45.down_port[14] <--> Link_1Gbps <--> Switch_14_i5.up_port[5];
     Switch_i45.down_port[15] <--> Link_1Gbps <--> Switch_15_i5.up_port[5];
     Switch_i46.down_port[0] <--> Link_1Gbps <--> Switch_0_i5.up_port[6];
     Switch_i46.down_port[1] <--> Link_1Gbps <--> Switch_1_i5.up_port[6];
     Switch_i46.down_port[2] <--> Link_1Gbps <--> Switch_2_i5.up_port[6];
     Switch_i46.down_port[3] <--> Link_1Gbps <--> Switch_3_i5.up_port[6];
     Switch_i46.down_port[4] <--> Link_1Gbps <--> Switch_4_i5.up_port[6];
     Switch_i46.down_port[5] <--> Link_1Gbps <--> Switch_5_i5.up_port[6];
     Switch_i46.down_port[6] <--> Link_1Gbps <--> Switch_6_i5.up_port[6];
     Switch_i46.down_port[7] <--> Link_1Gbps <--> Switch_7_i5.up_port[6];
     Switch_i46.down_port[8] <--> Link_1Gbps <--> Switch_8_i5.up_port[6];
     Switch_i46.down_port[9] <--> Link_1Gbps <--> Switch_9_i5.up_port[6];
     Switch_i46.down_port[10] <--> Link_1Gbps <--> Switch_10_i5.up_port[6];
     Switch_i46.down_port[11] <--> Link_1Gbps <--> Switch_11_i5.up_port[6];
     Switch_i46.down_port[12] <--> Link_1Gbps <--> Switch_12_i5.up_port[6];
     Switch_i46.down_port[13] <--> Link_1Gbps <--> Switch_13_i5.up_port[6];
     Switch_i46.down_port[14] <--> Link_1Gbps <--> Switch_14_i5.up_port[6];
     Switch_i46.down_port[15] <--> Link_1Gbps <--> Switch_15_i5.up_port[6];
     Switch_i47.down_port[0] <--> Link_1Gbps <--> Switch_0_i5.up_port[7];
     Switch_i47.down_port[1] <--> Link_1Gbps <--> Switch_1_i5.up_port[7];
     Switch_i47.down_port[2] <--> Link_1Gbps <--> Switch_2_i5.up_port[7];
     Switch_i47.down_port[3] <--> Link_1Gbps <--> Switch_3_i5.up_port[7];
     Switch_i47.down_port[4] <--> Link_1Gbps <--> Switch_4_i5.up_port[7];
     Switch_i47.down_port[5] <--> Link_1Gbps <--> Switch_5_i5.up_port[7];
     Switch_i47.down_port[6] <--> Link_1Gbps <--> Switch_6_i5.up_port[7];
     Switch_i47.down_port[7] <--> Link_1Gbps <--> Switch_7_i5.up_port[7];
     Switch_i47.down_port[8] <--> Link_1Gbps <--> Switch_8_i5.up_port[7];
     Switch_i47.down_port[9] <--> Link_1Gbps <--> Switch_9_i5.up_port[7];
     Switch_i47.down_port[10] <--> Link_1Gbps <--> Switch_10_i5.up_port[7];
     Switch_i47.down_port[11] <--> Link_1Gbps <--> Switch_11_i5.up_port[7];
     Switch_i47.down_port[12] <--> Link_1Gbps <--> Switch_12_i5.up_port[7];
     Switch_i47.down_port[13] <--> Link_1Gbps <--> Switch_13_i5.up_port[7];
     Switch_i47.down_port[14] <--> Link_1Gbps <--> Switch_14_i5.up_port[7];
     Switch_i47.down_port[15] <--> Link_1Gbps <--> Switch_15_i5.up_port[7];
     Switch_i48.down_port[0] <--> Link_1Gbps <--> Switch_0_i6.up_port[0];
     Switch_i48.down_port[1] <--> Link_1Gbps <--> Switch_1_i6.up_port[0];
     Switch_i48.down_port[2] <--> Link_1Gbps <--> Switch_2_i6.up_port[0];
     Switch_i48.down_port[3] <--> Link_1Gbps <--> Switch_3_i6.up_port[0];
     Switch_i48.down_port[4] <--> Link_1Gbps <--> Switch_4_i6.up_port[0];
     Switch_i48.down_port[5] <--> Link_1Gbps <--> Switch_5_i6.up_port[0];
     Switch_i48.down_port[6] <--> Link_1Gbps <--> Switch_6_i6.up_port[0];
     Switch_i48.down_port[7] <--> Link_1Gbps <--> Switch_7_i6.up_port[0];
     Switch_i48.down_port[8] <--> Link_1Gbps <--> Switch_8_i6.up_port[0];
     Switch_i48.down_port[9] <--> Link_1Gbps <--> Switch_9_i6.up_port[0];
     Switch_i48.down_port[10] <--> Link_1Gbps <--> Switch_10_i6.up_port[0];
     Switch_i48.down_port[11] <--> Link_1Gbps <--> Switch_11_i6.up_port[0];
     Switch_i48.down_port[12] <--> Link_1Gbps <--> Switch_12_i6.up_port[0];
     Switch_i48.down_port[13] <--> Link_1Gbps <--> Switch_13_i6.up_port[0];
     Switch_i48.down_port[14] <--> Link_1Gbps <--> Switch_14_i6.up_port[0];
     Switch_i48.down_port[15] <--> Link_1Gbps <--> Switch_15_i6.up_port[0];
     Switch_i49.down_port[0] <--> Link_1Gbps <--> Switch_0_i6.up_port[1];
     Switch_i49.down_port[1] <--> Link_1Gbps <--> Switch_1_i6.up_port[1];
     Switch_i49.down_port[2] <--> Link_1Gbps <--> Switch_2_i6.up_port[1];
     Switch_i49.down_port[3] <--> Link_1Gbps <--> Switch_3_i6.up_port[1];
     Switch_i49.down_port[4] <--> Link_1Gbps <--> Switch_4_i6.up_port[1];
     Switch_i49.down_port[5] <--> Link_1Gbps <--> Switch_5_i6.up_port[1];
     Switch_i49.down_port[6] <--> Link_1Gbps <--> Switch_6_i6.up_port[1];
     Switch_i49.down_port[7] <--> Link_1Gbps <--> Switch_7_i6.up_port[1];
     Switch_i49.down_port[8] <--> Link_1Gbps <--> Switch_8_i6.up_port[1];
     Switch_i49.down_port[9] <--> Link_1Gbps <--> Switch_9_i6.up_port[1];
     Switch_i49.down_port[10] <--> Link_1Gbps <--> Switch_10_i6.up_port[1];
     Switch_i49.down_port[11] <--> Link_1Gbps <--> Switch_11_i6.up_port[1];
     Switch_i49.down_port[12] <--> Link_1Gbps <--> Switch_12_i6.up_port[1];
     Switch_i49.down_port[13] <--> Link_1Gbps <--> Switch_13_i6.up_port[1];
     Switch_i49.down_port[14] <--> Link_1Gbps <--> Switch_14_i6.up_port[1];
     Switch_i49.down_port[15] <--> Link_1Gbps <--> Switch_15_i6.up_port[1];
     Switch_i50.down_port[0] <--> Link_1Gbps <--> Switch_0_i6.up_port[2];
     Switch_i50.down_port[1] <--> Link_1Gbps <--> Switch_1_i6.up_port[2];
     Switch_i50.down_port[2] <--> Link_1Gbps <--> Switch_2_i6.up_port[2];
     Switch_i50.down_port[3] <--> Link_1Gbps <--> Switch_3_i6.up_port[2];
     Switch_i50.down_port[4] <--> Link_1Gbps <--> Switch_4_i6.up_port[2];
     Switch_i50.down_port[5] <--> Link_1Gbps <--> Switch_5_i6.up_port[2];
     Switch_i50.down_port[6] <--> Link_1Gbps <--> Switch_6_i6.up_port[2];
     Switch_i50.down_port[7] <--> Link_1Gbps <--> Switch_7_i6.up_port[2];
     Switch_i50.down_port[8] <--> Link_1Gbps <--> Switch_8_i6.up_port[2];
     Switch_i50.down_port[9] <--> Link_1Gbps <--> Switch_9_i6.up_port[2];
     Switch_i50.down_port[10] <--> Link_1Gbps <--> Switch_10_i6.up_port[2];
     Switch_i50.down_port[11] <--> Link_1Gbps <--> Switch_11_i6.up_port[2];
     Switch_i50.down_port[12] <--> Link_1Gbps <--> Switch_12_i6.up_port[2];
     Switch_i50.down_port[13] <--> Link_1Gbps <--> Switch_13_i6.up_port[2];
     Switch_i50.down_port[14] <--> Link_1Gbps <--> Switch_14_i6.up_port[2];
     Switch_i50.down_port[15] <--> Link_1Gbps <--> Switch_15_i6.up_port[2];
     Switch_i51.down_port[0] <--> Link_1Gbps <--> Switch_0_i6.up_port[3];
     Switch_i51.down_port[1] <--> Link_1Gbps <--> Switch_1_i6.up_port[3];
     Switch_i51.down_port[2] <--> Link_1Gbps <--> Switch_2_i6.up_port[3];
     Switch_i51.down_port[3] <--> Link_1Gbps <--> Switch_3_i6.up_port[3];
     Switch_i51.down_port[4] <--> Link_1Gbps <--> Switch_4_i6.up_port[3];
     Switch_i51.down_port[5] <--> Link_1Gbps <--> Switch_5_i6.up_port[3];
     Switch_i51.down_port[6] <--> Link_1Gbps <--> Switch_6_i6.up_port[3];
     Switch_i51.down_port[7] <--> Link_1Gbps <--> Switch_7_i6.up_port[3];
     Switch_i51.down_port[8] <--> Link_1Gbps <--> Switch_8_i6.up_port[3];
     Switch_i51.down_port[9] <--> Link_1Gbps <--> Switch_9_i6.up_port[3];
     Switch_i51.down_port[10] <--> Link_1Gbps <--> Switch_10_i6.up_port[3];
     Switch_i51.down_port[11] <--> Link_1Gbps <--> Switch_11_i6.up_port[3];
     Switch_i51.down_port[12] <--> Link_1Gbps <--> Switch_12_i6.up_port[3];
     Switch_i51.down_port[13] <--> Link_1Gbps <--> Switch_13_i6.up_port[3];
     Switch_i51.down_port[14] <--> Link_1Gbps <--> Switch_14_i6.up_port[3];
     Switch_i51.down_port[15] <--> Link_1Gbps <--> Switch_15_i6.up_port[3];
     Switch_i52.down_port[0] <--> Link_1Gbps <--> Switch_0_i6.up_port[4];
     Switch_i52.down_port[1] <--> Link_1Gbps <--> Switch_1_i6.up_port[4];
     Switch_i52.down_port[2] <--> Link_1Gbps <--> Switch_2_i6.up_port[4];
     Switch_i52.down_port[3] <--> Link_1Gbps <--> Switch_3_i6.up_port[4];
     Switch_i52.down_port[4] <--> Link_1Gbps <--> Switch_4_i6.up_port[4];
     Switch_i52.down_port[5] <--> Link_1Gbps <--> Switch_5_i6.up_port[4];
     Switch_i52.down_port[6] <--> Link_1Gbps <--> Switch_6_i6.up_port[4];
     Switch_i52.down_port[7] <--> Link_1Gbps <--> Switch_7_i6.up_port[4];
     Switch_i52.down_port[8] <--> Link_1Gbps <--> Switch_8_i6.up_port[4];
     Switch_i52.down_port[9] <--> Link_1Gbps <--> Switch_9_i6.up_port[4];
     Switch_i52.down_port[10] <--> Link_1Gbps <--> Switch_10_i6.up_port[4];
     Switch_i52.down_port[11] <--> Link_1Gbps <--> Switch_11_i6.up_port[4];
     Switch_i52.down_port[12] <--> Link_1Gbps <--> Switch_12_i6.up_port[4];
     Switch_i52.down_port[13] <--> Link_1Gbps <--> Switch_13_i6.up_port[4];
     Switch_i52.down_port[14] <--> Link_1Gbps <--> Switch_14_i6.up_port[4];
     Switch_i52.down_port[15] <--> Link_1Gbps <--> Switch_15_i6.up_port[4];
     Switch_i53.down_port[0] <--> Link_1Gbps <--> Switch_0_i6.up_port[5];
     Switch_i53.down_port[1] <--> Link_1Gbps <--> Switch_1_i6.up_port[5];
     Switch_i53.down_port[2] <--> Link_1Gbps <--> Switch_2_i6.up_port[5];
     Switch_i53.down_port[3] <--> Link_1Gbps <--> Switch_3_i6.up_port[5];
     Switch_i53.down_port[4] <--> Link_1Gbps <--> Switch_4_i6.up_port[5];
     Switch_i53.down_port[5] <--> Link_1Gbps <--> Switch_5_i6.up_port[5];
     Switch_i53.down_port[6] <--> Link_1Gbps <--> Switch_6_i6.up_port[5];
     Switch_i53.down_port[7] <--> Link_1Gbps <--> Switch_7_i6.up_port[5];
     Switch_i53.down_port[8] <--> Link_1Gbps <--> Switch_8_i6.up_port[5];
     Switch_i53.down_port[9] <--> Link_1Gbps <--> Switch_9_i6.up_port[5];
     Switch_i53.down_port[10] <--> Link_1Gbps <--> Switch_10_i6.up_port[5];
     Switch_i53.down_port[11] <--> Link_1Gbps <--> Switch_11_i6.up_port[5];
     Switch_i53.down_port[12] <--> Link_1Gbps <--> Switch_12_i6.up_port[5];
     Switch_i53.down_port[13] <--> Link_1Gbps <--> Switch_13_i6.up_port[5];
     Switch_i53.down_port[14] <--> Link_1Gbps <--> Switch_14_i6.up_port[5];
     Switch_i53.down_port[15] <--> Link_1Gbps <--> Switch_15_i6.up_port[5];
     Switch_i54.down_port[0] <--> Link_1Gbps <--> Switch_0_i6.up_port[6];
     Switch_i54.down_port[1] <--> Link_1Gbps <--> Switch_1_i6.up_port[6];
     Switch_i54.down_port[2] <--> Link_1Gbps <--> Switch_2_i6.up_port[6];
     Switch_i54.down_port[3] <--> Link_1Gbps <--> Switch_3_i6.up_port[6];
     Switch_i54.down_port[4] <--> Link_1Gbps <--> Switch_4_i6.up_port[6];
     Switch_i54.down_port[5] <--> Link_1Gbps <--> Switch_5_i6.up_port[6];
     Switch_i54.down_port[6] <--> Link_1Gbps <--> Switch_6_i6.up_port[6];
     Switch_i54.down_port[7] <--> Link_1Gbps <--> Switch_7_i6.up_port[6];
     Switch_i54.down_port[8] <--> Link_1Gbps <--> Switch_8_i6.up_port[6];
     Switch_i54.down_port[9] <--> Link_1Gbps <--> Switch_9_i6.up_port[6];
     Switch_i54.down_port[10] <--> Link_1Gbps <--> Switch_10_i6.up_port[6];
     Switch_i54.down_port[11] <--> Link_1Gbps <--> Switch_11_i6.up_port[6];
     Switch_i54.down_port[12] <--> Link_1Gbps <--> Switch_12_i6.up_port[6];
     Switch_i54.down_port[13] <--> Link_1Gbps <--> Switch_13_i6.up_port[6];
     Switch_i54.down_port[14] <--> Link_1Gbps <--> Switch_14_i6.up_port[6];
     Switch_i54.down_port[15] <--> Link_1Gbps <--> Switch_15_i6.up_port[6];
     Switch_i55.down_port[0] <--> Link_1Gbps <--> Switch_0_i6.up_port[7];
     Switch_i55.down_port[1] <--> Link_1Gbps <--> Switch_1_i6.up_port[7];
     Switch_i55.down_port[2] <--> Link_1Gbps <--> Switch_2_i6.up_port[7];
     Switch_i55.down_port[3] <--> Link_1Gbps <--> Switch_3_i6.up_port[7];
     Switch_i55.down_port[4] <--> Link_1Gbps <--> Switch_4_i6.up_port[7];
     Switch_i55.down_port[5] <--> Link_1Gbps <--> Switch_5_i6.up_port[7];
     Switch_i55.down_port[6] <--> Link_1Gbps <--> Switch_6_i6.up_port[7];
     Switch_i55.down_port[7] <--> Link_1Gbps <--> Switch_7_i6.up_port[7];
     Switch_i55.down_port[8] <--> Link_1Gbps <--> Switch_8_i6.up_port[7];
     Switch_i55.down_port[9] <--> Link_1Gbps <--> Switch_9_i6.up_port[7];
     Switch_i55.down_port[10] <--> Link_1Gbps <--> Switch_10_i6.up_port[7];
     Switch_i55.down_port[11] <--> Link_1Gbps <--> Switch_11_i6.up_port[7];
     Switch_i55.down_port[12] <--> Link_1Gbps <--> Switch_12_i6.up_port[7];
     Switch_i55.down_port[13] <--> Link_1Gbps <--> Switch_13_i6.up_port[7];
     Switch_i55.down_port[14] <--> Link_1Gbps <--> Switch_14_i6.up_port[7];
     Switch_i55.down_port[15] <--> Link_1Gbps <--> Switch_15_i6.up_port[7];
     Switch_i56.down_port[0] <--> Link_1Gbps <--> Switch_0_i7.up_port[0];
     Switch_i56.down_port[1] <--> Link_1Gbps <--> Switch_1_i7.up_port[0];
     Switch_i56.down_port[2] <--> Link_1Gbps <--> Switch_2_i7.up_port[0];
     Switch_i56.down_port[3] <--> Link_1Gbps <--> Switch_3_i7.up_port[0];
     Switch_i56.down_port[4] <--> Link_1Gbps <--> Switch_4_i7.up_port[0];
     Switch_i56.down_port[5] <--> Link_1Gbps <--> Switch_5_i7.up_port[0];
     Switch_i56.down_port[6] <--> Link_1Gbps <--> Switch_6_i7.up_port[0];
     Switch_i56.down_port[7] <--> Link_1Gbps <--> Switch_7_i7.up_port[0];
     Switch_i56.down_port[8] <--> Link_1Gbps <--> Switch_8_i7.up_port[0];
     Switch_i56.down_port[9] <--> Link_1Gbps <--> Switch_9_i7.up_port[0];
     Switch_i56.down_port[10] <--> Link_1Gbps <--> Switch_10_i7.up_port[0];
     Switch_i56.down_port[11] <--> Link_1Gbps <--> Switch_11_i7.up_port[0];
     Switch_i56.down_port[12] <--> Link_1Gbps <--> Switch_12_i7.up_port[0];
     Switch_i56.down_port[13] <--> Link_1Gbps <--> Switch_13_i7.up_port[0];
     Switch_i56.down_port[14] <--> Link_1Gbps <--> Switch_14_i7.up_port[0];
     Switch_i56.down_port[15] <--> Link_1Gbps <--> Switch_15_i7.up_port[0];
     Switch_i57.down_port[0] <--> Link_1Gbps <--> Switch_0_i7.up_port[1];
     Switch_i57.down_port[1] <--> Link_1Gbps <--> Switch_1_i7.up_port[1];
     Switch_i57.down_port[2] <--> Link_1Gbps <--> Switch_2_i7.up_port[1];
     Switch_i57.down_port[3] <--> Link_1Gbps <--> Switch_3_i7.up_port[1];
     Switch_i57.down_port[4] <--> Link_1Gbps <--> Switch_4_i7.up_port[1];
     Switch_i57.down_port[5] <--> Link_1Gbps <--> Switch_5_i7.up_port[1];
     Switch_i57.down_port[6] <--> Link_1Gbps <--> Switch_6_i7.up_port[1];
     Switch_i57.down_port[7] <--> Link_1Gbps <--> Switch_7_i7.up_port[1];
     Switch_i57.down_port[8] <--> Link_1Gbps <--> Switch_8_i7.up_port[1];
     Switch_i57.down_port[9] <--> Link_1Gbps <--> Switch_9_i7.up_port[1];
     Switch_i57.down_port[10] <--> Link_1Gbps <--> Switch_10_i7.up_port[1];
     Switch_i57.down_port[11] <--> Link_1Gbps <--> Switch_11_i7.up_port[1];
     Switch_i57.down_port[12] <--> Link_1Gbps <--> Switch_12_i7.up_port[1];
     Switch_i57.down_port[13] <--> Link_1Gbps <--> Switch_13_i7.up_port[1];
     Switch_i57.down_port[14] <--> Link_1Gbps <--> Switch_14_i7.up_port[1];
     Switch_i57.down_port[15] <--> Link_1Gbps <--> Switch_15_i7.up_port[1];
     Switch_i58.down_port[0] <--> Link_1Gbps <--> Switch_0_i7.up_port[2];
     Switch_i58.down_port[1] <--> Link_1Gbps <--> Switch_1_i7.up_port[2];
     Switch_i58.down_port[2] <--> Link_1Gbps <--> Switch_2_i7.up_port[2];
     Switch_i58.down_port[3] <--> Link_1Gbps <--> Switch_3_i7.up_port[2];
     Switch_i58.down_port[4] <--> Link_1Gbps <--> Switch_4_i7.up_port[2];
     Switch_i58.down_port[5] <--> Link_1Gbps <--> Switch_5_i7.up_port[2];
     Switch_i58.down_port[6] <--> Link_1Gbps <--> Switch_6_i7.up_port[2];
     Switch_i58.down_port[7] <--> Link_1Gbps <--> Switch_7_i7.up_port[2];
     Switch_i58.down_port[8] <--> Link_1Gbps <--> Switch_8_i7.up_port[2];
     Switch_i58.down_port[9] <--> Link_1Gbps <--> Switch_9_i7.up_port[2];
     Switch_i58.down_port[10] <--> Link_1Gbps <--> Switch_10_i7.up_port[2];
     Switch_i58.down_port[11] <--> Link_1Gbps <--> Switch_11_i7.up_port[2];
     Switch_i58.down_port[12] <--> Link_1Gbps <--> Switch_12_i7.up_port[2];
     Switch_i58.down_port[13] <--> Link_1Gbps <--> Switch_13_i7.up_port[2];
     Switch_i58.down_port[14] <--> Link_1Gbps <--> Switch_14_i7.up_port[2];
     Switch_i58.down_port[15] <--> Link_1Gbps <--> Switch_15_i7.up_port[2];
     Switch_i59.down_port[0] <--> Link_1Gbps <--> Switch_0_i7.up_port[3];
     Switch_i59.down_port[1] <--> Link_1Gbps <--> Switch_1_i7.up_port[3];
     Switch_i59.down_port[2] <--> Link_1Gbps <--> Switch_2_i7.up_port[3];
     Switch_i59.down_port[3] <--> Link_1Gbps <--> Switch_3_i7.up_port[3];
     Switch_i59.down_port[4] <--> Link_1Gbps <--> Switch_4_i7.up_port[3];
     Switch_i59.down_port[5] <--> Link_1Gbps <--> Switch_5_i7.up_port[3];
     Switch_i59.down_port[6] <--> Link_1Gbps <--> Switch_6_i7.up_port[3];
     Switch_i59.down_port[7] <--> Link_1Gbps <--> Switch_7_i7.up_port[3];
     Switch_i59.down_port[8] <--> Link_1Gbps <--> Switch_8_i7.up_port[3];
     Switch_i59.down_port[9] <--> Link_1Gbps <--> Switch_9_i7.up_port[3];
     Switch_i59.down_port[10] <--> Link_1Gbps <--> Switch_10_i7.up_port[3];
     Switch_i59.down_port[11] <--> Link_1Gbps <--> Switch_11_i7.up_port[3];
     Switch_i59.down_port[12] <--> Link_1Gbps <--> Switch_12_i7.up_port[3];
     Switch_i59.down_port[13] <--> Link_1Gbps <--> Switch_13_i7.up_port[3];
     Switch_i59.down_port[14] <--> Link_1Gbps <--> Switch_14_i7.up_port[3];
     Switch_i59.down_port[15] <--> Link_1Gbps <--> Switch_15_i7.up_port[3];
     Switch_i60.down_port[0] <--> Link_1Gbps <--> Switch_0_i7.up_port[4];
     Switch_i60.down_port[1] <--> Link_1Gbps <--> Switch_1_i7.up_port[4];
     Switch_i60.down_port[2] <--> Link_1Gbps <--> Switch_2_i7.up_port[4];
     Switch_i60.down_port[3] <--> Link_1Gbps <--> Switch_3_i7.up_port[4];
     Switch_i60.down_port[4] <--> Link_1Gbps <--> Switch_4_i7.up_port[4];
     Switch_i60.down_port[5] <--> Link_1Gbps <--> Switch_5_i7.up_port[4];
     Switch_i60.down_port[6] <--> Link_1Gbps <--> Switch_6_i7.up_port[4];
     Switch_i60.down_port[7] <--> Link_1Gbps <--> Switch_7_i7.up_port[4];
     Switch_i60.down_port[8] <--> Link_1Gbps <--> Switch_8_i7.up_port[4];
     Switch_i60.down_port[9] <--> Link_1Gbps <--> Switch_9_i7.up_port[4];
     Switch_i60.down_port[10] <--> Link_1Gbps <--> Switch_10_i7.up_port[4];
     Switch_i60.down_port[11] <--> Link_1Gbps <--> Switch_11_i7.up_port[4];
     Switch_i60.down_port[12] <--> Link_1Gbps <--> Switch_12_i7.up_port[4];
     Switch_i60.down_port[13] <--> Link_1Gbps <--> Switch_13_i7.up_port[4];
     Switch_i60.down_port[14] <--> Link_1Gbps <--> Switch_14_i7.up_port[4];
     Switch_i60.down_port[15] <--> Link_1Gbps <--> Switch_15_i7.up_port[4];
     Switch_i61.down_port[0] <--> Link_1Gbps <--> Switch_0_i7.up_port[5];
     Switch_i61.down_port[1] <--> Link_1Gbps <--> Switch_1_i7.up_port[5];
     Switch_i61.down_port[2] <--> Link_1Gbps <--> Switch_2_i7.up_port[5];
     Switch_i61.down_port[3] <--> Link_1Gbps <--> Switch_3_i7.up_port[5];
     Switch_i61.down_port[4] <--> Link_1Gbps <--> Switch_4_i7.up_port[5];
     Switch_i61.down_port[5] <--> Link_1Gbps <--> Switch_5_i7.up_port[5];
     Switch_i61.down_port[6] <--> Link_1Gbps <--> Switch_6_i7.up_port[5];
     Switch_i61.down_port[7] <--> Link_1Gbps <--> Switch_7_i7.up_port[5];
     Switch_i61.down_port[8] <--> Link_1Gbps <--> Switch_8_i7.up_port[5];
     Switch_i61.down_port[9] <--> Link_1Gbps <--> Switch_9_i7.up_port[5];
     Switch_i61.down_port[10] <--> Link_1Gbps <--> Switch_10_i7.up_port[5];
     Switch_i61.down_port[11] <--> Link_1Gbps <--> Switch_11_i7.up_port[5];
     Switch_i61.down_port[12] <--> Link_1Gbps <--> Switch_12_i7.up_port[5];
     Switch_i61.down_port[13] <--> Link_1Gbps <--> Switch_13_i7.up_port[5];
     Switch_i61.down_port[14] <--> Link_1Gbps <--> Switch_14_i7.up_port[5];
     Switch_i61.down_port[15] <--> Link_1Gbps <--> Switch_15_i7.up_port[5];
     Switch_i62.down_port[0] <--> Link_1Gbps <--> Switch_0_i7.up_port[6];
     Switch_i62.down_port[1] <--> Link_1Gbps <--> Switch_1_i7.up_port[6];
     Switch_i62.down_port[2] <--> Link_1Gbps <--> Switch_2_i7.up_port[6];
     Switch_i62.down_port[3] <--> Link_1Gbps <--> Switch_3_i7.up_port[6];
     Switch_i62.down_port[4] <--> Link_1Gbps <--> Switch_4_i7.up_port[6];
     Switch_i62.down_port[5] <--> Link_1Gbps <--> Switch_5_i7.up_port[6];
     Switch_i62.down_port[6] <--> Link_1Gbps <--> Switch_6_i7.up_port[6];
     Switch_i62.down_port[7] <--> Link_1Gbps <--> Switch_7_i7.up_port[6];
     Switch_i62.down_port[8] <--> Link_1Gbps <--> Switch_8_i7.up_port[6];
     Switch_i62.down_port[9] <--> Link_1Gbps <--> Switch_9_i7.up_port[6];
     Switch_i62.down_port[10] <--> Link_1Gbps <--> Switch_10_i7.up_port[6];
     Switch_i62.down_port[11] <--> Link_1Gbps <--> Switch_11_i7.up_port[6];
     Switch_i62.down_port[12] <--> Link_1Gbps <--> Switch_12_i7.up_port[6];
     Switch_i62.down_port[13] <--> Link_1Gbps <--> Switch_13_i7.up_port[6];
     Switch_i62.down_port[14] <--> Link_1Gbps <--> Switch_14_i7.up_port[6];
     Switch_i62.down_port[15] <--> Link_1Gbps <--> Switch_15_i7.up_port[6];
     Switch_i63.down_port[0] <--> Link_1Gbps <--> Switch_0_i7.up_port[7];
     Switch_i63.down_port[1] <--> Link_1Gbps <--> Switch_1_i7.up_port[7];
     Switch_i63.down_port[2] <--> Link_1Gbps <--> Switch_2_i7.up_port[7];
     Switch_i63.down_port[3] <--> Link_1Gbps <--> Switch_3_i7.up_port[7];
     Switch_i63.down_port[4] <--> Link_1Gbps <--> Switch_4_i7.up_port[7];
     Switch_i63.down_port[5] <--> Link_1Gbps <--> Switch_5_i7.up_port[7];
     Switch_i63.down_port[6] <--> Link_1Gbps <--> Switch_6_i7.up_port[7];
     Switch_i63.down_port[7] <--> Link_1Gbps <--> Switch_7_i7.up_port[7];
     Switch_i63.down_port[8] <--> Link_1Gbps <--> Switch_8_i7.up_port[7];
     Switch_i63.down_port[9] <--> Link_1Gbps <--> Switch_9_i7.up_port[7];
     Switch_i63.down_port[10] <--> Link_1Gbps <--> Switch_10_i7.up_port[7];
     Switch_i63.down_port[11] <--> Link_1Gbps <--> Switch_11_i7.up_port[7];
     Switch_i63.down_port[12] <--> Link_1Gbps <--> Switch_12_i7.up_port[7];
     Switch_i63.down_port[13] <--> Link_1Gbps <--> Switch_13_i7.up_port[7];
     Switch_i63.down_port[14] <--> Link_1Gbps <--> Switch_14_i7.up_port[7];
     Switch_i63.down_port[15] <--> Link_1Gbps <--> Switch_15_i7.up_port[7];
}
