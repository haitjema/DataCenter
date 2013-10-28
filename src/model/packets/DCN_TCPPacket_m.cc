//
// Generated file, do not edit! Created by opp_msgc 4.3 from model/packets/DCN_TCPPacket.msg.
//

// Disable warnings about unused variables, empty switch stmts, etc:
#ifdef _MSC_VER
#  pragma warning(disable:4101)
#  pragma warning(disable:4065)
#endif

#include <iostream>
#include <sstream>
#include "DCN_TCPPacket_m.h"

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




DCN_TCPPacket_Base::DCN_TCPPacket_Base(const char *name, int kind) : DCN_IPPacket(name,kind)
{
    this->setKind(DCN_TCP_PACKET);
    this->setTransportProtocol(IP_PROT_TCP);
}

DCN_TCPPacket_Base::DCN_TCPPacket_Base(const DCN_TCPPacket_Base& other) : DCN_IPPacket(other)
{
    copy(other);
}

DCN_TCPPacket_Base::~DCN_TCPPacket_Base()
{
}

DCN_TCPPacket_Base& DCN_TCPPacket_Base::operator=(const DCN_TCPPacket_Base& other)
{
    if (this==&other) return *this;
    DCN_IPPacket::operator=(other);
    copy(other);
    return *this;
}

void DCN_TCPPacket_Base::copy(const DCN_TCPPacket_Base& other)
{
}

void DCN_TCPPacket_Base::parsimPack(cCommBuffer *b)
{
    DCN_IPPacket::parsimPack(b);
}

void DCN_TCPPacket_Base::parsimUnpack(cCommBuffer *b)
{
    DCN_IPPacket::parsimUnpack(b);
}

class DCN_TCPPacketDescriptor : public cClassDescriptor
{
  public:
    DCN_TCPPacketDescriptor();
    virtual ~DCN_TCPPacketDescriptor();

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

Register_ClassDescriptor(DCN_TCPPacketDescriptor);

DCN_TCPPacketDescriptor::DCN_TCPPacketDescriptor() : cClassDescriptor("DCN_TCPPacket", "DCN_IPPacket")
{
}

DCN_TCPPacketDescriptor::~DCN_TCPPacketDescriptor()
{
}

bool DCN_TCPPacketDescriptor::doesSupport(cObject *obj) const
{
    return dynamic_cast<DCN_TCPPacket_Base *>(obj)!=NULL;
}

const char *DCN_TCPPacketDescriptor::getProperty(const char *propertyname) const
{
    if (!strcmp(propertyname,"customize")) return "true";
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? basedesc->getProperty(propertyname) : NULL;
}

int DCN_TCPPacketDescriptor::getFieldCount(void *object) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? 0+basedesc->getFieldCount(object) : 0;
}

unsigned int DCN_TCPPacketDescriptor::getFieldTypeFlags(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeFlags(object, field);
        field -= basedesc->getFieldCount(object);
    }
    return 0;
}

const char *DCN_TCPPacketDescriptor::getFieldName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    return NULL;
}

int DCN_TCPPacketDescriptor::findField(void *object, const char *fieldName) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? basedesc->findField(object, fieldName) : -1;
}

const char *DCN_TCPPacketDescriptor::getFieldTypeString(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeString(object, field);
        field -= basedesc->getFieldCount(object);
    }
    return NULL;
}

const char *DCN_TCPPacketDescriptor::getFieldProperty(void *object, int field, const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldProperty(object, field, propertyname);
        field -= basedesc->getFieldCount(object);
    }
    switch (field) {
        default: return NULL;
    }
}

int DCN_TCPPacketDescriptor::getArraySize(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getArraySize(object, field);
        field -= basedesc->getFieldCount(object);
    }
    DCN_TCPPacket_Base *pp = (DCN_TCPPacket_Base *)object; (void)pp;
    switch (field) {
        default: return 0;
    }
}

std::string DCN_TCPPacketDescriptor::getFieldAsString(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldAsString(object,field,i);
        field -= basedesc->getFieldCount(object);
    }
    DCN_TCPPacket_Base *pp = (DCN_TCPPacket_Base *)object; (void)pp;
    switch (field) {
        default: return "";
    }
}

bool DCN_TCPPacketDescriptor::setFieldAsString(void *object, int field, int i, const char *value) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->setFieldAsString(object,field,i,value);
        field -= basedesc->getFieldCount(object);
    }
    DCN_TCPPacket_Base *pp = (DCN_TCPPacket_Base *)object; (void)pp;
    switch (field) {
        default: return false;
    }
}

const char *DCN_TCPPacketDescriptor::getFieldStructName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    return NULL;
}

void *DCN_TCPPacketDescriptor::getFieldStructPointer(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructPointer(object, field, i);
        field -= basedesc->getFieldCount(object);
    }
    DCN_TCPPacket_Base *pp = (DCN_TCPPacket_Base *)object; (void)pp;
    switch (field) {
        default: return NULL;
    }
}


