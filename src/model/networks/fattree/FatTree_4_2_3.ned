package datacenter.model.networks.fattree;
import ned.DatarateChannel;
import datacenter.model.switch.EthSwitch;
import datacenter.model.node.server.Server;
import datacenter.model.node.schedulingLayer.*;
import datacenter.model.node.server.ServerBase;
import datacenter.model.node.server.*;


network FatTree_4_2_3
{
  parameters:
    **.tree_depth               = 3;
    //**.int_switches             = 4;
    **.int_switch_down_ports    = 4;
    **.tor_switch_up_ports      = 2;
    **.tor_switch_down_ports    = 2;
    **.switch_up_ports          = 2;
    **.switch_down_ports        = 2;
    **.switch_switch_link_speed = 1Gbps;
    **.server_switch_link_speed = 1Gbps;
    **.number_of_paths = 4;
    string ServerType = default("TCPClientServer");    
        
    //@statistic[switchDrop](title="dropped packet byte length";unit=bytes;record=vector?,min?,max?,mean?,count?,sum?;interpolationmode=none);
    //@statistic[switchQlenPkts](title="queue length (pkts)";record=vector?,timeavg?,max?;interpolationmode=sample-hold);
    //@statistic[serverPortRxBytes](title="received packet byte length";unit=bytes;record=vector?,count?,sum?,mean?,min?,max?;interpolationmode=none);
	//@statistic[serverPortTxBytes](title="transmitting packet byte length";unit=bytes;record=vector?,count?,sum?,mean?,min?,max?;interpolationmode=none);
        
        
  types:
    channel Link_1Gbps extends DatarateChannel
    {
        @class(DCLink);
        datarate = 1 Gbps;
        delay = 10 us;
    }
    channel Link_10Gbps extends DatarateChannel
    {
        datarate = 10 Gbps;
    }

  submodules:
    Server_0_0_0 : <ServerType> like Server
    {
        parameters:
            @display("p=50,650,x");
            //trafficSource.enabled = true;
            //trafficRegulator.enabled = true;
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
        gates:
            down_port[2];
            up_port[2];
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
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_0_i0 : EthSwitch
    {
        parameters:
            @display("p=175,250,x");
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
            @display("p=300,250,x");
            switch_id = "Switch_0_i1";
            depth = 1;
            sub_tree_id = 0;
        gates:
            down_port[2];
            up_port[2];
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
        gates:
            down_port[2];
            up_port[2];
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
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_i0 : EthSwitch
    {
        parameters:
            @display("p=675,250,x");
            switch_id = "Switch_1_i0";
            depth = 1;
            sub_tree_id = 4;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_1_i1 : EthSwitch
    {
        parameters:
            @display("p=800,250,x");
            switch_id = "Switch_1_i1";
            depth = 1;
            sub_tree_id = 4;
        gates:
            down_port[2];
            up_port[2];
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
        gates:
            down_port[2];
            up_port[2];
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
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_i0 : EthSwitch
    {
        parameters:
            @display("p=1175,250,x");
            switch_id = "Switch_2_i0";
            depth = 1;
            sub_tree_id = 8;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_2_i1 : EthSwitch
    {
        parameters:
            @display("p=1300,250,x");
            switch_id = "Switch_2_i1";
            depth = 1;
            sub_tree_id = 8;
        gates:
            down_port[2];
            up_port[2];
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
        gates:
            down_port[2];
            up_port[2];
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
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_i0 : EthSwitch
    {
        parameters:
            @display("p=1675,250,x");
            switch_id = "Switch_3_i0";
            depth = 1;
            sub_tree_id = 12;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_3_i1 : EthSwitch
    {
        parameters:
            @display("p=1800,250,x");
            switch_id = "Switch_3_i1";
            depth = 1;
            sub_tree_id = 12;
        gates:
            down_port[2];
            up_port[2];
    }
    Switch_i0 : EthSwitch
    {
        parameters:
            @display("p=425,50,x");
            switch_id = "Switch_i0";
            depth = 0;
            sub_tree_id = 1606416160;
        gates:
            down_port[4];
            up_port[0];
    }
    Switch_i1 : EthSwitch
    {
        parameters:
            @display("p=800,50,x");
            switch_id = "Switch_i1";
            depth = 0;
            sub_tree_id = 1606416160;
        gates:
            down_port[4];
            up_port[0];
    }
    Switch_i2 : EthSwitch
    {
        parameters:
            @display("p=1175,50,x");
            switch_id = "Switch_i2";
            depth = 0;
            sub_tree_id = 1606416160;
        gates:
            down_port[4];
            up_port[0];
    }
    Switch_i3 : EthSwitch
    {
        parameters:
            @display("p=1550,50,x");
            switch_id = "Switch_i3";
            depth = 0;
            sub_tree_id = 1606416160;
        gates:
            down_port[4];
            up_port[0];
    }

    connections:
     Switch_0_0_i0.down_port[0] <--> Link_1Gbps <--> Server_0_0_0.port;
     Switch_0_0_i0.down_port[1] <--> Link_1Gbps <--> Server_0_0_1.port;
     Switch_0_1_i0.down_port[0] <--> Link_1Gbps <--> Server_0_1_0.port;
     Switch_0_1_i0.down_port[1] <--> Link_1Gbps <--> Server_0_1_1.port;
     Switch_0_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i0.up_port[0];
     Switch_0_i0.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i0.up_port[0];
     Switch_0_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_0_i0.up_port[1];
     Switch_0_i1.down_port[1] <--> Link_1Gbps <--> Switch_0_1_i0.up_port[1];
     Switch_1_0_i0.down_port[0] <--> Link_1Gbps <--> Server_1_0_0.port;
     Switch_1_0_i0.down_port[1] <--> Link_1Gbps <--> Server_1_0_1.port;
     Switch_1_1_i0.down_port[0] <--> Link_1Gbps <--> Server_1_1_0.port;
     Switch_1_1_i0.down_port[1] <--> Link_1Gbps <--> Server_1_1_1.port;
     Switch_1_i0.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i0.up_port[0];
     Switch_1_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i0.up_port[0];
     Switch_1_i1.down_port[0] <--> Link_1Gbps <--> Switch_1_0_i0.up_port[1];
     Switch_1_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_1_i0.up_port[1];
     Switch_2_0_i0.down_port[0] <--> Link_1Gbps <--> Server_2_0_0.port;
     Switch_2_0_i0.down_port[1] <--> Link_1Gbps <--> Server_2_0_1.port;
     Switch_2_1_i0.down_port[0] <--> Link_1Gbps <--> Server_2_1_0.port;
     Switch_2_1_i0.down_port[1] <--> Link_1Gbps <--> Server_2_1_1.port;
     Switch_2_i0.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i0.up_port[0];
     Switch_2_i0.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i0.up_port[0];
     Switch_2_i1.down_port[0] <--> Link_1Gbps <--> Switch_2_0_i0.up_port[1];
     Switch_2_i1.down_port[1] <--> Link_1Gbps <--> Switch_2_1_i0.up_port[1];
     Switch_3_0_i0.down_port[0] <--> Link_1Gbps <--> Server_3_0_0.port;
     Switch_3_0_i0.down_port[1] <--> Link_1Gbps <--> Server_3_0_1.port;
     Switch_3_1_i0.down_port[0] <--> Link_1Gbps <--> Server_3_1_0.port;
     Switch_3_1_i0.down_port[1] <--> Link_1Gbps <--> Server_3_1_1.port;
     Switch_3_i0.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i0.up_port[0];
     Switch_3_i0.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i0.up_port[0];
     Switch_3_i1.down_port[0] <--> Link_1Gbps <--> Switch_3_0_i0.up_port[1];
     Switch_3_i1.down_port[1] <--> Link_1Gbps <--> Switch_3_1_i0.up_port[1];
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
}
