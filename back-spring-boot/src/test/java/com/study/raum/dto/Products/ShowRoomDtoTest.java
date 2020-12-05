package com.study.raum.dto.Products;

import com.study.raum.domain.products.Product;
import com.study.raum.domain.products.ShowRoom;
import com.study.raum.domain.products.ShowRoomProduct;
import com.study.raum.dto.products.ShowRoomDto;
import com.study.raum.dto.products.ShowRoomProductDto;
import com.study.raum.service.common.ToConverter;
import com.study.raum.setting.util.data.ModelConverter;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * ShowRoomDto
 *
 * @author Kimuihyeon
 * @since 2020.12.05
 */

@SpringBootTest
@RunWith(SpringRunner.class)
public class ShowRoomDtoTest {

    private Long id = new Long(1);
    private String thumbnailPath = "/root/test/aaa.jpg"; // 썸네일경로
    private String title = "test Title";
    private String context = "test 내용";
    private List<ShowRoomProduct> showRoomProducts = new ArrayList<>();

    private double bundlePrice = 123939; // 번들 가격
    private double sale = 10;

    @Before
    public void init() {
        for (int i = 0; i < 3; i++) {
            this.showRoomProducts.add(
                    ShowRoomProduct.builder()
                            .x(i)
                            .y(i)
                            .id(new Long(i))
                            .product(Product.builder()
                                    .id(new Long(i))
                                    .name("상품 " + i)
                                    .build())
                            .build()
            );
        }
    }


    @Test
    public void ShowRoom로_변환_test() {
        //given
        ShowRoomDto showRoomDto = ShowRoomDto.builder()
                .id(id)
                .sale(sale)
                .title(title)
                .context(context)
                .bundlePrice(bundlePrice)
                .thumbnailPath(thumbnailPath)
                .build();

        //when
        ShowRoom showRoom = showRoomDto.toEntity();

        //then
        Assert.assertEquals(showRoom.getId(), showRoomDto.getId());
        Assert.assertEquals(showRoom.getSale(), showRoomDto.getSale(), 0);
        Assert.assertEquals(showRoom.getTitle(), showRoomDto.getTitle());
        Assert.assertEquals(showRoom.getContext(), showRoomDto.getContext());
        Assert.assertEquals(showRoom.getBundlePrice(), showRoomDto.getBundlePrice(), 0);
        Assert.assertEquals(showRoom.getThumbnailPath(), showRoomDto.getThumbnailPath());
    }


    @Test
    public void ShowRoomDto로_변환_test() {
        //given
        ShowRoom showRoom = ShowRoom.builder()
                .id(id)
                .sale(sale)
                .title(title)
                .context(context)
                .bundlePrice(bundlePrice)
                .thumbnailPath(thumbnailPath)
                .showRoomProducts(showRoomProducts)
                .build();

        //when
        ShowRoomDto showRoomDto = new ShowRoomDto().of(showRoom);

        //then
        Assert.assertEquals(showRoomDto.getId(), showRoom.getId());
        Assert.assertEquals(showRoomDto.getSale(), showRoom.getSale(), 0);
        Assert.assertEquals(showRoomDto.getTitle(), showRoom.getTitle());
        Assert.assertEquals(showRoomDto.getContext(), showRoom.getContext());
        Assert.assertEquals(showRoomDto.getBundlePrice(), showRoom.getBundlePrice(), 0);
        Assert.assertEquals(showRoomDto.getThumbnailPath(), showRoom.getThumbnailPath());

        Assert.assertEquals(showRoomDto.getShowRoomProducts().get(1).getProduct().getName(), showRoom.getShowRoomProducts().get(1).getProduct().getName());
    }


    @Test
    public void ShowRoomDto로_변환후_Entity로_변환_test() {
        //given
        ShowRoom showRoom = ShowRoom.builder()
                .id(id)
                .sale(sale)
                .title(title)
                .context(context)
                .bundlePrice(bundlePrice)
                .thumbnailPath(thumbnailPath)
                .showRoomProducts(showRoomProducts)
                .build();

        //when
        ShowRoomDto showRoomDto = new ShowRoomDto().of(showRoom);
        ShowRoom transShowroom = showRoomDto.toEntity();

        //then
        Assert.assertEquals(showRoomDto.getId(), transShowroom.getId());
        Assert.assertEquals(showRoomDto.getSale(), transShowroom.getSale(), 0);
        Assert.assertEquals(showRoomDto.getTitle(), transShowroom.getTitle());
        Assert.assertEquals(showRoomDto.getContext(), transShowroom.getContext());
        Assert.assertEquals(showRoomDto.getBundlePrice(), transShowroom.getBundlePrice(), 0);
        Assert.assertEquals(showRoomDto.getThumbnailPath(), transShowroom.getThumbnailPath());
    }

}
