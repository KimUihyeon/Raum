package com.study.raum.dto.members.suppliers;

import com.study.raum.domain.members.Supplier;
import com.study.raum.domain.products.Product;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.OneToMany;
import java.util.ArrayList;
import java.util.List;

/**
 * SupplierDtoTest
 *
 * @author Kimuihyeon
 * @since 2020.12.05
 */

@SpringBootTest
@RunWith(SpringRunner.class)
public class SupplierDtoTest {

    private Long id = new Long(1);
    private String companyName = "(주)테스트 회사";
    private String ceoName = "테스트 대표";
    private String tel = "010-9993-1234";
    private String etc = "기타사항";
    private String address1 = "서울특별시 종로구";
    private String address2 = "떙떙로 1234";
    public String address3 = "땡땡빌딩 1305호";
    private String postNumber = "12344";
    private List<Product> products = new ArrayList<>();

    @Before
    public void init() {
        products.add(Product.builder().id(new Long(1)).name("test1").build());
        products.add(Product.builder().id(new Long(2)).name("test2").build());
        products.add(Product.builder().id(new Long(3)).name("test3").build());
        products.add(Product.builder().id(new Long(4)).name("test4").build());
        products.add(Product.builder().id(new Long(5)).name("test5").build());
    }

    @Test
    public void Supplier로_변환_test() {
        //given
        SupplierDto supplier = SupplierDto.builder()
                .id(id)
                .postNumber(postNumber)
                .address1(address1)
                .address2(address2)
                .address3(address3)
                .etc(etc)
                .tel(tel)
                .ceoName(ceoName)
                .companyName(companyName)
                .build();
        //when
        Supplier supplierDto = supplier.toEntity();

        //then
        Assert.assertEquals(supplier.getId(), supplierDto.getId());
        Assert.assertEquals(supplier.getEtc(), supplierDto.getEtc());
        Assert.assertEquals(supplier.getTel(), supplierDto.getTel());
        Assert.assertEquals(supplier.getCeoName(), supplierDto.getCeoName());
        Assert.assertEquals(supplier.getAddress1(), supplierDto.getAddress1());
        Assert.assertEquals(supplier.getAddress2(), supplierDto.getAddress2());
        Assert.assertEquals(supplier.getAddress3(), supplierDto.getAddress3());
        Assert.assertEquals(supplier.getPostNumber(), supplierDto.getPostNumber());
        Assert.assertEquals(supplier.getCompanyName(), supplierDto.getCompanyName());
    }



    @Test
    public void SupplierDto로_변환_test() {
        //given
        Supplier supplier = Supplier.builder()
                .id(id)
                .postNumber(postNumber)
                .address1(address1)
                .address2(address2)
                .address3(address3)
                .etc(etc)
                .tel(tel)
                .ceoName(ceoName)
                .companyName(companyName)
                .products(products)
                .build();
        //when
        SupplierDto supplierDto = new SupplierDto().of(supplier);

        //then
        Assert.assertEquals(supplier.getId(), supplierDto.getId());
        Assert.assertEquals(supplier.getEtc(), supplierDto.getEtc());
        Assert.assertEquals(supplier.getTel(), supplierDto.getTel());
        Assert.assertEquals(supplier.getCeoName(), supplierDto.getCeoName());
        Assert.assertEquals(supplier.getAddress1(), supplierDto.getAddress1());
        Assert.assertEquals(supplier.getAddress2(), supplierDto.getAddress2());
        Assert.assertEquals(supplier.getAddress3(), supplierDto.getAddress3());
        Assert.assertEquals(supplier.getPostNumber(), supplierDto.getPostNumber());
        Assert.assertEquals(supplier.getCompanyName(), supplierDto.getCompanyName());
        for (int i = 0; i < supplier.getProducts().size(); i++) {
            String originName = supplier.getProducts().get(i).getName();
            String dtoName = supplier.getProducts().get(i).getName();
            Assert.assertEquals(originName, dtoName);
        }
    }



    @Test
    public void SupplierDto로_변환후_Entity로_변환_test() {
        //given
        Supplier supplier = Supplier.builder()
                .id(id)
                .postNumber(postNumber)
                .address1(address1)
                .address2(address2)
                .address3(address3)
                .etc(etc)
                .tel(tel)
                .ceoName(ceoName)
                .companyName(companyName)
                .products(products)
                .build();
        //when
        SupplierDto supplierDto = new SupplierDto().of(supplier);
        Supplier transSupplier = supplierDto.toEntity();

        //then
        Assert.assertEquals(supplier.getId(), transSupplier.getId());
        Assert.assertEquals(supplier.getEtc(), transSupplier.getEtc());
        Assert.assertEquals(supplier.getTel(), transSupplier.getTel());
        Assert.assertEquals(supplier.getCeoName(), transSupplier.getCeoName());
        Assert.assertEquals(supplier.getAddress1(), transSupplier.getAddress1());
        Assert.assertEquals(supplier.getAddress2(), transSupplier.getAddress2());
        Assert.assertEquals(supplier.getAddress3(), transSupplier.getAddress3());
        Assert.assertEquals(supplier.getPostNumber(), transSupplier.getPostNumber());
        Assert.assertEquals(supplier.getCompanyName(), transSupplier.getCompanyName());
    }
}
