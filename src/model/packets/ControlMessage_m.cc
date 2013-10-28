//
// Generated file, do not edit! Created by opp_msgc 4.3 from model/packets/ControlMessage.msg.
//

// Disable warnings about unused variables, empty switch stmts, etc:
#ifdef _MSC_VER
#  pragma warning(disable:4101)
#  pragma warning(disable:4065)
#endif

#include <iostream>
#include <sstream>
#include "ControlMessage_m.h"

// Template rule which fires if a struct or class doesn't have operator<<
template<typename T>
std::ostream& operator<<(std::ostream& out,const T&) {return out;}

// Another default rule (prevents compiler from choosing base class' doPacking())
template<typename T>
void doPacking(cCommBuffer *, T& t) {
    throw cRuntimeError("Parsim error: no doPacking() function for type %s or its base class (check .msg and _m.cc/h files!)",opp_typename(typeid(t)));
}

template<typename T>
void doUnpacking(cCommBuffer *, T& t) {
    throw cRuntimeError("Parsim error: no doUnpacking() function for type %s or its base class (check .msg and _m.cc/h files!)",opp_typename(typeid(t)));
}




EXECUTE_ON_STARTUP(
    cEnum *e = cEnum::find("ControlMessageType");
    if (!e) enums.getInstance()->add(e = new cEnum("ControlMessageType"));
    e->insert(CONTROL_MESSAGE_BASE_KIND, "CONTROL_MESSAGE_BASE_KIND");
    e->insert(TRAFFIC_SOURCE_CONTROL_MSG, "TRAFFIC_SOURCE_CONTROL_MSG");
    e->insert(UPDATE_SENDING_RATE_MSG, "UPDATE_SENDING_RATE_MSG");
    e->insert(UPDATE_QUEUE_SIZE_MSG, "UPDATE_QUEUE_SIZE_MSG");
    e->insert(SCHEDULING_CONTROL_MSG, "SCHEDULING_CONTROL_MSG");
    e->insert(TENANT_SERVERS_MSG, "TENANT_SERVERS_MSG");
);

ControlMessage_Base::ControlMessage_Base(const char *name, int kind) : cMessage(name,kind)
{
    this->srcAddr_var = 0;
    this->dstAddr_var = 0;
    this->srcSubModule_var = 0;
    this->dstSubModule_var = 0;
    this->type_var = CONTROL_MESSAGE_BASE_KIND;
}

ControlMessage_Base::ControlMessage_Base(const ControlMessage_Base& other) : cMessage(other)
{
    copy(other);
}

ControlMessage_Base::~ControlMessage_Base()
{
}

ControlMessage_Base& ControlMessage_Base::operator=(const ControlMessage_Base& other)
{
    if (this==&other) return *this;
    cMessage::operator=(other);
    copy(other);
    return *this;
}

void ControlMessage_Base::copy(const ControlMessage_Base& other)
{
    this->srcAddr_var = other.srcAddr_var;
    this->dstAddr_var = other.dstAddr_var;
    this->srcSubModule_var = other.srcSubModule_var;
    this->dstSubModule_var = other.dstSubModule_var;
    this->type_var = other.type_var;
}

void ControlMessage_Base::parsimPack(cCommBuffer *b)
{
    cMessage::parsimPack(b);
    doPacking(b,this->srcAddr_var);
    doPacking(b,this->dstAddr_var);
    doPacking(b,this->srcSubModule_var);
    doPacking(b,this->dstSubModule_var);
    doPacking(b,this->type_var);
}

void ControlMessage_Base::parsimUnpack(cCommBuffer *b)
{
    cMessage::parsimUnpack(b);
    doUnpacking(b,this->srcAddr_var);
    doUnpacking(b,this->dstAddr_var);
    doUnpacking(b,this->srcSubModule_var);
    doUnpacking(b,this->dstSubModule_var);
    doUnpacking(b,this->type_var);
}

unsigned int ControlMessage_Base::getSrcAddr() const
{
    return srcAddr_var;
}

void ControlMessage_Base::setSrcAddr(unsigned int srcAddr)
{
    this->srcAddr_var = srcAddr;
}

unsigned int ControlMessage_Base::getDstAddr() const
{
    return dstAddr_var;
}

void ControlMessage_Base::setDstAddr(unsigned int dstAddr)
{
    this->dstAddr_var = dstAddr;
}

const char * ControlMessage_Base::getSrcSubModule() const
{
    return srcSubModule_var.c_str();
}

void ControlMessage_Base::setSrcSubModule(const char * srcSubModule)
{
    this->srcSubModule_var = srcSubModule;
}

const char * ControlMessage_Base::getDstSubModule() const
{
    return dstSubModule_var.c_str();
}

void ControlMessage_Base::setDstSubModule(const char * dstSubModule)
{
    this->dstSubModule_var = dstSubModule;
}

unsigned short ControlMessage_Base::getType() const
{
    return type_var;
}

void ControlMessage_Base::setType(unsigned short type)
{
    this->type_var = type;
}

class ControlMessageDescriptor : public cClassDescriptor
{
  public:
    ControlMessageDescriptor();
    virtual ~ControlMessageDescriptor();

    virtual bool doesSupport(cObject *obj) const;
    virtual const char *getProperty(const char *propertyname) const;
    virtual int getFieldCount(void *object) const;
    virtual const char *getFieldName(void *object, int field) const;
    virtual int findField(void *object, const char *fieldName) const;
    virtual unsigned int getFieldTypeFlags(void *object, int field) const;
    virtual const char *getFieldTypeString(void *object, int field) const;
    virtual const char *getFieldProperty(void *object, int field, const char *propertyname) const;
    virtual int getArraySize(void *object, int field) const;

    virtual std::string getFieldAsString(void *object, int field, int i) const;
    virtual bool setFieldAsString(void *object, int field, int i, const char *value) const;

    virtual const char *getFieldStructName(void *object, int field) const;
    virtual void *getFieldStructPointer(void *object, int field, int i) const;
};

Register_ClassDescriptor(ControlMessageDescriptor);

ControlMessageDescriptor::ControlMessageDescriptor() : cClassDescriptor("ControlMessage", "cMessage")
{
}

ControlMessageDescriptor::~ControlMessageDescriptor()
{
}

bool ControlMessageDescriptor::doesSupport(cObject *obj) const
{
    return dynamic_cast<ControlMessage_Base *>(obj)!=NULL;
}

const char *ControlMessageDescriptor::getProperty(const char *propertyname) const
{
    if (!strcmp(propertyname,"customize")) return "true";
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? basedesc->getProperty(propertyname) : NULL;
}

int ControlMessageDescriptor::getFieldCount(void *object) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? 5+basedesc->getFieldCount(object) : 5;
}

unsigned int ControlMessageDescriptor::getFieldTypeFlags(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeFlags(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static unsigned int fieldTypeFlags[] = {
        FD_ISEDITABLE,
        FD_ISEDITABLE,
        FD_ISEDITABLE,
        FD_ISEDITABLE,
        FD_ISEDITABLE,
    };
    return (field>=0 && field<5) ? fieldTypeFlags[field] : 0;
}

const char *ControlMessageDescriptor::getFieldName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldNames[] = {
        "srcAddr",
        "dstAddr",
        "srcSubModule",
        "dstSubModule",
        "type",
    };
    return (field>=0 && field<5) ? fieldNames[field] : NULL;
}

int ControlMessageDescriptor::findField(void *object, const char *fieldName) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    int base = basedesc ? basedesc->getFieldCount(object) : 0;
    if (fieldName[0]=='s' && strcmp(fieldName, "srcAddr")==0) return base+0;
    if (fieldName[0]=='d' && strcmp(fieldName, "dstAddr")==0) return base+1;
    if (fieldName[0]=='s' && strcmp(fieldName, "srcSubModule")==0) return base+2;
    if (fieldName[0]=='d' && strcmp(fieldName, "dstSubModule")==0) return base+3;
    if (fieldName[0]=='t' && strcmp(fieldName, "type")==0) return base+4;
    return basedesc ? basedesc->findField(object, fieldName) : -1;
}

const char *ControlMessageDescriptor::getFieldTypeString(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeString(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldTypeStrings[] = {
        "unsigned int",
        "unsigned int",
        "string",
        "string",
        "unsigned short",
    };
    return (field>=0 && field<5) ? fieldTypeStrings[field] : NULL;
}

const char *ControlMessageDescriptor::getFieldProperty(void *object, int field, const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldProperty(object, field, propertyname);
        field -= basedesc->getFieldCount(object);
    }
    switch (field) {
        case 4:
            if (!strcmp(propertyname,"enum")) return "ControlMessageType";
            return NULL;
        default: return NULL;
    }
}

int ControlMessageDescriptor::getArraySize(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getArraySize(object, field);
        field -= basedesc->getFieldCount(object);
    }
    ControlMessage_Base *pp = (ControlMessage_Base *)object; (void)pp;
    switch (field) {
        default: return 0;
    }
}

std::string ControlMessageDescriptor::getFieldAsString(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldAsString(object,field,i);
        field -= basedesc->getFieldCount(object);
    }
    ControlMessage_Base *pp = (ControlMessage_Base *)object; (void)pp;
    switch (field) {
        case 0: return ulong2string(pp->getSrcAddr());
        case 1: return ulong2string(pp->getDstAddr());
        case 2: return oppstring2string(pp->getSrcSubModule());
        case 3: return oppstring2string(pp->getDstSubModule());
        case 4: return ulong2string(pp->getType());
        default: return "";
    }
}

bool ControlMessageDescriptor::setFieldAsString(void *object, int field, int i, const char *value) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->setFieldAsString(object,field,i,value);
        field -= basedesc->getFieldCount(object);
    }
    ControlMessage_Base *pp = (ControlMessage_Base *)object; (void)pp;
    switch (field) {
        case 0: pp->setSrcAddr(string2ulong(value)); return true;
        case 1: pp->setDstAddr(string2ulong(value)); return true;
        case 2: pp->setSrcSubModule((value)); return true;
        case 3: pp->setDstSubModule((value)); return true;
        case 4: pp->setType(string2ulong(value)); return true;
        default: return false;
    }
}

const char *ControlMessageDescriptor::getFieldStructName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldStructNames[] = {
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
    };
    return (field>=0 && field<5) ? fieldStructNames[field] : NULL;
}

void *ControlMessageDescriptor::getFieldStructPointer(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructPointer(object, field, i);
        field -= basedesc->getFieldCount(object);
    }
    ControlMessage_Base *pp = (ControlMessage_Base *)object; (void)pp;
    switch (field) {
        default: return NULL;
    }
}


