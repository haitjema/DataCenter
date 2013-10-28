package datacenter.model.networks.fattree.generatedOutsideOmnet;
import ned.DatarateChannel;
import datacenter.model.switch.EthSwitch;
import datacenter.model.node.server.Server;
import datacenter.model.node.server.*;


network LogicalTree_4_2_3
{
  parameters:
    **.tree_depth               = 3;
    **.int_switch_down_ports    = 4;
    **.tor_switch_up_ports      = 1;
    **.tor_switch_down_ports    = 2;
    **.switch_up_ports          = 1;
    **.switch_down_ports        = 2;
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
    Switch_0_0_i0 : EthSwitch
    {
        parameters:
            @display("p=112,450,x");
            switch_id = "Switch_0_0_i0";
            depth = 2;
            sub_tree_id = 0;
            upPortQueueSizePkts = 2*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 2*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[2];
            up_port[1];
    }
    Server_0_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=300,650,x");
            address = 2;
        gates:
    }
    Server_0_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=425,650,x");
            address = 3;
        gates:
    }
    Switch_0_1_i0 : EthSwitch
    {
        parameters:
            @display("p=362,450,x");
            switch_id = "Switch_0_1_i0";
            depth = 2;
            sub_tree_id = 2;
            upPortQueueSizePkts = 2*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 2*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[2];
            up_port[1];
    }
    Switch_0_i0 : EthSwitch
    {
        parameters:
            @display("p=237,250,x");
            switch_id = "Switch_0_i0";
            depth = 1;
            sub_tree_id = 0;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 2*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 2*DefaultQueueSizeBytes; 
        gates:
            down_port[2];
            up_port[1];
    }
    Server_1_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=550,650,x");
            address = 4;
        gates:
    }
    Server_1_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=675,650,x");
            address = 5;
        gates:
    }
    Switch_1_0_i0 : EthSwitch
    {
        parameters:
            @display("p=612,450,x");
            switch_id = "Switch_1_0_i0";
            depth = 2;
            sub_tree_id = 4;
            upPortQueueSizePkts = 2*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 2*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[2];
            up_port[1];
    }
    Server_1_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=800,650,x");
            address = 6;
        gates:
    }
    Server_1_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=925,650,x");
            address = 7;
        gates:
    }
    Switch_1_1_i0 : EthSwitch
    {
        parameters:
            @display("p=862,450,x");
            switch_id = "Switch_1_1_i0";
            depth = 2;
            sub_tree_id = 6;
            upPortQueueSizePkts = 2*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 2*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[2];
            up_port[1];
    }
    Switch_1_i0 : EthSwitch
    {
        parameters:
            @display("p=737,250,x");
            switch_id = "Switch_1_i0";
            depth = 1;
            sub_tree_id = 4;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 2*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 2*DefaultQueueSizeBytes; 
        gates:
            down_port[2];
            up_port[1];
    }
    Server_2_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=1050,650,x");
            address = 8;
        gates:
    }
    Server_2_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=1175,650,x");
            address = 9;
        gates:
    }
    Switch_2_0_i0 : EthSwitch
    {
        parameters:
            @display("p=1112,450,x");
            switch_id = "Switch_2_0_i0";
            depth = 2;
            sub_tree_id = 8;
            upPortQueueSizePkts = 2*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 2*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[2];
            up_port[1];
    }
    Server_2_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=1300,650,x");
            address = 10;
        gates:
    }
    Server_2_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=1425,650,x");
            address = 11;
        gates:
    }
    Switch_2_1_i0 : EthSwitch
    {
        parameters:
            @display("p=1362,450,x");
            switch_id = "Switch_2_1_i0";
            depth = 2;
            sub_tree_id = 10;
            upPortQueueSizePkts = 2*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 2*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[2];
            up_port[1];
    }
    Switch_2_i0 : EthSwitch
    {
        parameters:
            @display("p=1237,250,x");
            switch_id = "Switch_2_i0";
            depth = 1;
            sub_tree_id = 8;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 2*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 2*DefaultQueueSizeBytes; 
        gates:
            down_port[2];
            up_port[1];
    }
    Server_3_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=1550,650,x");
            address = 12;
        gates:
    }
    Server_3_0_1 : <ServerType> like Server
    {
        parameters:
            @display("p=1675,650,x");
            address = 13;
        gates:
    }
    Switch_3_0_i0 : EthSwitch
    {
        parameters:
            @display("p=1612,450,x");
            switch_id = "Switch_3_0_i0";
            depth = 2;
            sub_tree_id = 12;
            upPortQueueSizePkts = 2*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 2*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[2];
            up_port[1];
    }
    Server_3_1_0 : <ServerType> like Server
    {
        parameters:
            @display("p=1800,650,x");
            address = 14;
        gates:
    }
    Server_3_1_1 : <ServerType> like Server
    {
        parameters:
            @display("p=1925,650,x");
            address = 15;
        gates:
    }
    Switch_3_1_i0 : EthSwitch
    {
        parameters:
            @display("p=1862,450,x");
            switch_id = "Switch_3_1_i0";
            depth = 2;
            sub_tree_id = 14;
            upPortQueueSizePkts = 2*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 2*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 1*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 1*DefaultQueueSizeBytes; 
        gates:
            down_port[2];
            up_port[1];
    }
    Switch_3_i0 : EthSwitch
    {
        parameters:
            @display("p=1737,250,x");
            switch_id = "Switch_3_i0";
            depth = 1;
            sub_tree_id = 12;
            upPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 2*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 2*DefaultQueueSizeBytes; 
        gates:
            down_port[2];
            up_port[1];
    }
    Switch_i0 : EthSwitch
    {
        parameters:
            @display("p=987,50,x");
            switch_id = "Switch_i0";
            depth = 0;
            sub_tree_id = 0;
            upPortQueueSizePkts = 0*DefaultQueueSizePkts; 
            upPortQueueSizeBytes = 0*DefaultQueueSizeBytes; 
            downPortQueueSizePkts = 4*DefaultQueueSizePkts; 
            downPortQueueSizeBytes = 4*DefaultQueueSizeBytes; 
        gates:
            down_port[4];
            up_port[0];
    }

    connections:
     Switch_0_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_0_0.port;
     Switch_0_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_0_1.port;
     Switch_0_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_1_0.port;
     Switch_0_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_0_1_1.port;
     Switch_0_i0.down_port[0] <--> DCLink { datarate=2Gbps; delay=0ms; } <--> Switch_0_0_i0.up_port[0];
     Switch_0_i0.down_port[1] <--> DCLink { datarate=2Gbps; delay=0ms; } <--> Switch_0_1_i0.up_port[0];
     Switch_1_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_0_0.port;
     Switch_1_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_0_1.port;
     Switch_1_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_1_0.port;
     Switch_1_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_1_1_1.port;
     Switch_1_i0.down_port[0] <--> DCLink { datarate=2Gbps; delay=0ms; } <--> Switch_1_0_i0.up_port[0];
     Switch_1_i0.down_port[1] <--> DCLink { datarate=2Gbps; delay=0ms; } <--> Switch_1_1_i0.up_port[0];
     Switch_2_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_0_0.port;
     Switch_2_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_0_1.port;
     Switch_2_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_1_0.port;
     Switch_2_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_2_1_1.port;
     Switch_2_i0.down_port[0] <--> DCLink { datarate=2Gbps; delay=0ms; } <--> Switch_2_0_i0.up_port[0];
     Switch_2_i0.down_port[1] <--> DCLink { datarate=2Gbps; delay=0ms; } <--> Switch_2_1_i0.up_port[0];
     Switch_3_0_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_0_0.port;
     Switch_3_0_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_0_1.port;
     Switch_3_1_i0.down_port[0] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_1_0.port;
     Switch_3_1_i0.down_port[1] <--> DCLink { datarate=1Gbps; delay=0ms; } <--> Server_3_1_1.port;
     Switch_3_i0.down_port[0] <--> DCLink { datarate=2Gbps; delay=0ms; } <--> Switch_3_0_i0.up_port[0];
     Switch_3_i0.down_port[1] <--> DCLink { datarate=2Gbps; delay=0ms; } <--> Switch_3_1_i0.up_port[0];
     Switch_i0.down_port[0] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_0_i0.up_port[0];
     Switch_i0.down_port[1] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_1_i0.up_port[0];
     Switch_i0.down_port[2] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_2_i0.up_port[0];
     Switch_i0.down_port[3] <--> DCLink { datarate=4Gbps; delay=0ms; } <--> Switch_3_i0.up_port[0];
}
