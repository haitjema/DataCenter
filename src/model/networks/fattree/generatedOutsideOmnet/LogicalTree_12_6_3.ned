package datacenter.model.networks.fattree.generatedOutsideOmnet;
import ned.DatarateChannel;
import datacenter.model.switch.EthSwitch;
import datacenter.model.node.server.Server;
import datacenter.model.node.server.*;


network LogicalTree_12_6_3
{
  parameters:
    **.tree_depth               = 3;
    **.int_switch_down_ports    = 12;
    **.tor_switch_up_ports      = 1;
    **.tor_switch_down_ports    = 6;
    **.switch_up_ports          = 1;
    **.switch_down_ports        = 6;
    **.switch_switch_link_speed = 1000000000 bps;
    **.server_switch_link_speed = 1000000000 bps;
    string ServerType = default("TCPClientServer");
    **.number_of_paths = 1;
    int DefaultQueueSizeBytes @unit(bytes) = default(32KiB);
    int DefaultQueueSizePkts = default(0);

  types:
    channel DCLink extends DatarateChannel
    {
        @class(DCLink);
        datarate = default(1 Gbps);
        delay = default(0 us);
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
    Switch_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=362,450,x");
            switch_id = "Switch_0_0_i0";
            depth = 2;
            sub_tree_id = 0;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=800,650,x");
            address = 6;
        gates:
    }
    Server_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=925,650,x");
            address = 7;
        gates:
    }
    Server_0_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=1050,650,x");
            address = 8;
        gates:
    }
    Server_0_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=1175,650,x");
            address = 9;
        gates:
    }
    Server_0_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=1300,650,x");
            address = 10;
        gates:
    }
    Server_0_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=1425,650,x");
            address = 11;
        gates:
    }
    Switch_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=1112,450,x");
            switch_id = "Switch_0_1_i0";
            depth = 2;
            sub_tree_id = 6;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_0_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=1550,650,x");
            address = 12;
        gates:
    }
    Server_0_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=1675,650,x");
            address = 13;
        gates:
    }
    Server_0_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=1800,650,x");
            address = 14;
        gates:
    }
    Server_0_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=1925,650,x");
            address = 15;
        gates:
    }
    Server_0_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=2050,650,x");
            address = 16;
        gates:
    }
    Server_0_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=2175,650,x");
            address = 17;
        gates:
    }
    Switch_0_2_i0 : EthSwitch
    {
        parameters:
            @display("p=1862,450,x");
            switch_id = "Switch_0_2_i0";
            depth = 2;
            sub_tree_id = 12;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_0_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=2300,650,x");
            address = 18;
        gates:
    }
    Server_0_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=2425,650,x");
            address = 19;
        gates:
    }
    Server_0_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=2550,650,x");
            address = 20;
        gates:
    }
    Server_0_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=2675,650,x");
            address = 21;
        gates:
    }
    Server_0_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=2800,650,x");
            address = 22;
        gates:
    }
    Server_0_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=2925,650,x");
            address = 23;
        gates:
    }
    Switch_0_3_i0 : EthSwitch
    {
        parameters:
            @display("p=2612,450,x");
            switch_id = "Switch_0_3_i0";
            depth = 2;
            sub_tree_id = 18;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_0_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=3050,650,x");
            address = 24;
        gates:
    }
    Server_0_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=3175,650,x");
            address = 25;
        gates:
    }
    Server_0_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=3300,650,x");
            address = 26;
        gates:
    }
    Server_0_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=3425,650,x");
            address = 27;
        gates:
    }
    Server_0_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=3550,650,x");
            address = 28;
        gates:
    }
    Server_0_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=3675,650,x");
            address = 29;
        gates:
    }
    Switch_0_4_i0 : EthSwitch
    {
        parameters:
            @display("p=3362,450,x");
            switch_id = "Switch_0_4_i0";
            depth = 2;
            sub_tree_id = 24;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_0_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=3800,650,x");
            address = 30;
        gates:
    }
    Server_0_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=3925,650,x");
            address = 31;
        gates:
    }
    Server_0_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=4050,650,x");
            address = 32;
        gates:
    }
    Server_0_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=4175,650,x");
            address = 33;
        gates:
    }
    Server_0_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=4300,650,x");
            address = 34;
        gates:
    }
    Server_0_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=4425,650,x");
            address = 35;
        gates:
    }
    Switch_0_5_i0 : EthSwitch
    {
        parameters:
            @display("p=4112,450,x");
            switch_id = "Switch_0_5_i0";
            depth = 2;
            sub_tree_id = 30;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Switch_0_i0 : EthSwitch
    {
        parameters:
            @display("p=2237,250,x");
            switch_id = "Switch_0_i0";
            depth = 1;
            sub_tree_id = 0;
            upPortQueueSizePkts = 36*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 36*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=4550,650,x");
            address = 36;
        gates:
    }
    Server_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=4675,650,x");
            address = 37;
        gates:
    }
    Server_1_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=4800,650,x");
            address = 38;
        gates:
    }
    Server_1_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=4925,650,x");
            address = 39;
        gates:
    }
    Server_1_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=5050,650,x");
            address = 40;
        gates:
    }
    Server_1_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=5175,650,x");
            address = 41;
        gates:
    }
    Switch_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=4862,450,x");
            switch_id = "Switch_1_0_i0";
            depth = 2;
            sub_tree_id = 36;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=5300,650,x");
            address = 42;
        gates:
    }
    Server_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=5425,650,x");
            address = 43;
        gates:
    }
    Server_1_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=5550,650,x");
            address = 44;
        gates:
    }
    Server_1_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=5675,650,x");
            address = 45;
        gates:
    }
    Server_1_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=5800,650,x");
            address = 46;
        gates:
    }
    Server_1_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=5925,650,x");
            address = 47;
        gates:
    }
    Switch_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=5612,450,x");
            switch_id = "Switch_1_1_i0";
            depth = 2;
            sub_tree_id = 42;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_1_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=6050,650,x");
            address = 48;
        gates:
    }
    Server_1_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=6175,650,x");
            address = 49;
        gates:
    }
    Server_1_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=6300,650,x");
            address = 50;
        gates:
    }
    Server_1_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=6425,650,x");
            address = 51;
        gates:
    }
    Server_1_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=6550,650,x");
            address = 52;
        gates:
    }
    Server_1_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=6675,650,x");
            address = 53;
        gates:
    }
    Switch_1_2_i0 : EthSwitch
    {
        parameters:
            @display("p=6362,450,x");
            switch_id = "Switch_1_2_i0";
            depth = 2;
            sub_tree_id = 48;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_1_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=6800,650,x");
            address = 54;
        gates:
    }
    Server_1_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=6925,650,x");
            address = 55;
        gates:
    }
    Server_1_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=7050,650,x");
            address = 56;
        gates:
    }
    Server_1_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=7175,650,x");
            address = 57;
        gates:
    }
    Server_1_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=7300,650,x");
            address = 58;
        gates:
    }
    Server_1_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=7425,650,x");
            address = 59;
        gates:
    }
    Switch_1_3_i0 : EthSwitch
    {
        parameters:
            @display("p=7112,450,x");
            switch_id = "Switch_1_3_i0";
            depth = 2;
            sub_tree_id = 54;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_1_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=7550,650,x");
            address = 60;
        gates:
    }
    Server_1_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=7675,650,x");
            address = 61;
        gates:
    }
    Server_1_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=7800,650,x");
            address = 62;
        gates:
    }
    Server_1_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=7925,650,x");
            address = 63;
        gates:
    }
    Server_1_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=8050,650,x");
            address = 64;
        gates:
    }
    Server_1_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=8175,650,x");
            address = 65;
        gates:
    }
    Switch_1_4_i0 : EthSwitch
    {
        parameters:
            @display("p=7862,450,x");
            switch_id = "Switch_1_4_i0";
            depth = 2;
            sub_tree_id = 60;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_1_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=8300,650,x");
            address = 66;
        gates:
    }
    Server_1_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=8425,650,x");
            address = 67;
        gates:
    }
    Server_1_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=8550,650,x");
            address = 68;
        gates:
    }
    Server_1_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=8675,650,x");
            address = 69;
        gates:
    }
    Server_1_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=8800,650,x");
            address = 70;
        gates:
    }
    Server_1_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=8925,650,x");
            address = 71;
        gates:
    }
    Switch_1_5_i0 : EthSwitch
    {
        parameters:
            @display("p=8612,450,x");
            switch_id = "Switch_1_5_i0";
            depth = 2;
            sub_tree_id = 66;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Switch_1_i0 : EthSwitch
    {
        parameters:
            @display("p=6737,250,x");
            switch_id = "Switch_1_i0";
            depth = 1;
            sub_tree_id = 36;
            upPortQueueSizePkts = 36*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 36*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_2_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=9050,650,x");
            address = 72;
        gates:
    }
    Server_2_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=9175,650,x");
            address = 73;
        gates:
    }
    Server_2_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=9300,650,x");
            address = 74;
        gates:
    }
    Server_2_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=9425,650,x");
            address = 75;
        gates:
    }
    Server_2_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=9550,650,x");
            address = 76;
        gates:
    }
    Server_2_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=9675,650,x");
            address = 77;
        gates:
    }
    Switch_2_0_i0 : EthSwitch
    {
        parameters:
            @display("p=9362,450,x");
            switch_id = "Switch_2_0_i0";
            depth = 2;
            sub_tree_id = 72;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_2_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=9800,650,x");
            address = 78;
        gates:
    }
    Server_2_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=9925,650,x");
            address = 79;
        gates:
    }
    Server_2_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=10050,650,x");
            address = 80;
        gates:
    }
    Server_2_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=10175,650,x");
            address = 81;
        gates:
    }
    Server_2_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=10300,650,x");
            address = 82;
        gates:
    }
    Server_2_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=10425,650,x");
            address = 83;
        gates:
    }
    Switch_2_1_i0 : EthSwitch
    {
        parameters:
            @display("p=10112,450,x");
            switch_id = "Switch_2_1_i0";
            depth = 2;
            sub_tree_id = 78;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_2_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=10550,650,x");
            address = 84;
        gates:
    }
    Server_2_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=10675,650,x");
            address = 85;
        gates:
    }
    Server_2_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=10800,650,x");
            address = 86;
        gates:
    }
    Server_2_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=10925,650,x");
            address = 87;
        gates:
    }
    Server_2_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=11050,650,x");
            address = 88;
        gates:
    }
    Server_2_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=11175,650,x");
            address = 89;
        gates:
    }
    Switch_2_2_i0 : EthSwitch
    {
        parameters:
            @display("p=10862,450,x");
            switch_id = "Switch_2_2_i0";
            depth = 2;
            sub_tree_id = 84;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_2_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=11300,650,x");
            address = 90;
        gates:
    }
    Server_2_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=11425,650,x");
            address = 91;
        gates:
    }
    Server_2_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=11550,650,x");
            address = 92;
        gates:
    }
    Server_2_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=11675,650,x");
            address = 93;
        gates:
    }
    Server_2_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=11800,650,x");
            address = 94;
        gates:
    }
    Server_2_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=11925,650,x");
            address = 95;
        gates:
    }
    Switch_2_3_i0 : EthSwitch
    {
        parameters:
            @display("p=11612,450,x");
            switch_id = "Switch_2_3_i0";
            depth = 2;
            sub_tree_id = 90;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_2_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=12050,650,x");
            address = 96;
        gates:
    }
    Server_2_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=12175,650,x");
            address = 97;
        gates:
    }
    Server_2_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=12300,650,x");
            address = 98;
        gates:
    }
    Server_2_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=12425,650,x");
            address = 99;
        gates:
    }
    Server_2_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=12550,650,x");
            address = 100;
        gates:
    }
    Server_2_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=12675,650,x");
            address = 101;
        gates:
    }
    Switch_2_4_i0 : EthSwitch
    {
        parameters:
            @display("p=12362,450,x");
            switch_id = "Switch_2_4_i0";
            depth = 2;
            sub_tree_id = 96;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_2_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=12800,650,x");
            address = 102;
        gates:
    }
    Server_2_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=12925,650,x");
            address = 103;
        gates:
    }
    Server_2_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=13050,650,x");
            address = 104;
        gates:
    }
    Server_2_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=13175,650,x");
            address = 105;
        gates:
    }
    Server_2_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=13300,650,x");
            address = 106;
        gates:
    }
    Server_2_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=13425,650,x");
            address = 107;
        gates:
    }
    Switch_2_5_i0 : EthSwitch
    {
        parameters:
            @display("p=13112,450,x");
            switch_id = "Switch_2_5_i0";
            depth = 2;
            sub_tree_id = 102;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Switch_2_i0 : EthSwitch
    {
        parameters:
            @display("p=11237,250,x");
            switch_id = "Switch_2_i0";
            depth = 1;
            sub_tree_id = 72;
            upPortQueueSizePkts = 36*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 36*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_3_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=13550,650,x");
            address = 108;
        gates:
    }
    Server_3_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=13675,650,x");
            address = 109;
        gates:
    }
    Server_3_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=13800,650,x");
            address = 110;
        gates:
    }
    Server_3_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=13925,650,x");
            address = 111;
        gates:
    }
    Server_3_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=14050,650,x");
            address = 112;
        gates:
    }
    Server_3_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=14175,650,x");
            address = 113;
        gates:
    }
    Switch_3_0_i0 : EthSwitch
    {
        parameters:
            @display("p=13862,450,x");
            switch_id = "Switch_3_0_i0";
            depth = 2;
            sub_tree_id = 108;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_3_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=14300,650,x");
            address = 114;
        gates:
    }
    Server_3_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=14425,650,x");
            address = 115;
        gates:
    }
    Server_3_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=14550,650,x");
            address = 116;
        gates:
    }
    Server_3_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=14675,650,x");
            address = 117;
        gates:
    }
    Server_3_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=14800,650,x");
            address = 118;
        gates:
    }
    Server_3_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=14925,650,x");
            address = 119;
        gates:
    }
    Switch_3_1_i0 : EthSwitch
    {
        parameters:
            @display("p=14612,450,x");
            switch_id = "Switch_3_1_i0";
            depth = 2;
            sub_tree_id = 114;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_3_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=15050,650,x");
            address = 120;
        gates:
    }
    Server_3_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=15175,650,x");
            address = 121;
        gates:
    }
    Server_3_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=15300,650,x");
            address = 122;
        gates:
    }
    Server_3_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=15425,650,x");
            address = 123;
        gates:
    }
    Server_3_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=15550,650,x");
            address = 124;
        gates:
    }
    Server_3_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=15675,650,x");
            address = 125;
        gates:
    }
    Switch_3_2_i0 : EthSwitch
    {
        parameters:
            @display("p=15362,450,x");
            switch_id = "Switch_3_2_i0";
            depth = 2;
            sub_tree_id = 120;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_3_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=15800,650,x");
            address = 126;
        gates:
    }
    Server_3_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=15925,650,x");
            address = 127;
        gates:
    }
    Server_3_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=16050,650,x");
            address = 128;
        gates:
    }
    Server_3_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=16175,650,x");
            address = 129;
        gates:
    }
    Server_3_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=16300,650,x");
            address = 130;
        gates:
    }
    Server_3_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=16425,650,x");
            address = 131;
        gates:
    }
    Switch_3_3_i0 : EthSwitch
    {
        parameters:
            @display("p=16112,450,x");
            switch_id = "Switch_3_3_i0";
            depth = 2;
            sub_tree_id = 126;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_3_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=16550,650,x");
            address = 132;
        gates:
    }
    Server_3_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=16675,650,x");
            address = 133;
        gates:
    }
    Server_3_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=16800,650,x");
            address = 134;
        gates:
    }
    Server_3_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=16925,650,x");
            address = 135;
        gates:
    }
    Server_3_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=17050,650,x");
            address = 136;
        gates:
    }
    Server_3_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=17175,650,x");
            address = 137;
        gates:
    }
    Switch_3_4_i0 : EthSwitch
    {
        parameters:
            @display("p=16862,450,x");
            switch_id = "Switch_3_4_i0";
            depth = 2;
            sub_tree_id = 132;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_3_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=17300,650,x");
            address = 138;
        gates:
    }
    Server_3_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=17425,650,x");
            address = 139;
        gates:
    }
    Server_3_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=17550,650,x");
            address = 140;
        gates:
    }
    Server_3_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=17675,650,x");
            address = 141;
        gates:
    }
    Server_3_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=17800,650,x");
            address = 142;
        gates:
    }
    Server_3_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=17925,650,x");
            address = 143;
        gates:
    }
    Switch_3_5_i0 : EthSwitch
    {
        parameters:
            @display("p=17612,450,x");
            switch_id = "Switch_3_5_i0";
            depth = 2;
            sub_tree_id = 138;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Switch_3_i0 : EthSwitch
    {
        parameters:
            @display("p=15737,250,x");
            switch_id = "Switch_3_i0";
            depth = 1;
            sub_tree_id = 108;
            upPortQueueSizePkts = 36*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 36*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_4_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=18050,650,x");
            address = 144;
        gates:
    }
    Server_4_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=18175,650,x");
            address = 145;
        gates:
    }
    Server_4_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=18300,650,x");
            address = 146;
        gates:
    }
    Server_4_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=18425,650,x");
            address = 147;
        gates:
    }
    Server_4_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=18550,650,x");
            address = 148;
        gates:
    }
    Server_4_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=18675,650,x");
            address = 149;
        gates:
    }
    Switch_4_0_i0 : EthSwitch
    {
        parameters:
            @display("p=18362,450,x");
            switch_id = "Switch_4_0_i0";
            depth = 2;
            sub_tree_id = 144;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_4_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=18800,650,x");
            address = 150;
        gates:
    }
    Server_4_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=18925,650,x");
            address = 151;
        gates:
    }
    Server_4_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=19050,650,x");
            address = 152;
        gates:
    }
    Server_4_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=19175,650,x");
            address = 153;
        gates:
    }
    Server_4_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=19300,650,x");
            address = 154;
        gates:
    }
    Server_4_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=19425,650,x");
            address = 155;
        gates:
    }
    Switch_4_1_i0 : EthSwitch
    {
        parameters:
            @display("p=19112,450,x");
            switch_id = "Switch_4_1_i0";
            depth = 2;
            sub_tree_id = 150;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_4_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=19550,650,x");
            address = 156;
        gates:
    }
    Server_4_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=19675,650,x");
            address = 157;
        gates:
    }
    Server_4_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=19800,650,x");
            address = 158;
        gates:
    }
    Server_4_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=19925,650,x");
            address = 159;
        gates:
    }
    Server_4_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=20050,650,x");
            address = 160;
        gates:
    }
    Server_4_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=20175,650,x");
            address = 161;
        gates:
    }
    Switch_4_2_i0 : EthSwitch
    {
        parameters:
            @display("p=19862,450,x");
            switch_id = "Switch_4_2_i0";
            depth = 2;
            sub_tree_id = 156;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_4_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=20300,650,x");
            address = 162;
        gates:
    }
    Server_4_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=20425,650,x");
            address = 163;
        gates:
    }
    Server_4_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=20550,650,x");
            address = 164;
        gates:
    }
    Server_4_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=20675,650,x");
            address = 165;
        gates:
    }
    Server_4_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=20800,650,x");
            address = 166;
        gates:
    }
    Server_4_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=20925,650,x");
            address = 167;
        gates:
    }
    Switch_4_3_i0 : EthSwitch
    {
        parameters:
            @display("p=20612,450,x");
            switch_id = "Switch_4_3_i0";
            depth = 2;
            sub_tree_id = 162;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_4_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=21050,650,x");
            address = 168;
        gates:
    }
    Server_4_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=21175,650,x");
            address = 169;
        gates:
    }
    Server_4_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=21300,650,x");
            address = 170;
        gates:
    }
    Server_4_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=21425,650,x");
            address = 171;
        gates:
    }
    Server_4_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=21550,650,x");
            address = 172;
        gates:
    }
    Server_4_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=21675,650,x");
            address = 173;
        gates:
    }
    Switch_4_4_i0 : EthSwitch
    {
        parameters:
            @display("p=21362,450,x");
            switch_id = "Switch_4_4_i0";
            depth = 2;
            sub_tree_id = 168;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_4_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=21800,650,x");
            address = 174;
        gates:
    }
    Server_4_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=21925,650,x");
            address = 175;
        gates:
    }
    Server_4_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=22050,650,x");
            address = 176;
        gates:
    }
    Server_4_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=22175,650,x");
            address = 177;
        gates:
    }
    Server_4_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=22300,650,x");
            address = 178;
        gates:
    }
    Server_4_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=22425,650,x");
            address = 179;
        gates:
    }
    Switch_4_5_i0 : EthSwitch
    {
        parameters:
            @display("p=22112,450,x");
            switch_id = "Switch_4_5_i0";
            depth = 2;
            sub_tree_id = 174;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Switch_4_i0 : EthSwitch
    {
        parameters:
            @display("p=20237,250,x");
            switch_id = "Switch_4_i0";
            depth = 1;
            sub_tree_id = 144;
            upPortQueueSizePkts = 36*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 36*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_5_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=22550,650,x");
            address = 180;
        gates:
    }
    Server_5_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=22675,650,x");
            address = 181;
        gates:
    }
    Server_5_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=22800,650,x");
            address = 182;
        gates:
    }
    Server_5_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=22925,650,x");
            address = 183;
        gates:
    }
    Server_5_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=23050,650,x");
            address = 184;
        gates:
    }
    Server_5_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=23175,650,x");
            address = 185;
        gates:
    }
    Switch_5_0_i0 : EthSwitch
    {
        parameters:
            @display("p=22862,450,x");
            switch_id = "Switch_5_0_i0";
            depth = 2;
            sub_tree_id = 180;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_5_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=23300,650,x");
            address = 186;
        gates:
    }
    Server_5_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=23425,650,x");
            address = 187;
        gates:
    }
    Server_5_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=23550,650,x");
            address = 188;
        gates:
    }
    Server_5_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=23675,650,x");
            address = 189;
        gates:
    }
    Server_5_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=23800,650,x");
            address = 190;
        gates:
    }
    Server_5_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=23925,650,x");
            address = 191;
        gates:
    }
    Switch_5_1_i0 : EthSwitch
    {
        parameters:
            @display("p=23612,450,x");
            switch_id = "Switch_5_1_i0";
            depth = 2;
            sub_tree_id = 186;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_5_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=24050,650,x");
            address = 192;
        gates:
    }
    Server_5_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=24175,650,x");
            address = 193;
        gates:
    }
    Server_5_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=24300,650,x");
            address = 194;
        gates:
    }
    Server_5_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=24425,650,x");
            address = 195;
        gates:
    }
    Server_5_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=24550,650,x");
            address = 196;
        gates:
    }
    Server_5_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=24675,650,x");
            address = 197;
        gates:
    }
    Switch_5_2_i0 : EthSwitch
    {
        parameters:
            @display("p=24362,450,x");
            switch_id = "Switch_5_2_i0";
            depth = 2;
            sub_tree_id = 192;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_5_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=24800,650,x");
            address = 198;
        gates:
    }
    Server_5_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=24925,650,x");
            address = 199;
        gates:
    }
    Server_5_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=25050,650,x");
            address = 200;
        gates:
    }
    Server_5_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=25175,650,x");
            address = 201;
        gates:
    }
    Server_5_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=25300,650,x");
            address = 202;
        gates:
    }
    Server_5_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=25425,650,x");
            address = 203;
        gates:
    }
    Switch_5_3_i0 : EthSwitch
    {
        parameters:
            @display("p=25112,450,x");
            switch_id = "Switch_5_3_i0";
            depth = 2;
            sub_tree_id = 198;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_5_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=25550,650,x");
            address = 204;
        gates:
    }
    Server_5_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=25675,650,x");
            address = 205;
        gates:
    }
    Server_5_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=25800,650,x");
            address = 206;
        gates:
    }
    Server_5_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=25925,650,x");
            address = 207;
        gates:
    }
    Server_5_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=26050,650,x");
            address = 208;
        gates:
    }
    Server_5_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=26175,650,x");
            address = 209;
        gates:
    }
    Switch_5_4_i0 : EthSwitch
    {
        parameters:
            @display("p=25862,450,x");
            switch_id = "Switch_5_4_i0";
            depth = 2;
            sub_tree_id = 204;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_5_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=26300,650,x");
            address = 210;
        gates:
    }
    Server_5_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=26425,650,x");
            address = 211;
        gates:
    }
    Server_5_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=26550,650,x");
            address = 212;
        gates:
    }
    Server_5_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=26675,650,x");
            address = 213;
        gates:
    }
    Server_5_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=26800,650,x");
            address = 214;
        gates:
    }
    Server_5_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=26925,650,x");
            address = 215;
        gates:
    }
    Switch_5_5_i0 : EthSwitch
    {
        parameters:
            @display("p=26612,450,x");
            switch_id = "Switch_5_5_i0";
            depth = 2;
            sub_tree_id = 210;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Switch_5_i0 : EthSwitch
    {
        parameters:
            @display("p=24737,250,x");
            switch_id = "Switch_5_i0";
            depth = 1;
            sub_tree_id = 180;
            upPortQueueSizePkts = 36*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 36*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_6_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=27050,650,x");
            address = 216;
        gates:
    }
    Server_6_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=27175,650,x");
            address = 217;
        gates:
    }
    Server_6_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=27300,650,x");
            address = 218;
        gates:
    }
    Server_6_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=27425,650,x");
            address = 219;
        gates:
    }
    Server_6_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=27550,650,x");
            address = 220;
        gates:
    }
    Server_6_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=27675,650,x");
            address = 221;
        gates:
    }
    Switch_6_0_i0 : EthSwitch
    {
        parameters:
            @display("p=27362,450,x");
            switch_id = "Switch_6_0_i0";
            depth = 2;
            sub_tree_id = 216;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_6_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=27800,650,x");
            address = 222;
        gates:
    }
    Server_6_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=27925,650,x");
            address = 223;
        gates:
    }
    Server_6_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=28050,650,x");
            address = 224;
        gates:
    }
    Server_6_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=28175,650,x");
            address = 225;
        gates:
    }
    Server_6_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=28300,650,x");
            address = 226;
        gates:
    }
    Server_6_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=28425,650,x");
            address = 227;
        gates:
    }
    Switch_6_1_i0 : EthSwitch
    {
        parameters:
            @display("p=28112,450,x");
            switch_id = "Switch_6_1_i0";
            depth = 2;
            sub_tree_id = 222;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_6_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=28550,650,x");
            address = 228;
        gates:
    }
    Server_6_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=28675,650,x");
            address = 229;
        gates:
    }
    Server_6_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=28800,650,x");
            address = 230;
        gates:
    }
    Server_6_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=28925,650,x");
            address = 231;
        gates:
    }
    Server_6_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=29050,650,x");
            address = 232;
        gates:
    }
    Server_6_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=29175,650,x");
            address = 233;
        gates:
    }
    Switch_6_2_i0 : EthSwitch
    {
        parameters:
            @display("p=28862,450,x");
            switch_id = "Switch_6_2_i0";
            depth = 2;
            sub_tree_id = 228;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_6_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=29300,650,x");
            address = 234;
        gates:
    }
    Server_6_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=29425,650,x");
            address = 235;
        gates:
    }
    Server_6_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=29550,650,x");
            address = 236;
        gates:
    }
    Server_6_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=29675,650,x");
            address = 237;
        gates:
    }
    Server_6_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=29800,650,x");
            address = 238;
        gates:
    }
    Server_6_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=29925,650,x");
            address = 239;
        gates:
    }
    Switch_6_3_i0 : EthSwitch
    {
        parameters:
            @display("p=29612,450,x");
            switch_id = "Switch_6_3_i0";
            depth = 2;
            sub_tree_id = 234;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_6_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=30050,650,x");
            address = 240;
        gates:
    }
    Server_6_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=30175,650,x");
            address = 241;
        gates:
    }
    Server_6_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=30300,650,x");
            address = 242;
        gates:
    }
    Server_6_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=30425,650,x");
            address = 243;
        gates:
    }
    Server_6_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=30550,650,x");
            address = 244;
        gates:
    }
    Server_6_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=30675,650,x");
            address = 245;
        gates:
    }
    Switch_6_4_i0 : EthSwitch
    {
        parameters:
            @display("p=30362,450,x");
            switch_id = "Switch_6_4_i0";
            depth = 2;
            sub_tree_id = 240;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_6_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=30800,650,x");
            address = 246;
        gates:
    }
    Server_6_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=30925,650,x");
            address = 247;
        gates:
    }
    Server_6_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=31050,650,x");
            address = 248;
        gates:
    }
    Server_6_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=31175,650,x");
            address = 249;
        gates:
    }
    Server_6_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=31300,650,x");
            address = 250;
        gates:
    }
    Server_6_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=31425,650,x");
            address = 251;
        gates:
    }
    Switch_6_5_i0 : EthSwitch
    {
        parameters:
            @display("p=31112,450,x");
            switch_id = "Switch_6_5_i0";
            depth = 2;
            sub_tree_id = 246;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Switch_6_i0 : EthSwitch
    {
        parameters:
            @display("p=29237,250,x");
            switch_id = "Switch_6_i0";
            depth = 1;
            sub_tree_id = 216;
            upPortQueueSizePkts = 36*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 36*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_7_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=31550,650,x");
            address = 252;
        gates:
    }
    Server_7_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=31675,650,x");
            address = 253;
        gates:
    }
    Server_7_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=31800,650,x");
            address = 254;
        gates:
    }
    Server_7_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=31925,650,x");
            address = 255;
        gates:
    }
    Server_7_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=32050,650,x");
            address = 256;
        gates:
    }
    Server_7_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=32175,650,x");
            address = 257;
        gates:
    }
    Switch_7_0_i0 : EthSwitch
    {
        parameters:
            @display("p=31862,450,x");
            switch_id = "Switch_7_0_i0";
            depth = 2;
            sub_tree_id = 252;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_7_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=32300,650,x");
            address = 258;
        gates:
    }
    Server_7_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=32425,650,x");
            address = 259;
        gates:
    }
    Server_7_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=32550,650,x");
            address = 260;
        gates:
    }
    Server_7_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=32675,650,x");
            address = 261;
        gates:
    }
    Server_7_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=32800,650,x");
            address = 262;
        gates:
    }
    Server_7_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=32925,650,x");
            address = 263;
        gates:
    }
    Switch_7_1_i0 : EthSwitch
    {
        parameters:
            @display("p=32612,450,x");
            switch_id = "Switch_7_1_i0";
            depth = 2;
            sub_tree_id = 258;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_7_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=33050,650,x");
            address = 264;
        gates:
    }
    Server_7_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=33175,650,x");
            address = 265;
        gates:
    }
    Server_7_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=33300,650,x");
            address = 266;
        gates:
    }
    Server_7_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=33425,650,x");
            address = 267;
        gates:
    }
    Server_7_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=33550,650,x");
            address = 268;
        gates:
    }
    Server_7_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=33675,650,x");
            address = 269;
        gates:
    }
    Switch_7_2_i0 : EthSwitch
    {
        parameters:
            @display("p=33362,450,x");
            switch_id = "Switch_7_2_i0";
            depth = 2;
            sub_tree_id = 264;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_7_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=33800,650,x");
            address = 270;
        gates:
    }
    Server_7_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=33925,650,x");
            address = 271;
        gates:
    }
    Server_7_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=34050,650,x");
            address = 272;
        gates:
    }
    Server_7_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=34175,650,x");
            address = 273;
        gates:
    }
    Server_7_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=34300,650,x");
            address = 274;
        gates:
    }
    Server_7_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=34425,650,x");
            address = 275;
        gates:
    }
    Switch_7_3_i0 : EthSwitch
    {
        parameters:
            @display("p=34112,450,x");
            switch_id = "Switch_7_3_i0";
            depth = 2;
            sub_tree_id = 270;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_7_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=34550,650,x");
            address = 276;
        gates:
    }
    Server_7_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=34675,650,x");
            address = 277;
        gates:
    }
    Server_7_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=34800,650,x");
            address = 278;
        gates:
    }
    Server_7_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=34925,650,x");
            address = 279;
        gates:
    }
    Server_7_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=35050,650,x");
            address = 280;
        gates:
    }
    Server_7_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=35175,650,x");
            address = 281;
        gates:
    }
    Switch_7_4_i0 : EthSwitch
    {
        parameters:
            @display("p=34862,450,x");
            switch_id = "Switch_7_4_i0";
            depth = 2;
            sub_tree_id = 276;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_7_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=35300,650,x");
            address = 282;
        gates:
    }
    Server_7_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=35425,650,x");
            address = 283;
        gates:
    }
    Server_7_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=35550,650,x");
            address = 284;
        gates:
    }
    Server_7_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=35675,650,x");
            address = 285;
        gates:
    }
    Server_7_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=35800,650,x");
            address = 286;
        gates:
    }
    Server_7_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=35925,650,x");
            address = 287;
        gates:
    }
    Switch_7_5_i0 : EthSwitch
    {
        parameters:
            @display("p=35612,450,x");
            switch_id = "Switch_7_5_i0";
            depth = 2;
            sub_tree_id = 282;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Switch_7_i0 : EthSwitch
    {
        parameters:
            @display("p=33737,250,x");
            switch_id = "Switch_7_i0";
            depth = 1;
            sub_tree_id = 252;
            upPortQueueSizePkts = 36*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 36*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_8_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=36050,650,x");
            address = 288;
        gates:
    }
    Server_8_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=36175,650,x");
            address = 289;
        gates:
    }
    Server_8_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=36300,650,x");
            address = 290;
        gates:
    }
    Server_8_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=36425,650,x");
            address = 291;
        gates:
    }
    Server_8_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=36550,650,x");
            address = 292;
        gates:
    }
    Server_8_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=36675,650,x");
            address = 293;
        gates:
    }
    Switch_8_0_i0 : EthSwitch
    {
        parameters:
            @display("p=36362,450,x");
            switch_id = "Switch_8_0_i0";
            depth = 2;
            sub_tree_id = 288;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_8_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=36800,650,x");
            address = 294;
        gates:
    }
    Server_8_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=36925,650,x");
            address = 295;
        gates:
    }
    Server_8_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=37050,650,x");
            address = 296;
        gates:
    }
    Server_8_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=37175,650,x");
            address = 297;
        gates:
    }
    Server_8_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=37300,650,x");
            address = 298;
        gates:
    }
    Server_8_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=37425,650,x");
            address = 299;
        gates:
    }
    Switch_8_1_i0 : EthSwitch
    {
        parameters:
            @display("p=37112,450,x");
            switch_id = "Switch_8_1_i0";
            depth = 2;
            sub_tree_id = 294;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_8_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=37550,650,x");
            address = 300;
        gates:
    }
    Server_8_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=37675,650,x");
            address = 301;
        gates:
    }
    Server_8_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=37800,650,x");
            address = 302;
        gates:
    }
    Server_8_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=37925,650,x");
            address = 303;
        gates:
    }
    Server_8_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=38050,650,x");
            address = 304;
        gates:
    }
    Server_8_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=38175,650,x");
            address = 305;
        gates:
    }
    Switch_8_2_i0 : EthSwitch
    {
        parameters:
            @display("p=37862,450,x");
            switch_id = "Switch_8_2_i0";
            depth = 2;
            sub_tree_id = 300;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_8_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=38300,650,x");
            address = 306;
        gates:
    }
    Server_8_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=38425,650,x");
            address = 307;
        gates:
    }
    Server_8_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=38550,650,x");
            address = 308;
        gates:
    }
    Server_8_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=38675,650,x");
            address = 309;
        gates:
    }
    Server_8_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=38800,650,x");
            address = 310;
        gates:
    }
    Server_8_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=38925,650,x");
            address = 311;
        gates:
    }
    Switch_8_3_i0 : EthSwitch
    {
        parameters:
            @display("p=38612,450,x");
            switch_id = "Switch_8_3_i0";
            depth = 2;
            sub_tree_id = 306;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_8_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=39050,650,x");
            address = 312;
        gates:
    }
    Server_8_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=39175,650,x");
            address = 313;
        gates:
    }
    Server_8_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=39300,650,x");
            address = 314;
        gates:
    }
    Server_8_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=39425,650,x");
            address = 315;
        gates:
    }
    Server_8_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=39550,650,x");
            address = 316;
        gates:
    }
    Server_8_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=39675,650,x");
            address = 317;
        gates:
    }
    Switch_8_4_i0 : EthSwitch
    {
        parameters:
            @display("p=39362,450,x");
            switch_id = "Switch_8_4_i0";
            depth = 2;
            sub_tree_id = 312;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_8_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=39800,650,x");
            address = 318;
        gates:
    }
    Server_8_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=39925,650,x");
            address = 319;
        gates:
    }
    Server_8_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=40050,650,x");
            address = 320;
        gates:
    }
    Server_8_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=40175,650,x");
            address = 321;
        gates:
    }
    Server_8_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=40300,650,x");
            address = 322;
        gates:
    }
    Server_8_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=40425,650,x");
            address = 323;
        gates:
    }
    Switch_8_5_i0 : EthSwitch
    {
        parameters:
            @display("p=40112,450,x");
            switch_id = "Switch_8_5_i0";
            depth = 2;
            sub_tree_id = 318;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Switch_8_i0 : EthSwitch
    {
        parameters:
            @display("p=38237,250,x");
            switch_id = "Switch_8_i0";
            depth = 1;
            sub_tree_id = 288;
            upPortQueueSizePkts = 36*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 36*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_9_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=40550,650,x");
            address = 324;
        gates:
    }
    Server_9_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=40675,650,x");
            address = 325;
        gates:
    }
    Server_9_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=40800,650,x");
            address = 326;
        gates:
    }
    Server_9_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=40925,650,x");
            address = 327;
        gates:
    }
    Server_9_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=41050,650,x");
            address = 328;
        gates:
    }
    Server_9_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=41175,650,x");
            address = 329;
        gates:
    }
    Switch_9_0_i0 : EthSwitch
    {
        parameters:
            @display("p=40862,450,x");
            switch_id = "Switch_9_0_i0";
            depth = 2;
            sub_tree_id = 324;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_9_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=41300,650,x");
            address = 330;
        gates:
    }
    Server_9_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=41425,650,x");
            address = 331;
        gates:
    }
    Server_9_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=41550,650,x");
            address = 332;
        gates:
    }
    Server_9_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=41675,650,x");
            address = 333;
        gates:
    }
    Server_9_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=41800,650,x");
            address = 334;
        gates:
    }
    Server_9_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=41925,650,x");
            address = 335;
        gates:
    }
    Switch_9_1_i0 : EthSwitch
    {
        parameters:
            @display("p=41612,450,x");
            switch_id = "Switch_9_1_i0";
            depth = 2;
            sub_tree_id = 330;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_9_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=42050,650,x");
            address = 336;
        gates:
    }
    Server_9_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=42175,650,x");
            address = 337;
        gates:
    }
    Server_9_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=42300,650,x");
            address = 338;
        gates:
    }
    Server_9_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=42425,650,x");
            address = 339;
        gates:
    }
    Server_9_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=42550,650,x");
            address = 340;
        gates:
    }
    Server_9_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=42675,650,x");
            address = 341;
        gates:
    }
    Switch_9_2_i0 : EthSwitch
    {
        parameters:
            @display("p=42362,450,x");
            switch_id = "Switch_9_2_i0";
            depth = 2;
            sub_tree_id = 336;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_9_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=42800,650,x");
            address = 342;
        gates:
    }
    Server_9_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=42925,650,x");
            address = 343;
        gates:
    }
    Server_9_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=43050,650,x");
            address = 344;
        gates:
    }
    Server_9_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=43175,650,x");
            address = 345;
        gates:
    }
    Server_9_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=43300,650,x");
            address = 346;
        gates:
    }
    Server_9_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=43425,650,x");
            address = 347;
        gates:
    }
    Switch_9_3_i0 : EthSwitch
    {
        parameters:
            @display("p=43112,450,x");
            switch_id = "Switch_9_3_i0";
            depth = 2;
            sub_tree_id = 342;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_9_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=43550,650,x");
            address = 348;
        gates:
    }
    Server_9_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=43675,650,x");
            address = 349;
        gates:
    }
    Server_9_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=43800,650,x");
            address = 350;
        gates:
    }
    Server_9_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=43925,650,x");
            address = 351;
        gates:
    }
    Server_9_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=44050,650,x");
            address = 352;
        gates:
    }
    Server_9_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=44175,650,x");
            address = 353;
        gates:
    }
    Switch_9_4_i0 : EthSwitch
    {
        parameters:
            @display("p=43862,450,x");
            switch_id = "Switch_9_4_i0";
            depth = 2;
            sub_tree_id = 348;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_9_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=44300,650,x");
            address = 354;
        gates:
    }
    Server_9_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=44425,650,x");
            address = 355;
        gates:
    }
    Server_9_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=44550,650,x");
            address = 356;
        gates:
    }
    Server_9_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=44675,650,x");
            address = 357;
        gates:
    }
    Server_9_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=44800,650,x");
            address = 358;
        gates:
    }
    Server_9_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=44925,650,x");
            address = 359;
        gates:
    }
    Switch_9_5_i0 : EthSwitch
    {
        parameters:
            @display("p=44612,450,x");
            switch_id = "Switch_9_5_i0";
            depth = 2;
            sub_tree_id = 354;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Switch_9_i0 : EthSwitch
    {
        parameters:
            @display("p=42737,250,x");
            switch_id = "Switch_9_i0";
            depth = 1;
            sub_tree_id = 324;
            upPortQueueSizePkts = 36*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 36*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_10_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=45050,650,x");
            address = 360;
        gates:
    }
    Server_10_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=45175,650,x");
            address = 361;
        gates:
    }
    Server_10_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=45300,650,x");
            address = 362;
        gates:
    }
    Server_10_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=45425,650,x");
            address = 363;
        gates:
    }
    Server_10_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=45550,650,x");
            address = 364;
        gates:
    }
    Server_10_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=45675,650,x");
            address = 365;
        gates:
    }
    Switch_10_0_i0 : EthSwitch
    {
        parameters:
            @display("p=45362,450,x");
            switch_id = "Switch_10_0_i0";
            depth = 2;
            sub_tree_id = 360;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_10_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=45800,650,x");
            address = 366;
        gates:
    }
    Server_10_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=45925,650,x");
            address = 367;
        gates:
    }
    Server_10_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=46050,650,x");
            address = 368;
        gates:
    }
    Server_10_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=46175,650,x");
            address = 369;
        gates:
    }
    Server_10_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=46300,650,x");
            address = 370;
        gates:
    }
    Server_10_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=46425,650,x");
            address = 371;
        gates:
    }
    Switch_10_1_i0 : EthSwitch
    {
        parameters:
            @display("p=46112,450,x");
            switch_id = "Switch_10_1_i0";
            depth = 2;
            sub_tree_id = 366;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_10_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=46550,650,x");
            address = 372;
        gates:
    }
    Server_10_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=46675,650,x");
            address = 373;
        gates:
    }
    Server_10_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=46800,650,x");
            address = 374;
        gates:
    }
    Server_10_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=46925,650,x");
            address = 375;
        gates:
    }
    Server_10_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=47050,650,x");
            address = 376;
        gates:
    }
    Server_10_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=47175,650,x");
            address = 377;
        gates:
    }
    Switch_10_2_i0 : EthSwitch
    {
        parameters:
            @display("p=46862,450,x");
            switch_id = "Switch_10_2_i0";
            depth = 2;
            sub_tree_id = 372;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_10_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=47300,650,x");
            address = 378;
        gates:
    }
    Server_10_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=47425,650,x");
            address = 379;
        gates:
    }
    Server_10_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=47550,650,x");
            address = 380;
        gates:
    }
    Server_10_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=47675,650,x");
            address = 381;
        gates:
    }
    Server_10_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=47800,650,x");
            address = 382;
        gates:
    }
    Server_10_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=47925,650,x");
            address = 383;
        gates:
    }
    Switch_10_3_i0 : EthSwitch
    {
        parameters:
            @display("p=47612,450,x");
            switch_id = "Switch_10_3_i0";
            depth = 2;
            sub_tree_id = 378;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_10_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=48050,650,x");
            address = 384;
        gates:
    }
    Server_10_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=48175,650,x");
            address = 385;
        gates:
    }
    Server_10_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=48300,650,x");
            address = 386;
        gates:
    }
    Server_10_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=48425,650,x");
            address = 387;
        gates:
    }
    Server_10_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=48550,650,x");
            address = 388;
        gates:
    }
    Server_10_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=48675,650,x");
            address = 389;
        gates:
    }
    Switch_10_4_i0 : EthSwitch
    {
        parameters:
            @display("p=48362,450,x");
            switch_id = "Switch_10_4_i0";
            depth = 2;
            sub_tree_id = 384;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_10_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=48800,650,x");
            address = 390;
        gates:
    }
    Server_10_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=48925,650,x");
            address = 391;
        gates:
    }
    Server_10_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=49050,650,x");
            address = 392;
        gates:
    }
    Server_10_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=49175,650,x");
            address = 393;
        gates:
    }
    Server_10_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=49300,650,x");
            address = 394;
        gates:
    }
    Server_10_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=49425,650,x");
            address = 395;
        gates:
    }
    Switch_10_5_i0 : EthSwitch
    {
        parameters:
            @display("p=49112,450,x");
            switch_id = "Switch_10_5_i0";
            depth = 2;
            sub_tree_id = 390;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Switch_10_i0 : EthSwitch
    {
        parameters:
            @display("p=47237,250,x");
            switch_id = "Switch_10_i0";
            depth = 1;
            sub_tree_id = 360;
            upPortQueueSizePkts = 36*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 36*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_11_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=49550,650,x");
            address = 396;
        gates:
    }
    Server_11_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=49675,650,x");
            address = 397;
        gates:
    }
    Server_11_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=49800,650,x");
            address = 398;
        gates:
    }
    Server_11_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=49925,650,x");
            address = 399;
        gates:
    }
    Server_11_0_4 : <ServerType> like Server
    {
        parameters:
            @display("p=50050,650,x");
            address = 400;
        gates:
    }
    Server_11_0_5 : <ServerType> like Server
    {
        parameters:
            @display("p=50175,650,x");
            address = 401;
        gates:
    }
    Switch_11_0_i0 : EthSwitch
    {
        parameters:
            @display("p=49862,450,x");
            switch_id = "Switch_11_0_i0";
            depth = 2;
            sub_tree_id = 396;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_11_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=50300,650,x");
            address = 402;
        gates:
    }
    Server_11_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=50425,650,x");
            address = 403;
        gates:
    }
    Server_11_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=50550,650,x");
            address = 404;
        gates:
    }
    Server_11_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=50675,650,x");
            address = 405;
        gates:
    }
    Server_11_1_4 : <ServerType> like Server
    {
        parameters:
            @display("p=50800,650,x");
            address = 406;
        gates:
    }
    Server_11_1_5 : <ServerType> like Server
    {
        parameters:
            @display("p=50925,650,x");
            address = 407;
        gates:
    }
    Switch_11_1_i0 : EthSwitch
    {
        parameters:
            @display("p=50612,450,x");
            switch_id = "Switch_11_1_i0";
            depth = 2;
            sub_tree_id = 402;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_11_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=51050,650,x");
            address = 408;
        gates:
    }
    Server_11_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=51175,650,x");
            address = 409;
        gates:
    }
    Server_11_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=51300,650,x");
            address = 410;
        gates:
    }
    Server_11_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=51425,650,x");
            address = 411;
        gates:
    }
    Server_11_2_4 : <ServerType> like Server
    {
        parameters:
            @display("p=51550,650,x");
            address = 412;
        gates:
    }
    Server_11_2_5 : <ServerType> like Server
    {
        parameters:
            @display("p=51675,650,x");
            address = 413;
        gates:
    }
    Switch_11_2_i0 : EthSwitch
    {
        parameters:
            @display("p=51362,450,x");
            switch_id = "Switch_11_2_i0";
            depth = 2;
            sub_tree_id = 408;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_11_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=51800,650,x");
            address = 414;
        gates:
    }
    Server_11_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=51925,650,x");
            address = 415;
        gates:
    }
    Server_11_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=52050,650,x");
            address = 416;
        gates:
    }
    Server_11_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=52175,650,x");
            address = 417;
        gates:
    }
    Server_11_3_4 : <ServerType> like Server
    {
        parameters:
            @display("p=52300,650,x");
            address = 418;
        gates:
    }
    Server_11_3_5 : <ServerType> like Server
    {
        parameters:
            @display("p=52425,650,x");
            address = 419;
        gates:
    }
    Switch_11_3_i0 : EthSwitch
    {
        parameters:
            @display("p=52112,450,x");
            switch_id = "Switch_11_3_i0";
            depth = 2;
            sub_tree_id = 414;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_11_4_0 : <ServerType> like Server
    {
        parameters:
            @display("p=52550,650,x");
            address = 420;
        gates:
    }
    Server_11_4_1 : <ServerType> like Server
    {
        parameters:
            @display("p=52675,650,x");
            address = 421;
        gates:
    }
    Server_11_4_2 : <ServerType> like Server
    {
        parameters:
            @display("p=52800,650,x");
            address = 422;
        gates:
    }
    Server_11_4_3 : <ServerType> like Server
    {
        parameters:
            @display("p=52925,650,x");
            address = 423;
        gates:
    }
    Server_11_4_4 : <ServerType> like Server
    {
        parameters:
            @display("p=53050,650,x");
            address = 424;
        gates:
    }
    Server_11_4_5 : <ServerType> like Server
    {
        parameters:
            @display("p=53175,650,x");
            address = 425;
        gates:
    }
    Switch_11_4_i0 : EthSwitch
    {
        parameters:
            @display("p=52862,450,x");
            switch_id = "Switch_11_4_i0";
            depth = 2;
            sub_tree_id = 420;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Server_11_5_0 : <ServerType> like Server
    {
        parameters:
            @display("p=53300,650,x");
            address = 426;
        gates:
    }
    Server_11_5_1 : <ServerType> like Server
    {
        parameters:
            @display("p=53425,650,x");
            address = 427;
        gates:
    }
    Server_11_5_2 : <ServerType> like Server
    {
        parameters:
            @display("p=53550,650,x");
            address = 428;
        gates:
    }
    Server_11_5_3 : <ServerType> like Server
    {
        parameters:
            @display("p=53675,650,x");
            address = 429;
        gates:
    }
    Server_11_5_4 : <ServerType> like Server
    {
        parameters:
            @display("p=53800,650,x");
            address = 430;
        gates:
    }
    Server_11_5_5 : <ServerType> like Server
    {
        parameters:
            @display("p=53925,650,x");
            address = 431;
        gates:
    }
    Switch_11_5_i0 : EthSwitch
    {
        parameters:
            @display("p=53612,450,x");
            switch_id = "Switch_11_5_i0";
            depth = 2;
            sub_tree_id = 426;
            upPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Switch_11_i0 : EthSwitch
    {
        parameters:
            @display("p=51737,250,x");
            switch_id = "Switch_11_i0";
            depth = 1;
            sub_tree_id = 396;
            upPortQueueSizePkts = 36*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 36*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 6*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 6*DefaultQueueSizeBytes; 
        gates:
            down_port[6];
            up_port[1];
    }
    Switch_i0 : EthSwitch
    {
        parameters:
            @display("p=26987,50,x");
            switch_id = "Switch_i0";
            depth = 0;
            sub_tree_id = 0;
            upPortQueueSizePkts = 0*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 0*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 36*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 36*DefaultQueueSizeBytes; 
        gates:
            down_port[12];
            up_port[0];
    }

    connections:
     Switch_0_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_0_0.port;
     Switch_0_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_0_1.port;
     Switch_0_0_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_0_2.port;
     Switch_0_0_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_0_3.port;
     Switch_0_0_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_0_4.port;
     Switch_0_0_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_0_5.port;
     Switch_0_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_1_0.port;
     Switch_0_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_1_1.port;
     Switch_0_1_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_1_2.port;
     Switch_0_1_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_1_3.port;
     Switch_0_1_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_1_4.port;
     Switch_0_1_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_1_5.port;
     Switch_0_2_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_2_0.port;
     Switch_0_2_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_2_1.port;
     Switch_0_2_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_2_2.port;
     Switch_0_2_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_2_3.port;
     Switch_0_2_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_2_4.port;
     Switch_0_2_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_2_5.port;
     Switch_0_3_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_3_0.port;
     Switch_0_3_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_3_1.port;
     Switch_0_3_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_3_2.port;
     Switch_0_3_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_3_3.port;
     Switch_0_3_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_3_4.port;
     Switch_0_3_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_3_5.port;
     Switch_0_4_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_4_0.port;
     Switch_0_4_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_4_1.port;
     Switch_0_4_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_4_2.port;
     Switch_0_4_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_4_3.port;
     Switch_0_4_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_4_4.port;
     Switch_0_4_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_4_5.port;
     Switch_0_5_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_5_0.port;
     Switch_0_5_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_5_1.port;
     Switch_0_5_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_5_2.port;
     Switch_0_5_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_5_3.port;
     Switch_0_5_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_5_4.port;
     Switch_0_5_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_5_5.port;
     Switch_0_i0.down_port[0] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_0_0_i0.up_port[0];
     Switch_0_i0.down_port[1] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_0_1_i0.up_port[0];
     Switch_0_i0.down_port[2] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_0_2_i0.up_port[0];
     Switch_0_i0.down_port[3] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_0_3_i0.up_port[0];
     Switch_0_i0.down_port[4] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_0_4_i0.up_port[0];
     Switch_0_i0.down_port[5] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_0_5_i0.up_port[0];
     Switch_1_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_0_0.port;
     Switch_1_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_0_1.port;
     Switch_1_0_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_0_2.port;
     Switch_1_0_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_0_3.port;
     Switch_1_0_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_0_4.port;
     Switch_1_0_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_0_5.port;
     Switch_1_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_1_0.port;
     Switch_1_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_1_1.port;
     Switch_1_1_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_1_2.port;
     Switch_1_1_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_1_3.port;
     Switch_1_1_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_1_4.port;
     Switch_1_1_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_1_5.port;
     Switch_1_2_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_2_0.port;
     Switch_1_2_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_2_1.port;
     Switch_1_2_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_2_2.port;
     Switch_1_2_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_2_3.port;
     Switch_1_2_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_2_4.port;
     Switch_1_2_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_2_5.port;
     Switch_1_3_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_3_0.port;
     Switch_1_3_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_3_1.port;
     Switch_1_3_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_3_2.port;
     Switch_1_3_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_3_3.port;
     Switch_1_3_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_3_4.port;
     Switch_1_3_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_3_5.port;
     Switch_1_4_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_4_0.port;
     Switch_1_4_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_4_1.port;
     Switch_1_4_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_4_2.port;
     Switch_1_4_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_4_3.port;
     Switch_1_4_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_4_4.port;
     Switch_1_4_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_4_5.port;
     Switch_1_5_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_5_0.port;
     Switch_1_5_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_5_1.port;
     Switch_1_5_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_5_2.port;
     Switch_1_5_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_5_3.port;
     Switch_1_5_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_5_4.port;
     Switch_1_5_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_5_5.port;
     Switch_1_i0.down_port[0] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_1_0_i0.up_port[0];
     Switch_1_i0.down_port[1] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_1_1_i0.up_port[0];
     Switch_1_i0.down_port[2] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_1_2_i0.up_port[0];
     Switch_1_i0.down_port[3] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_1_3_i0.up_port[0];
     Switch_1_i0.down_port[4] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_1_4_i0.up_port[0];
     Switch_1_i0.down_port[5] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_1_5_i0.up_port[0];
     Switch_2_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_0_0.port;
     Switch_2_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_0_1.port;
     Switch_2_0_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_0_2.port;
     Switch_2_0_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_0_3.port;
     Switch_2_0_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_0_4.port;
     Switch_2_0_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_0_5.port;
     Switch_2_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_1_0.port;
     Switch_2_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_1_1.port;
     Switch_2_1_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_1_2.port;
     Switch_2_1_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_1_3.port;
     Switch_2_1_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_1_4.port;
     Switch_2_1_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_1_5.port;
     Switch_2_2_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_2_0.port;
     Switch_2_2_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_2_1.port;
     Switch_2_2_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_2_2.port;
     Switch_2_2_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_2_3.port;
     Switch_2_2_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_2_4.port;
     Switch_2_2_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_2_5.port;
     Switch_2_3_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_3_0.port;
     Switch_2_3_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_3_1.port;
     Switch_2_3_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_3_2.port;
     Switch_2_3_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_3_3.port;
     Switch_2_3_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_3_4.port;
     Switch_2_3_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_3_5.port;
     Switch_2_4_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_4_0.port;
     Switch_2_4_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_4_1.port;
     Switch_2_4_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_4_2.port;
     Switch_2_4_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_4_3.port;
     Switch_2_4_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_4_4.port;
     Switch_2_4_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_4_5.port;
     Switch_2_5_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_5_0.port;
     Switch_2_5_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_5_1.port;
     Switch_2_5_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_5_2.port;
     Switch_2_5_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_5_3.port;
     Switch_2_5_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_5_4.port;
     Switch_2_5_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_5_5.port;
     Switch_2_i0.down_port[0] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_2_0_i0.up_port[0];
     Switch_2_i0.down_port[1] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_2_1_i0.up_port[0];
     Switch_2_i0.down_port[2] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_2_2_i0.up_port[0];
     Switch_2_i0.down_port[3] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_2_3_i0.up_port[0];
     Switch_2_i0.down_port[4] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_2_4_i0.up_port[0];
     Switch_2_i0.down_port[5] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_2_5_i0.up_port[0];
     Switch_3_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_0_0.port;
     Switch_3_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_0_1.port;
     Switch_3_0_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_0_2.port;
     Switch_3_0_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_0_3.port;
     Switch_3_0_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_0_4.port;
     Switch_3_0_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_0_5.port;
     Switch_3_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_1_0.port;
     Switch_3_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_1_1.port;
     Switch_3_1_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_1_2.port;
     Switch_3_1_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_1_3.port;
     Switch_3_1_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_1_4.port;
     Switch_3_1_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_1_5.port;
     Switch_3_2_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_2_0.port;
     Switch_3_2_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_2_1.port;
     Switch_3_2_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_2_2.port;
     Switch_3_2_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_2_3.port;
     Switch_3_2_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_2_4.port;
     Switch_3_2_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_2_5.port;
     Switch_3_3_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_3_0.port;
     Switch_3_3_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_3_1.port;
     Switch_3_3_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_3_2.port;
     Switch_3_3_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_3_3.port;
     Switch_3_3_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_3_4.port;
     Switch_3_3_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_3_5.port;
     Switch_3_4_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_4_0.port;
     Switch_3_4_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_4_1.port;
     Switch_3_4_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_4_2.port;
     Switch_3_4_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_4_3.port;
     Switch_3_4_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_4_4.port;
     Switch_3_4_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_4_5.port;
     Switch_3_5_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_5_0.port;
     Switch_3_5_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_5_1.port;
     Switch_3_5_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_5_2.port;
     Switch_3_5_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_5_3.port;
     Switch_3_5_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_5_4.port;
     Switch_3_5_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_5_5.port;
     Switch_3_i0.down_port[0] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_3_0_i0.up_port[0];
     Switch_3_i0.down_port[1] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_3_1_i0.up_port[0];
     Switch_3_i0.down_port[2] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_3_2_i0.up_port[0];
     Switch_3_i0.down_port[3] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_3_3_i0.up_port[0];
     Switch_3_i0.down_port[4] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_3_4_i0.up_port[0];
     Switch_3_i0.down_port[5] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_3_5_i0.up_port[0];
     Switch_4_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_0_0.port;
     Switch_4_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_0_1.port;
     Switch_4_0_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_0_2.port;
     Switch_4_0_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_0_3.port;
     Switch_4_0_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_0_4.port;
     Switch_4_0_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_0_5.port;
     Switch_4_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_1_0.port;
     Switch_4_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_1_1.port;
     Switch_4_1_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_1_2.port;
     Switch_4_1_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_1_3.port;
     Switch_4_1_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_1_4.port;
     Switch_4_1_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_1_5.port;
     Switch_4_2_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_2_0.port;
     Switch_4_2_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_2_1.port;
     Switch_4_2_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_2_2.port;
     Switch_4_2_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_2_3.port;
     Switch_4_2_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_2_4.port;
     Switch_4_2_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_2_5.port;
     Switch_4_3_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_3_0.port;
     Switch_4_3_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_3_1.port;
     Switch_4_3_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_3_2.port;
     Switch_4_3_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_3_3.port;
     Switch_4_3_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_3_4.port;
     Switch_4_3_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_3_5.port;
     Switch_4_4_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_4_0.port;
     Switch_4_4_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_4_1.port;
     Switch_4_4_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_4_2.port;
     Switch_4_4_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_4_3.port;
     Switch_4_4_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_4_4.port;
     Switch_4_4_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_4_5.port;
     Switch_4_5_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_5_0.port;
     Switch_4_5_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_5_1.port;
     Switch_4_5_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_5_2.port;
     Switch_4_5_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_5_3.port;
     Switch_4_5_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_5_4.port;
     Switch_4_5_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_5_5.port;
     Switch_4_i0.down_port[0] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_4_0_i0.up_port[0];
     Switch_4_i0.down_port[1] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_4_1_i0.up_port[0];
     Switch_4_i0.down_port[2] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_4_2_i0.up_port[0];
     Switch_4_i0.down_port[3] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_4_3_i0.up_port[0];
     Switch_4_i0.down_port[4] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_4_4_i0.up_port[0];
     Switch_4_i0.down_port[5] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_4_5_i0.up_port[0];
     Switch_5_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_0_0.port;
     Switch_5_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_0_1.port;
     Switch_5_0_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_0_2.port;
     Switch_5_0_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_0_3.port;
     Switch_5_0_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_0_4.port;
     Switch_5_0_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_0_5.port;
     Switch_5_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_1_0.port;
     Switch_5_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_1_1.port;
     Switch_5_1_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_1_2.port;
     Switch_5_1_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_1_3.port;
     Switch_5_1_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_1_4.port;
     Switch_5_1_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_1_5.port;
     Switch_5_2_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_2_0.port;
     Switch_5_2_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_2_1.port;
     Switch_5_2_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_2_2.port;
     Switch_5_2_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_2_3.port;
     Switch_5_2_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_2_4.port;
     Switch_5_2_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_2_5.port;
     Switch_5_3_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_3_0.port;
     Switch_5_3_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_3_1.port;
     Switch_5_3_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_3_2.port;
     Switch_5_3_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_3_3.port;
     Switch_5_3_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_3_4.port;
     Switch_5_3_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_3_5.port;
     Switch_5_4_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_4_0.port;
     Switch_5_4_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_4_1.port;
     Switch_5_4_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_4_2.port;
     Switch_5_4_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_4_3.port;
     Switch_5_4_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_4_4.port;
     Switch_5_4_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_4_5.port;
     Switch_5_5_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_5_0.port;
     Switch_5_5_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_5_1.port;
     Switch_5_5_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_5_2.port;
     Switch_5_5_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_5_3.port;
     Switch_5_5_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_5_4.port;
     Switch_5_5_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_5_5.port;
     Switch_5_i0.down_port[0] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_5_0_i0.up_port[0];
     Switch_5_i0.down_port[1] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_5_1_i0.up_port[0];
     Switch_5_i0.down_port[2] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_5_2_i0.up_port[0];
     Switch_5_i0.down_port[3] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_5_3_i0.up_port[0];
     Switch_5_i0.down_port[4] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_5_4_i0.up_port[0];
     Switch_5_i0.down_port[5] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_5_5_i0.up_port[0];
     Switch_6_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_0_0.port;
     Switch_6_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_0_1.port;
     Switch_6_0_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_0_2.port;
     Switch_6_0_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_0_3.port;
     Switch_6_0_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_0_4.port;
     Switch_6_0_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_0_5.port;
     Switch_6_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_1_0.port;
     Switch_6_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_1_1.port;
     Switch_6_1_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_1_2.port;
     Switch_6_1_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_1_3.port;
     Switch_6_1_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_1_4.port;
     Switch_6_1_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_1_5.port;
     Switch_6_2_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_2_0.port;
     Switch_6_2_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_2_1.port;
     Switch_6_2_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_2_2.port;
     Switch_6_2_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_2_3.port;
     Switch_6_2_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_2_4.port;
     Switch_6_2_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_2_5.port;
     Switch_6_3_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_3_0.port;
     Switch_6_3_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_3_1.port;
     Switch_6_3_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_3_2.port;
     Switch_6_3_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_3_3.port;
     Switch_6_3_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_3_4.port;
     Switch_6_3_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_3_5.port;
     Switch_6_4_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_4_0.port;
     Switch_6_4_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_4_1.port;
     Switch_6_4_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_4_2.port;
     Switch_6_4_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_4_3.port;
     Switch_6_4_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_4_4.port;
     Switch_6_4_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_4_5.port;
     Switch_6_5_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_5_0.port;
     Switch_6_5_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_5_1.port;
     Switch_6_5_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_5_2.port;
     Switch_6_5_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_5_3.port;
     Switch_6_5_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_5_4.port;
     Switch_6_5_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_5_5.port;
     Switch_6_i0.down_port[0] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_6_0_i0.up_port[0];
     Switch_6_i0.down_port[1] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_6_1_i0.up_port[0];
     Switch_6_i0.down_port[2] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_6_2_i0.up_port[0];
     Switch_6_i0.down_port[3] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_6_3_i0.up_port[0];
     Switch_6_i0.down_port[4] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_6_4_i0.up_port[0];
     Switch_6_i0.down_port[5] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_6_5_i0.up_port[0];
     Switch_7_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_0_0.port;
     Switch_7_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_0_1.port;
     Switch_7_0_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_0_2.port;
     Switch_7_0_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_0_3.port;
     Switch_7_0_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_0_4.port;
     Switch_7_0_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_0_5.port;
     Switch_7_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_1_0.port;
     Switch_7_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_1_1.port;
     Switch_7_1_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_1_2.port;
     Switch_7_1_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_1_3.port;
     Switch_7_1_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_1_4.port;
     Switch_7_1_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_1_5.port;
     Switch_7_2_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_2_0.port;
     Switch_7_2_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_2_1.port;
     Switch_7_2_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_2_2.port;
     Switch_7_2_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_2_3.port;
     Switch_7_2_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_2_4.port;
     Switch_7_2_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_2_5.port;
     Switch_7_3_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_3_0.port;
     Switch_7_3_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_3_1.port;
     Switch_7_3_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_3_2.port;
     Switch_7_3_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_3_3.port;
     Switch_7_3_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_3_4.port;
     Switch_7_3_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_3_5.port;
     Switch_7_4_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_4_0.port;
     Switch_7_4_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_4_1.port;
     Switch_7_4_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_4_2.port;
     Switch_7_4_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_4_3.port;
     Switch_7_4_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_4_4.port;
     Switch_7_4_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_4_5.port;
     Switch_7_5_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_5_0.port;
     Switch_7_5_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_5_1.port;
     Switch_7_5_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_5_2.port;
     Switch_7_5_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_5_3.port;
     Switch_7_5_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_5_4.port;
     Switch_7_5_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_5_5.port;
     Switch_7_i0.down_port[0] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_7_0_i0.up_port[0];
     Switch_7_i0.down_port[1] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_7_1_i0.up_port[0];
     Switch_7_i0.down_port[2] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_7_2_i0.up_port[0];
     Switch_7_i0.down_port[3] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_7_3_i0.up_port[0];
     Switch_7_i0.down_port[4] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_7_4_i0.up_port[0];
     Switch_7_i0.down_port[5] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_7_5_i0.up_port[0];
     Switch_8_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_0_0.port;
     Switch_8_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_0_1.port;
     Switch_8_0_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_0_2.port;
     Switch_8_0_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_0_3.port;
     Switch_8_0_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_0_4.port;
     Switch_8_0_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_0_5.port;
     Switch_8_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_1_0.port;
     Switch_8_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_1_1.port;
     Switch_8_1_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_1_2.port;
     Switch_8_1_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_1_3.port;
     Switch_8_1_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_1_4.port;
     Switch_8_1_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_1_5.port;
     Switch_8_2_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_2_0.port;
     Switch_8_2_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_2_1.port;
     Switch_8_2_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_2_2.port;
     Switch_8_2_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_2_3.port;
     Switch_8_2_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_2_4.port;
     Switch_8_2_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_2_5.port;
     Switch_8_3_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_3_0.port;
     Switch_8_3_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_3_1.port;
     Switch_8_3_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_3_2.port;
     Switch_8_3_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_3_3.port;
     Switch_8_3_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_3_4.port;
     Switch_8_3_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_3_5.port;
     Switch_8_4_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_4_0.port;
     Switch_8_4_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_4_1.port;
     Switch_8_4_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_4_2.port;
     Switch_8_4_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_4_3.port;
     Switch_8_4_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_4_4.port;
     Switch_8_4_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_4_5.port;
     Switch_8_5_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_5_0.port;
     Switch_8_5_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_5_1.port;
     Switch_8_5_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_5_2.port;
     Switch_8_5_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_5_3.port;
     Switch_8_5_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_5_4.port;
     Switch_8_5_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_8_5_5.port;
     Switch_8_i0.down_port[0] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_8_0_i0.up_port[0];
     Switch_8_i0.down_port[1] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_8_1_i0.up_port[0];
     Switch_8_i0.down_port[2] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_8_2_i0.up_port[0];
     Switch_8_i0.down_port[3] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_8_3_i0.up_port[0];
     Switch_8_i0.down_port[4] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_8_4_i0.up_port[0];
     Switch_8_i0.down_port[5] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_8_5_i0.up_port[0];
     Switch_9_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_0_0.port;
     Switch_9_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_0_1.port;
     Switch_9_0_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_0_2.port;
     Switch_9_0_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_0_3.port;
     Switch_9_0_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_0_4.port;
     Switch_9_0_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_0_5.port;
     Switch_9_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_1_0.port;
     Switch_9_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_1_1.port;
     Switch_9_1_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_1_2.port;
     Switch_9_1_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_1_3.port;
     Switch_9_1_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_1_4.port;
     Switch_9_1_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_1_5.port;
     Switch_9_2_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_2_0.port;
     Switch_9_2_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_2_1.port;
     Switch_9_2_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_2_2.port;
     Switch_9_2_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_2_3.port;
     Switch_9_2_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_2_4.port;
     Switch_9_2_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_2_5.port;
     Switch_9_3_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_3_0.port;
     Switch_9_3_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_3_1.port;
     Switch_9_3_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_3_2.port;
     Switch_9_3_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_3_3.port;
     Switch_9_3_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_3_4.port;
     Switch_9_3_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_3_5.port;
     Switch_9_4_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_4_0.port;
     Switch_9_4_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_4_1.port;
     Switch_9_4_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_4_2.port;
     Switch_9_4_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_4_3.port;
     Switch_9_4_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_4_4.port;
     Switch_9_4_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_4_5.port;
     Switch_9_5_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_5_0.port;
     Switch_9_5_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_5_1.port;
     Switch_9_5_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_5_2.port;
     Switch_9_5_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_5_3.port;
     Switch_9_5_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_5_4.port;
     Switch_9_5_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_9_5_5.port;
     Switch_9_i0.down_port[0] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_9_0_i0.up_port[0];
     Switch_9_i0.down_port[1] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_9_1_i0.up_port[0];
     Switch_9_i0.down_port[2] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_9_2_i0.up_port[0];
     Switch_9_i0.down_port[3] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_9_3_i0.up_port[0];
     Switch_9_i0.down_port[4] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_9_4_i0.up_port[0];
     Switch_9_i0.down_port[5] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_9_5_i0.up_port[0];
     Switch_10_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_0_0.port;
     Switch_10_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_0_1.port;
     Switch_10_0_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_0_2.port;
     Switch_10_0_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_0_3.port;
     Switch_10_0_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_0_4.port;
     Switch_10_0_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_0_5.port;
     Switch_10_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_1_0.port;
     Switch_10_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_1_1.port;
     Switch_10_1_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_1_2.port;
     Switch_10_1_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_1_3.port;
     Switch_10_1_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_1_4.port;
     Switch_10_1_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_1_5.port;
     Switch_10_2_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_2_0.port;
     Switch_10_2_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_2_1.port;
     Switch_10_2_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_2_2.port;
     Switch_10_2_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_2_3.port;
     Switch_10_2_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_2_4.port;
     Switch_10_2_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_2_5.port;
     Switch_10_3_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_3_0.port;
     Switch_10_3_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_3_1.port;
     Switch_10_3_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_3_2.port;
     Switch_10_3_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_3_3.port;
     Switch_10_3_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_3_4.port;
     Switch_10_3_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_3_5.port;
     Switch_10_4_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_4_0.port;
     Switch_10_4_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_4_1.port;
     Switch_10_4_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_4_2.port;
     Switch_10_4_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_4_3.port;
     Switch_10_4_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_4_4.port;
     Switch_10_4_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_4_5.port;
     Switch_10_5_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_5_0.port;
     Switch_10_5_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_5_1.port;
     Switch_10_5_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_5_2.port;
     Switch_10_5_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_5_3.port;
     Switch_10_5_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_5_4.port;
     Switch_10_5_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_10_5_5.port;
     Switch_10_i0.down_port[0] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_10_0_i0.up_port[0];
     Switch_10_i0.down_port[1] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_10_1_i0.up_port[0];
     Switch_10_i0.down_port[2] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_10_2_i0.up_port[0];
     Switch_10_i0.down_port[3] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_10_3_i0.up_port[0];
     Switch_10_i0.down_port[4] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_10_4_i0.up_port[0];
     Switch_10_i0.down_port[5] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_10_5_i0.up_port[0];
     Switch_11_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_0_0.port;
     Switch_11_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_0_1.port;
     Switch_11_0_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_0_2.port;
     Switch_11_0_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_0_3.port;
     Switch_11_0_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_0_4.port;
     Switch_11_0_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_0_5.port;
     Switch_11_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_1_0.port;
     Switch_11_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_1_1.port;
     Switch_11_1_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_1_2.port;
     Switch_11_1_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_1_3.port;
     Switch_11_1_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_1_4.port;
     Switch_11_1_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_1_5.port;
     Switch_11_2_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_2_0.port;
     Switch_11_2_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_2_1.port;
     Switch_11_2_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_2_2.port;
     Switch_11_2_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_2_3.port;
     Switch_11_2_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_2_4.port;
     Switch_11_2_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_2_5.port;
     Switch_11_3_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_3_0.port;
     Switch_11_3_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_3_1.port;
     Switch_11_3_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_3_2.port;
     Switch_11_3_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_3_3.port;
     Switch_11_3_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_3_4.port;
     Switch_11_3_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_3_5.port;
     Switch_11_4_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_4_0.port;
     Switch_11_4_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_4_1.port;
     Switch_11_4_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_4_2.port;
     Switch_11_4_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_4_3.port;
     Switch_11_4_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_4_4.port;
     Switch_11_4_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_4_5.port;
     Switch_11_5_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_5_0.port;
     Switch_11_5_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_5_1.port;
     Switch_11_5_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_5_2.port;
     Switch_11_5_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_5_3.port;
     Switch_11_5_i0.down_port[4] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_5_4.port;
     Switch_11_5_i0.down_port[5] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_11_5_5.port;
     Switch_11_i0.down_port[0] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_11_0_i0.up_port[0];
     Switch_11_i0.down_port[1] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_11_1_i0.up_port[0];
     Switch_11_i0.down_port[2] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_11_2_i0.up_port[0];
     Switch_11_i0.down_port[3] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_11_3_i0.up_port[0];
     Switch_11_i0.down_port[4] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_11_4_i0.up_port[0];
     Switch_11_i0.down_port[5] <--> DCLink { datarate=6Gbps; delay=0ms; } <--> Switch_11_5_i0.up_port[0];
     Switch_i0.down_port[0] <--> DCLink { datarate=36Gbps; delay=0ms; } <--> Switch_0_i0.up_port[0];
     Switch_i0.down_port[1] <--> DCLink { datarate=36Gbps; delay=0ms; } <--> Switch_1_i0.up_port[0];
     Switch_i0.down_port[2] <--> DCLink { datarate=36Gbps; delay=0ms; } <--> Switch_2_i0.up_port[0];
     Switch_i0.down_port[3] <--> DCLink { datarate=36Gbps; delay=0ms; } <--> Switch_3_i0.up_port[0];
     Switch_i0.down_port[4] <--> DCLink { datarate=36Gbps; delay=0ms; } <--> Switch_4_i0.up_port[0];
     Switch_i0.down_port[5] <--> DCLink { datarate=36Gbps; delay=0ms; } <--> Switch_5_i0.up_port[0];
     Switch_i0.down_port[6] <--> DCLink { datarate=36Gbps; delay=0ms; } <--> Switch_6_i0.up_port[0];
     Switch_i0.down_port[7] <--> DCLink { datarate=36Gbps; delay=0ms; } <--> Switch_7_i0.up_port[0];
     Switch_i0.down_port[8] <--> DCLink { datarate=36Gbps; delay=0ms; } <--> Switch_8_i0.up_port[0];
     Switch_i0.down_port[9] <--> DCLink { datarate=36Gbps; delay=0ms; } <--> Switch_9_i0.up_port[0];
     Switch_i0.down_port[10] <--> DCLink { datarate=36Gbps; delay=0ms; } <--> Switch_10_i0.up_port[0];
     Switch_i0.down_port[11] <--> DCLink { datarate=36Gbps; delay=0ms; } <--> Switch_11_i0.up_port[0];
}
