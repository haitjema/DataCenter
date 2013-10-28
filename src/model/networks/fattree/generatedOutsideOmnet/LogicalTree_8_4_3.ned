package datacenter.model.networks.fattree.generatedOutsideOmnet;
import ned.DatarateChannel;
import datacenter.model.switch.EthSwitch;
import datacenter.model.node.server.Server;
import datacenter.model.node.server.*;


network LogicalTree_8_4_3
{
  parameters:
    **.tree_depth               = 3;
    **.int_switch_down_ports    = 8;
    **.tor_switch_up_ports      = 1;
    **.tor_switch_down_ports    = 4;
    **.switch_up_ports          = 1;
    **.switch_down_ports        = 4;
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
    Switch_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=237,450,x");
            switch_id = "Switch_0_0_i0";
            depth = 2;
            sub_tree_id = 0;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=550,650,x");
            address = 4;
        gates:
    }
    Server_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=675,650,x");
            address = 5;
        gates:
    }
    Server_0_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=800,650,x");
            address = 6;
        gates:
    }
    Server_0_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=925,650,x");
            address = 7;
        gates:
    }
    Switch_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=737,450,x");
            switch_id = "Switch_0_1_i0";
            depth = 2;
            sub_tree_id = 4;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_0_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=1050,650,x");
            address = 8;
        gates:
    }
    Server_0_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=1175,650,x");
            address = 9;
        gates:
    }
    Server_0_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=1300,650,x");
            address = 10;
        gates:
    }
    Server_0_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=1425,650,x");
            address = 11;
        gates:
    }
    Switch_0_2_i0 : EthSwitch
    {
        parameters:
            @display("p=1237,450,x");
            switch_id = "Switch_0_2_i0";
            depth = 2;
            sub_tree_id = 8;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_0_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=1550,650,x");
            address = 12;
        gates:
    }
    Server_0_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=1675,650,x");
            address = 13;
        gates:
    }
    Server_0_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=1800,650,x");
            address = 14;
        gates:
    }
    Server_0_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=1925,650,x");
            address = 15;
        gates:
    }
    Switch_0_3_i0 : EthSwitch
    {
        parameters:
            @display("p=1737,450,x");
            switch_id = "Switch_0_3_i0";
            depth = 2;
            sub_tree_id = 12;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Switch_0_i0 : EthSwitch
    {
        parameters:
            @display("p=987,250,x");
            switch_id = "Switch_0_i0";
            depth = 1;
            sub_tree_id = 0;
            upPortQueueSizePkts = 16*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 16*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=2050,650,x");
            address = 16;
        gates:
    }
    Server_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=2175,650,x");
            address = 17;
        gates:
    }
    Server_1_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=2300,650,x");
            address = 18;
        gates:
    }
    Server_1_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=2425,650,x");
            address = 19;
        gates:
    }
    Switch_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=2237,450,x");
            switch_id = "Switch_1_0_i0";
            depth = 2;
            sub_tree_id = 16;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=2550,650,x");
            address = 20;
        gates:
    }
    Server_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=2675,650,x");
            address = 21;
        gates:
    }
    Server_1_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=2800,650,x");
            address = 22;
        gates:
    }
    Server_1_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=2925,650,x");
            address = 23;
        gates:
    }
    Switch_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=2737,450,x");
            switch_id = "Switch_1_1_i0";
            depth = 2;
            sub_tree_id = 20;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_1_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=3050,650,x");
            address = 24;
        gates:
    }
    Server_1_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=3175,650,x");
            address = 25;
        gates:
    }
    Server_1_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=3300,650,x");
            address = 26;
        gates:
    }
    Server_1_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=3425,650,x");
            address = 27;
        gates:
    }
    Switch_1_2_i0 : EthSwitch
    {
        parameters:
            @display("p=3237,450,x");
            switch_id = "Switch_1_2_i0";
            depth = 2;
            sub_tree_id = 24;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_1_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=3550,650,x");
            address = 28;
        gates:
    }
    Server_1_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=3675,650,x");
            address = 29;
        gates:
    }
    Server_1_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=3800,650,x");
            address = 30;
        gates:
    }
    Server_1_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=3925,650,x");
            address = 31;
        gates:
    }
    Switch_1_3_i0 : EthSwitch
    {
        parameters:
            @display("p=3737,450,x");
            switch_id = "Switch_1_3_i0";
            depth = 2;
            sub_tree_id = 28;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Switch_1_i0 : EthSwitch
    {
        parameters:
            @display("p=2987,250,x");
            switch_id = "Switch_1_i0";
            depth = 1;
            sub_tree_id = 16;
            upPortQueueSizePkts = 16*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 16*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_2_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=4050,650,x");
            address = 32;
        gates:
    }
    Server_2_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=4175,650,x");
            address = 33;
        gates:
    }
    Server_2_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=4300,650,x");
            address = 34;
        gates:
    }
    Server_2_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=4425,650,x");
            address = 35;
        gates:
    }
    Switch_2_0_i0 : EthSwitch
    {
        parameters:
            @display("p=4237,450,x");
            switch_id = "Switch_2_0_i0";
            depth = 2;
            sub_tree_id = 32;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_2_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=4550,650,x");
            address = 36;
        gates:
    }
    Server_2_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=4675,650,x");
            address = 37;
        gates:
    }
    Server_2_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=4800,650,x");
            address = 38;
        gates:
    }
    Server_2_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=4925,650,x");
            address = 39;
        gates:
    }
    Switch_2_1_i0 : EthSwitch
    {
        parameters:
            @display("p=4737,450,x");
            switch_id = "Switch_2_1_i0";
            depth = 2;
            sub_tree_id = 36;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_2_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=5050,650,x");
            address = 40;
        gates:
    }
    Server_2_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=5175,650,x");
            address = 41;
        gates:
    }
    Server_2_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=5300,650,x");
            address = 42;
        gates:
    }
    Server_2_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=5425,650,x");
            address = 43;
        gates:
    }
    Switch_2_2_i0 : EthSwitch
    {
        parameters:
            @display("p=5237,450,x");
            switch_id = "Switch_2_2_i0";
            depth = 2;
            sub_tree_id = 40;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_2_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=5550,650,x");
            address = 44;
        gates:
    }
    Server_2_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=5675,650,x");
            address = 45;
        gates:
    }
    Server_2_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=5800,650,x");
            address = 46;
        gates:
    }
    Server_2_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=5925,650,x");
            address = 47;
        gates:
    }
    Switch_2_3_i0 : EthSwitch
    {
        parameters:
            @display("p=5737,450,x");
            switch_id = "Switch_2_3_i0";
            depth = 2;
            sub_tree_id = 44;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Switch_2_i0 : EthSwitch
    {
        parameters:
            @display("p=4987,250,x");
            switch_id = "Switch_2_i0";
            depth = 1;
            sub_tree_id = 32;
            upPortQueueSizePkts = 16*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 16*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_3_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=6050,650,x");
            address = 48;
        gates:
    }
    Server_3_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=6175,650,x");
            address = 49;
        gates:
    }
    Server_3_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=6300,650,x");
            address = 50;
        gates:
    }
    Server_3_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=6425,650,x");
            address = 51;
        gates:
    }
    Switch_3_0_i0 : EthSwitch
    {
        parameters:
            @display("p=6237,450,x");
            switch_id = "Switch_3_0_i0";
            depth = 2;
            sub_tree_id = 48;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_3_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=6550,650,x");
            address = 52;
        gates:
    }
    Server_3_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=6675,650,x");
            address = 53;
        gates:
    }
    Server_3_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=6800,650,x");
            address = 54;
        gates:
    }
    Server_3_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=6925,650,x");
            address = 55;
        gates:
    }
    Switch_3_1_i0 : EthSwitch
    {
        parameters:
            @display("p=6737,450,x");
            switch_id = "Switch_3_1_i0";
            depth = 2;
            sub_tree_id = 52;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_3_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=7050,650,x");
            address = 56;
        gates:
    }
    Server_3_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=7175,650,x");
            address = 57;
        gates:
    }
    Server_3_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=7300,650,x");
            address = 58;
        gates:
    }
    Server_3_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=7425,650,x");
            address = 59;
        gates:
    }
    Switch_3_2_i0 : EthSwitch
    {
        parameters:
            @display("p=7237,450,x");
            switch_id = "Switch_3_2_i0";
            depth = 2;
            sub_tree_id = 56;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_3_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=7550,650,x");
            address = 60;
        gates:
    }
    Server_3_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=7675,650,x");
            address = 61;
        gates:
    }
    Server_3_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=7800,650,x");
            address = 62;
        gates:
    }
    Server_3_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=7925,650,x");
            address = 63;
        gates:
    }
    Switch_3_3_i0 : EthSwitch
    {
        parameters:
            @display("p=7737,450,x");
            switch_id = "Switch_3_3_i0";
            depth = 2;
            sub_tree_id = 60;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Switch_3_i0 : EthSwitch
    {
        parameters:
            @display("p=6987,250,x");
            switch_id = "Switch_3_i0";
            depth = 1;
            sub_tree_id = 48;
            upPortQueueSizePkts = 16*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 16*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_4_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=8050,650,x");
            address = 64;
        gates:
    }
    Server_4_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=8175,650,x");
            address = 65;
        gates:
    }
    Server_4_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=8300,650,x");
            address = 66;
        gates:
    }
    Server_4_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=8425,650,x");
            address = 67;
        gates:
    }
    Switch_4_0_i0 : EthSwitch
    {
        parameters:
            @display("p=8237,450,x");
            switch_id = "Switch_4_0_i0";
            depth = 2;
            sub_tree_id = 64;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_4_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=8550,650,x");
            address = 68;
        gates:
    }
    Server_4_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=8675,650,x");
            address = 69;
        gates:
    }
    Server_4_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=8800,650,x");
            address = 70;
        gates:
    }
    Server_4_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=8925,650,x");
            address = 71;
        gates:
    }
    Switch_4_1_i0 : EthSwitch
    {
        parameters:
            @display("p=8737,450,x");
            switch_id = "Switch_4_1_i0";
            depth = 2;
            sub_tree_id = 68;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_4_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=9050,650,x");
            address = 72;
        gates:
    }
    Server_4_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=9175,650,x");
            address = 73;
        gates:
    }
    Server_4_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=9300,650,x");
            address = 74;
        gates:
    }
    Server_4_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=9425,650,x");
            address = 75;
        gates:
    }
    Switch_4_2_i0 : EthSwitch
    {
        parameters:
            @display("p=9237,450,x");
            switch_id = "Switch_4_2_i0";
            depth = 2;
            sub_tree_id = 72;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_4_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=9550,650,x");
            address = 76;
        gates:
    }
    Server_4_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=9675,650,x");
            address = 77;
        gates:
    }
    Server_4_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=9800,650,x");
            address = 78;
        gates:
    }
    Server_4_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=9925,650,x");
            address = 79;
        gates:
    }
    Switch_4_3_i0 : EthSwitch
    {
        parameters:
            @display("p=9737,450,x");
            switch_id = "Switch_4_3_i0";
            depth = 2;
            sub_tree_id = 76;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Switch_4_i0 : EthSwitch
    {
        parameters:
            @display("p=8987,250,x");
            switch_id = "Switch_4_i0";
            depth = 1;
            sub_tree_id = 64;
            upPortQueueSizePkts = 16*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 16*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_5_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=10050,650,x");
            address = 80;
        gates:
    }
    Server_5_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=10175,650,x");
            address = 81;
        gates:
    }
    Server_5_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=10300,650,x");
            address = 82;
        gates:
    }
    Server_5_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=10425,650,x");
            address = 83;
        gates:
    }
    Switch_5_0_i0 : EthSwitch
    {
        parameters:
            @display("p=10237,450,x");
            switch_id = "Switch_5_0_i0";
            depth = 2;
            sub_tree_id = 80;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_5_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=10550,650,x");
            address = 84;
        gates:
    }
    Server_5_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=10675,650,x");
            address = 85;
        gates:
    }
    Server_5_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=10800,650,x");
            address = 86;
        gates:
    }
    Server_5_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=10925,650,x");
            address = 87;
        gates:
    }
    Switch_5_1_i0 : EthSwitch
    {
        parameters:
            @display("p=10737,450,x");
            switch_id = "Switch_5_1_i0";
            depth = 2;
            sub_tree_id = 84;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_5_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=11050,650,x");
            address = 88;
        gates:
    }
    Server_5_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=11175,650,x");
            address = 89;
        gates:
    }
    Server_5_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=11300,650,x");
            address = 90;
        gates:
    }
    Server_5_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=11425,650,x");
            address = 91;
        gates:
    }
    Switch_5_2_i0 : EthSwitch
    {
        parameters:
            @display("p=11237,450,x");
            switch_id = "Switch_5_2_i0";
            depth = 2;
            sub_tree_id = 88;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_5_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=11550,650,x");
            address = 92;
        gates:
    }
    Server_5_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=11675,650,x");
            address = 93;
        gates:
    }
    Server_5_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=11800,650,x");
            address = 94;
        gates:
    }
    Server_5_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=11925,650,x");
            address = 95;
        gates:
    }
    Switch_5_3_i0 : EthSwitch
    {
        parameters:
            @display("p=11737,450,x");
            switch_id = "Switch_5_3_i0";
            depth = 2;
            sub_tree_id = 92;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Switch_5_i0 : EthSwitch
    {
        parameters:
            @display("p=10987,250,x");
            switch_id = "Switch_5_i0";
            depth = 1;
            sub_tree_id = 80;
            upPortQueueSizePkts = 16*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 16*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_6_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=12050,650,x");
            address = 96;
        gates:
    }
    Server_6_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=12175,650,x");
            address = 97;
        gates:
    }
    Server_6_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=12300,650,x");
            address = 98;
        gates:
    }
    Server_6_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=12425,650,x");
            address = 99;
        gates:
    }
    Switch_6_0_i0 : EthSwitch
    {
        parameters:
            @display("p=12237,450,x");
            switch_id = "Switch_6_0_i0";
            depth = 2;
            sub_tree_id = 96;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_6_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=12550,650,x");
            address = 100;
        gates:
    }
    Server_6_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=12675,650,x");
            address = 101;
        gates:
    }
    Server_6_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=12800,650,x");
            address = 102;
        gates:
    }
    Server_6_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=12925,650,x");
            address = 103;
        gates:
    }
    Switch_6_1_i0 : EthSwitch
    {
        parameters:
            @display("p=12737,450,x");
            switch_id = "Switch_6_1_i0";
            depth = 2;
            sub_tree_id = 100;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_6_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=13050,650,x");
            address = 104;
        gates:
    }
    Server_6_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=13175,650,x");
            address = 105;
        gates:
    }
    Server_6_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=13300,650,x");
            address = 106;
        gates:
    }
    Server_6_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=13425,650,x");
            address = 107;
        gates:
    }
    Switch_6_2_i0 : EthSwitch
    {
        parameters:
            @display("p=13237,450,x");
            switch_id = "Switch_6_2_i0";
            depth = 2;
            sub_tree_id = 104;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_6_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=13550,650,x");
            address = 108;
        gates:
    }
    Server_6_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=13675,650,x");
            address = 109;
        gates:
    }
    Server_6_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=13800,650,x");
            address = 110;
        gates:
    }
    Server_6_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=13925,650,x");
            address = 111;
        gates:
    }
    Switch_6_3_i0 : EthSwitch
    {
        parameters:
            @display("p=13737,450,x");
            switch_id = "Switch_6_3_i0";
            depth = 2;
            sub_tree_id = 108;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Switch_6_i0 : EthSwitch
    {
        parameters:
            @display("p=12987,250,x");
            switch_id = "Switch_6_i0";
            depth = 1;
            sub_tree_id = 96;
            upPortQueueSizePkts = 16*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 16*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_7_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=14050,650,x");
            address = 112;
        gates:
    }
    Server_7_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=14175,650,x");
            address = 113;
        gates:
    }
    Server_7_0_2 : <ServerType> like Server
    {
        parameters:
            @display("p=14300,650,x");
            address = 114;
        gates:
    }
    Server_7_0_3 : <ServerType> like Server
    {
        parameters:
            @display("p=14425,650,x");
            address = 115;
        gates:
    }
    Switch_7_0_i0 : EthSwitch
    {
        parameters:
            @display("p=14237,450,x");
            switch_id = "Switch_7_0_i0";
            depth = 2;
            sub_tree_id = 112;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_7_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=14550,650,x");
            address = 116;
        gates:
    }
    Server_7_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=14675,650,x");
            address = 117;
        gates:
    }
    Server_7_1_2 : <ServerType> like Server
    {
        parameters:
            @display("p=14800,650,x");
            address = 118;
        gates:
    }
    Server_7_1_3 : <ServerType> like Server
    {
        parameters:
            @display("p=14925,650,x");
            address = 119;
        gates:
    }
    Switch_7_1_i0 : EthSwitch
    {
        parameters:
            @display("p=14737,450,x");
            switch_id = "Switch_7_1_i0";
            depth = 2;
            sub_tree_id = 116;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_7_2_0 : <ServerType> like Server
    {
        parameters:
            @display("p=15050,650,x");
            address = 120;
        gates:
    }
    Server_7_2_1 : <ServerType> like Server
    {
        parameters:
            @display("p=15175,650,x");
            address = 121;
        gates:
    }
    Server_7_2_2 : <ServerType> like Server
    {
        parameters:
            @display("p=15300,650,x");
            address = 122;
        gates:
    }
    Server_7_2_3 : <ServerType> like Server
    {
        parameters:
            @display("p=15425,650,x");
            address = 123;
        gates:
    }
    Switch_7_2_i0 : EthSwitch
    {
        parameters:
            @display("p=15237,450,x");
            switch_id = "Switch_7_2_i0";
            depth = 2;
            sub_tree_id = 120;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Server_7_3_0 : <ServerType> like Server
    {
        parameters:
            @display("p=15550,650,x");
            address = 124;
        gates:
    }
    Server_7_3_1 : <ServerType> like Server
    {
        parameters:
            @display("p=15675,650,x");
            address = 125;
        gates:
    }
    Server_7_3_2 : <ServerType> like Server
    {
        parameters:
            @display("p=15800,650,x");
            address = 126;
        gates:
    }
    Server_7_3_3 : <ServerType> like Server
    {
        parameters:
            @display("p=15925,650,x");
            address = 127;
        gates:
    }
    Switch_7_3_i0 : EthSwitch
    {
        parameters:
            @display("p=15737,450,x");
            switch_id = "Switch_7_3_i0";
            depth = 2;
            sub_tree_id = 124;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Switch_7_i0 : EthSwitch
    {
        parameters:
            @display("p=14987,250,x");
            switch_id = "Switch_7_i0";
            depth = 1;
            sub_tree_id = 112;
            upPortQueueSizePkts = 16*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 16*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[1];
    }
    Switch_i0 : EthSwitch
    {
        parameters:
            @display("p=7987,50,x");
            switch_id = "Switch_i0";
            depth = 0;
            sub_tree_id = 0;
            upPortQueueSizePkts = 0*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 0*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 16*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 16*DefaultQueueSizeBytes; 
        gates:
            down_port[8];
            up_port[0];
    }

    connections:
     Switch_0_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_0_0.port;
     Switch_0_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_0_1.port;
     Switch_0_0_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_0_2.port;
     Switch_0_0_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_0_3.port;
     Switch_0_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_1_0.port;
     Switch_0_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_1_1.port;
     Switch_0_1_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_1_2.port;
     Switch_0_1_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_1_3.port;
     Switch_0_2_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_2_0.port;
     Switch_0_2_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_2_1.port;
     Switch_0_2_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_2_2.port;
     Switch_0_2_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_2_3.port;
     Switch_0_3_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_3_0.port;
     Switch_0_3_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_3_1.port;
     Switch_0_3_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_3_2.port;
     Switch_0_3_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_3_3.port;
     Switch_0_i0.down_port[0] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_0_0_i0.up_port[0];
     Switch_0_i0.down_port[1] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_0_1_i0.up_port[0];
     Switch_0_i0.down_port[2] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_0_2_i0.up_port[0];
     Switch_0_i0.down_port[3] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_0_3_i0.up_port[0];
     Switch_1_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_0_0.port;
     Switch_1_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_0_1.port;
     Switch_1_0_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_0_2.port;
     Switch_1_0_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_0_3.port;
     Switch_1_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_1_0.port;
     Switch_1_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_1_1.port;
     Switch_1_1_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_1_2.port;
     Switch_1_1_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_1_3.port;
     Switch_1_2_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_2_0.port;
     Switch_1_2_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_2_1.port;
     Switch_1_2_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_2_2.port;
     Switch_1_2_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_2_3.port;
     Switch_1_3_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_3_0.port;
     Switch_1_3_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_3_1.port;
     Switch_1_3_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_3_2.port;
     Switch_1_3_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_3_3.port;
     Switch_1_i0.down_port[0] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_1_0_i0.up_port[0];
     Switch_1_i0.down_port[1] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_1_1_i0.up_port[0];
     Switch_1_i0.down_port[2] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_1_2_i0.up_port[0];
     Switch_1_i0.down_port[3] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_1_3_i0.up_port[0];
     Switch_2_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_0_0.port;
     Switch_2_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_0_1.port;
     Switch_2_0_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_0_2.port;
     Switch_2_0_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_0_3.port;
     Switch_2_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_1_0.port;
     Switch_2_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_1_1.port;
     Switch_2_1_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_1_2.port;
     Switch_2_1_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_1_3.port;
     Switch_2_2_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_2_0.port;
     Switch_2_2_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_2_1.port;
     Switch_2_2_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_2_2.port;
     Switch_2_2_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_2_3.port;
     Switch_2_3_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_3_0.port;
     Switch_2_3_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_3_1.port;
     Switch_2_3_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_3_2.port;
     Switch_2_3_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_3_3.port;
     Switch_2_i0.down_port[0] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_2_0_i0.up_port[0];
     Switch_2_i0.down_port[1] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_2_1_i0.up_port[0];
     Switch_2_i0.down_port[2] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_2_2_i0.up_port[0];
     Switch_2_i0.down_port[3] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_2_3_i0.up_port[0];
     Switch_3_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_0_0.port;
     Switch_3_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_0_1.port;
     Switch_3_0_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_0_2.port;
     Switch_3_0_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_0_3.port;
     Switch_3_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_1_0.port;
     Switch_3_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_1_1.port;
     Switch_3_1_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_1_2.port;
     Switch_3_1_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_1_3.port;
     Switch_3_2_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_2_0.port;
     Switch_3_2_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_2_1.port;
     Switch_3_2_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_2_2.port;
     Switch_3_2_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_2_3.port;
     Switch_3_3_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_3_0.port;
     Switch_3_3_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_3_1.port;
     Switch_3_3_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_3_2.port;
     Switch_3_3_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_3_3.port;
     Switch_3_i0.down_port[0] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_3_0_i0.up_port[0];
     Switch_3_i0.down_port[1] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_3_1_i0.up_port[0];
     Switch_3_i0.down_port[2] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_3_2_i0.up_port[0];
     Switch_3_i0.down_port[3] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_3_3_i0.up_port[0];
     Switch_4_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_0_0.port;
     Switch_4_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_0_1.port;
     Switch_4_0_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_0_2.port;
     Switch_4_0_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_0_3.port;
     Switch_4_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_1_0.port;
     Switch_4_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_1_1.port;
     Switch_4_1_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_1_2.port;
     Switch_4_1_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_1_3.port;
     Switch_4_2_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_2_0.port;
     Switch_4_2_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_2_1.port;
     Switch_4_2_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_2_2.port;
     Switch_4_2_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_2_3.port;
     Switch_4_3_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_3_0.port;
     Switch_4_3_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_3_1.port;
     Switch_4_3_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_3_2.port;
     Switch_4_3_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_4_3_3.port;
     Switch_4_i0.down_port[0] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_4_0_i0.up_port[0];
     Switch_4_i0.down_port[1] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_4_1_i0.up_port[0];
     Switch_4_i0.down_port[2] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_4_2_i0.up_port[0];
     Switch_4_i0.down_port[3] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_4_3_i0.up_port[0];
     Switch_5_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_0_0.port;
     Switch_5_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_0_1.port;
     Switch_5_0_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_0_2.port;
     Switch_5_0_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_0_3.port;
     Switch_5_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_1_0.port;
     Switch_5_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_1_1.port;
     Switch_5_1_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_1_2.port;
     Switch_5_1_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_1_3.port;
     Switch_5_2_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_2_0.port;
     Switch_5_2_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_2_1.port;
     Switch_5_2_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_2_2.port;
     Switch_5_2_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_2_3.port;
     Switch_5_3_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_3_0.port;
     Switch_5_3_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_3_1.port;
     Switch_5_3_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_3_2.port;
     Switch_5_3_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_5_3_3.port;
     Switch_5_i0.down_port[0] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_5_0_i0.up_port[0];
     Switch_5_i0.down_port[1] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_5_1_i0.up_port[0];
     Switch_5_i0.down_port[2] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_5_2_i0.up_port[0];
     Switch_5_i0.down_port[3] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_5_3_i0.up_port[0];
     Switch_6_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_0_0.port;
     Switch_6_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_0_1.port;
     Switch_6_0_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_0_2.port;
     Switch_6_0_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_0_3.port;
     Switch_6_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_1_0.port;
     Switch_6_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_1_1.port;
     Switch_6_1_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_1_2.port;
     Switch_6_1_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_1_3.port;
     Switch_6_2_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_2_0.port;
     Switch_6_2_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_2_1.port;
     Switch_6_2_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_2_2.port;
     Switch_6_2_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_2_3.port;
     Switch_6_3_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_3_0.port;
     Switch_6_3_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_3_1.port;
     Switch_6_3_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_3_2.port;
     Switch_6_3_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_6_3_3.port;
     Switch_6_i0.down_port[0] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_6_0_i0.up_port[0];
     Switch_6_i0.down_port[1] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_6_1_i0.up_port[0];
     Switch_6_i0.down_port[2] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_6_2_i0.up_port[0];
     Switch_6_i0.down_port[3] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_6_3_i0.up_port[0];
     Switch_7_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_0_0.port;
     Switch_7_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_0_1.port;
     Switch_7_0_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_0_2.port;
     Switch_7_0_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_0_3.port;
     Switch_7_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_1_0.port;
     Switch_7_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_1_1.port;
     Switch_7_1_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_1_2.port;
     Switch_7_1_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_1_3.port;
     Switch_7_2_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_2_0.port;
     Switch_7_2_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_2_1.port;
     Switch_7_2_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_2_2.port;
     Switch_7_2_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_2_3.port;
     Switch_7_3_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_3_0.port;
     Switch_7_3_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_3_1.port;
     Switch_7_3_i0.down_port[2] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_3_2.port;
     Switch_7_3_i0.down_port[3] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_7_3_3.port;
     Switch_7_i0.down_port[0] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_7_0_i0.up_port[0];
     Switch_7_i0.down_port[1] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_7_1_i0.up_port[0];
     Switch_7_i0.down_port[2] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_7_2_i0.up_port[0];
     Switch_7_i0.down_port[3] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_7_3_i0.up_port[0];
     Switch_i0.down_port[0] <--> DCLink { datarate=16Gbps; delay=0ms; } <--> Switch_0_i0.up_port[0];
     Switch_i0.down_port[1] <--> DCLink { datarate=16Gbps; delay=0ms; } <--> Switch_1_i0.up_port[0];
     Switch_i0.down_port[2] <--> DCLink { datarate=16Gbps; delay=0ms; } <--> Switch_2_i0.up_port[0];
     Switch_i0.down_port[3] <--> DCLink { datarate=16Gbps; delay=0ms; } <--> Switch_3_i0.up_port[0];
     Switch_i0.down_port[4] <--> DCLink { datarate=16Gbps; delay=0ms; } <--> Switch_4_i0.up_port[0];
     Switch_i0.down_port[5] <--> DCLink { datarate=16Gbps; delay=0ms; } <--> Switch_5_i0.up_port[0];
     Switch_i0.down_port[6] <--> DCLink { datarate=16Gbps; delay=0ms; } <--> Switch_6_i0.up_port[0];
     Switch_i0.down_port[7] <--> DCLink { datarate=16Gbps; delay=0ms; } <--> Switch_7_i0.up_port[0];
}
