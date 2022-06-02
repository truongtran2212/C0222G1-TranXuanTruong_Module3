package model.service_furama;

public class Service {
    private String idService;
    private String serviceName;
    private int serviceArea;
    private double serviceCost;
    private int serviceMaxpeople;
    private String standardRoom;
    private String descriptionOtherConvenience;
    private double poolArea;
    private int numberOfFloors;
    private int rentTypeId;
    private int serviceTypeId;
    private int status;


    public Service(String idService,
                   String serviceName,
                   int serviceArea,
                   double serviceCost,
                   int serviceMaxpeople,
                   String standardRoom,
                   String descriptionOtherConvenience,
                   double poolArea,
                   int numberOfFloors,
                   int rentTypeId,
                   int serviceTypeId,
                   int status) {


        this.idService = idService;
        this.serviceName = serviceName;
        this.serviceArea = serviceArea;
        this.serviceCost = serviceCost;
        this.serviceMaxpeople = serviceMaxpeople;
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.poolArea = poolArea;
        this.numberOfFloors = numberOfFloors;
        this.rentTypeId = rentTypeId;
        this.serviceTypeId = serviceTypeId;
        this.status = status;
    }

    public Service(String idService,
                   String serviceName,
                   int serviceArea,
                   double serviceCost,
                   int serviceMaxpeople,
                   String standardRoom,
                   String descriptionOtherConvenience,
                   double poolArea,
                   int numberOfFloors,
                   int rentTypeId,
                   int serviceTypeId) {
        this.idService = idService;
        this.serviceName = serviceName;
        this.serviceArea = serviceArea;
        this.serviceCost = serviceCost;
        this.serviceMaxpeople = serviceMaxpeople;
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.poolArea = poolArea;
        this.numberOfFloors = numberOfFloors;
        this.rentTypeId = rentTypeId;
        this.serviceTypeId = serviceTypeId;
    }

    public String getIdService() {
        return idService;
    }

    public void setIdService(String idService) {
        this.idService = idService;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public int getServiceArea() {
        return serviceArea;
    }

    public void setServiceArea(int serviceArea) {
        this.serviceArea = serviceArea;
    }

    public double getServiceCost() {
        return serviceCost;
    }

    public void setServiceCost(double serviceCost) {
        this.serviceCost = serviceCost;
    }

    public int getServiceMaxpeople() {
        return serviceMaxpeople;
    }

    public void setServiceMaxpeople(int serviceMaxpeople) {
        this.serviceMaxpeople = serviceMaxpeople;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getDescriptionOtherConvenience() {
        return descriptionOtherConvenience;
    }

    public void setDescriptionOtherConvenience(String descriptionOtherConvenience) {
        this.descriptionOtherConvenience = descriptionOtherConvenience;
    }

    public double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(double poolArea) {
        this.poolArea = poolArea;
    }

    public int getNumberOfFloors() {
        return numberOfFloors;
    }

    public void setNumberOfFloors(int numberOfFloors) {
        this.numberOfFloors = numberOfFloors;
    }

    public int getRentTypeId() {
        return rentTypeId;
    }

    public void setRentTypeId(int rentTypeId) {
        this.rentTypeId = rentTypeId;
    }

    public int getServiceTypeId() {
        return serviceTypeId;
    }

    public void setServiceTypeId(int serviceTypeId) {
        this.serviceTypeId = serviceTypeId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
